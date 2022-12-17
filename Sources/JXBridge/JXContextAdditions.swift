#if canImport(Foundation)
import Foundation
#endif
import JXKit

extension JXContext {
#if canImport(Foundation)
    
    /// Evaluate the JavaScript contained in the given resource.
    ///
    /// - Parameters:
    ///   - root: The location the given resource is relative to, typically `Bundle.module.resourceURL` for a Swift package. This is used to locate the resource and any scripts it references via `require`.
    public func eval(resource: String, root: URL, this: JXValue? = nil) throws -> JXValue {
        return try prepareBridge(throwing: true).moduleManager.eval(resource: resource, root: root, this: this)
    }
    
    /// Evaluate the JavaScript contained in the given resource with module semantics, returning its exports.
    ///
    /// - Parameters:
    ///   - root: The location the given resource is relative to, typically `Bundle.module.resourceURL` for a Swift package. This is used to locate the resource and any scripts it references via `require`.
    ///   - cacheExports: Whether to cache the module exports for future `eval` and `require` calls
    public func evalModule(resource: String, root: URL, cacheExports: Bool = false) throws -> JXValue {
        return try prepareBridge(throwing: true).moduleManager.evalModule(resource: resource, root: root, cacheExports: cacheExports)
    }
    
#endif
    
    /// Evaluate the given JavaScript with module semantics, returning its exports.
    public func evalModule(_ script: String) throws -> JXValue {
        return try prepareBridge(throwing: true).moduleManager.evalModule(script)
    }
    
    /// Prepare this context for use with JavaScript and native bridging.
    ///
    /// - Note: Bridge preparation typically happens implicitly when you access the `registry` property. Use this function to prepare explicitly and possibly handle any errors that occur.
    public func prepareBridge() throws {
        let _ = try prepareBridge(throwing: true)
    }
    
    /// Register types bridged to JavaScript for use in this context.
    public var registry: JXRegistry {
        return (try? prepareBridge(throwing: false))?.registry ?? JXRegistry()
    }
    
    /// Set a pre-configured or shared registry for this context.
    public func setRegistry(_ registry: JXRegistry) throws {
        try prepareBridge(throwing: true).setRegistry(registry)
    }
    
    private func prepareBridge(throwing: Bool) throws -> JXBridgeContextSPI {
        if let bridgeSPI = spi as? JXBridgeContextSPI {
            return bridgeSPI
        }
        let bridgeSPI = JXBridgeContextSPI(context: self)
        if throwing {
            try bridgeSPI.throwInitializationError()
        }
        spi = bridgeSPI
        return bridgeSPI
    }
}

final class JXBridgeContextSPI {
    private weak var context: JXContext?
    private var initializationError: Error?
    
    init(context: JXContext) {
        self.context = context
        self.moduleManager = JSModuleManager(context: context)
        do {
            try defineGlobalFunctions()
        } catch {
            initializationError = error
        }
    }
    
    init(tryContext: JXContext) throws {
        self.context = tryContext
        self.moduleManager = JSModuleManager(context: tryContext)
        try defineGlobalFunctions()
    }
    
    func throwInitializationError() throws {
        // If we didn't initialize cleanly, throw an error for all operations
        guard let initializationError else {
            return
        }
        var error = JXError(cause: initializationError)
        error.message = "Unable to initialize JXBridge for this JXContext: \(error.message)"
        throw error
    }
    
    var registry: JXRegistry {
        if let _registry {
            return _registry
        }
        let registry = JXRegistry()
        _registry = registry
        registry.listeners.addListener(self)
        do {
            try initializeRegistry(registry)
        } catch {
            if initializationError == nil {
                initializationError = error
            }
        }
        return registry
    }
    
    func setRegistry(_ registry: JXRegistry) throws {
        guard registry !== _registry else {
            return
        }
        _registry?.listeners.removeListener(self)
        _registry = registry
        registry.listeners.addListener(self)
        try initializeRegistry(registry)
    }
    private var _registry: JXRegistry?
    
    let moduleManager: JSModuleManager
    
    private func initializeRegistry(_ registry: JXRegistry) throws {
        try registry.bridges(in: .none).forEach { try defineClass(for: $0) }
        try registry.moduleScripts(in: .none).forEach { try loadModuleScript($0, addErrorContext: true) }
        for namespace in registry.namespaces {
            try defineNamespace(namespace)
            try registry.moduleScripts(in: namespace).forEach { try loadModuleScript($0, addErrorContext: true) }
        }
        try registry.modules.forEach { try initializeModule($0, registry: registry, addErrorContext: true) }
    }
    
    private func defineNamespace(_ namespace: JXNamespace) throws {
        guard let context, namespace != .none else {
            return
        }
        try context.global.addNamespace(namespace)
    }
    
    private func defineClass(for bridge: JXBridge) throws {
        guard let context else {
            return
        }
        try defineClass(for: bridge, in: context)
    }
    
    private func loadModuleScript(_ script: JSModuleScript, addErrorContext: Bool = false) throws {
        guard let context else {
            return
        }
        let exports: JXValue
        switch script.source {
#if canImport(Foundation)
        case .resource(let resource, let root):
            exports = try moduleManager.evalModule(resource: resource, root: root, cacheExports: false)
#endif
        case .js(let js):
            exports = try moduleManager.evalModule(js)
        }
        try context.global[script.namespace].integrate(exports)
    }
    
    private func initializeModule(_ module: JXModule, registry: JXRegistry, addErrorContext: Bool = false) throws {
        guard let context else {
            return
        }
        do {
            try module.initialize(in: context)
        } catch {
            // When initialization isn't an immediate result of the dev registering the module, add context to help them track down the problem
            if addErrorContext {
                var error = JXError(cause: error)
                error.message = "Unable to initialize module '\(module.namespace)': \(error.message)"
                throw error
            } else {
                throw error
            }
        }
    }
    
    private func defineGlobalFunctions() throws {
        guard let context else {
            return
        }
        try defineNamespace(.default)
        
        let require = JXValue(newFunctionIn: context) { [weak self] context, this, args in
            guard let self else {
                return context.undefined()
            }
            guard args.count == 1 && args[0].isString else {
                throw JXError(message: "'require' expects a single string argument")
            }
            return try self.moduleManager.require(args[0].string)
        }
        try context.global.setProperty("require", require)
        try context.global.setProperty(JSCodeGenerator.moduleExportsCacheObject, context.object())
        
        let importFunction = JXValue(newFunctionIn: context) { [weak self] context, this, args in
            guard let self else {
                throw JXError.contextDeallocated()
            }
            guard args.count == 1 else {
                throw JXError.internalError("import")
            }
            let object = args[0]
            let namespace = try object[JSCodeGenerator.namespaceProperty]
            if namespace.isUndefined {
                try self.importProperties(of: object)
            } else {
                try self.importNamespace(JXNamespace(namespace.string), value: object)
            }
            return object
        }
        try context.global.setProperty(JSCodeGenerator.importFunction, importFunction)
        
        // Define a symbol accessed through a namespace
        let defineFunction = JXValue(newFunctionIn: context) { [weak self] context, this, args in
            guard let self else {
                throw JXError.contextDeallocated()
            }
            // Symbol name, namespace name
            guard args.count == 2 else {
                throw JXError.internalError("define")
            }
            let symbolName = try args[0].string
            let namespace = try args[1].string
            
            if let bridge = try self.registry.bridge(for: symbolName, namespace: JXNamespace(namespace), definingIn: context) {
                try self.defineClass(for: bridge, in: context)
            }
            return context.undefined()
        }
        try context.global.setProperty(JSCodeGenerator.defineFunction, defineFunction)
        
        // Create a native instance box
        let createNativeFunction = JXValue(newFunctionIn: context) { [weak self] context, this, args in
            guard let self else {
                throw JXError.contextDeallocated()
            }
            // Type name, namespace name, args array
            guard args.count == 3 else {
                throw JXError.internalError("createNative")
            }
            let instanceBox = try InstanceBox.create(typeName: args[0], namespace: args[1], arguments: args[2], registry: self.registry)
            let object = context.object(peer: instanceBox)
            return object
        }
        try context.global.setProperty(JSCodeGenerator.createNativeFunction, createNativeFunction)

        // Create a native static box
        let createStaticNativeFunction = JXValue(newFunctionIn: context) { [weak self] context, this, args in
            guard let self else {
                throw JXError.contextDeallocated()
            }
            // Type name, namespace name
            guard args.count == 2 else {
                throw JXError.internalError("createStaticNative")
            }
            let staticBox = try StaticBox.create(args[0], namespace: args[1], registry: self.registry)
            let object = context.object(peer: staticBox)
            return object
        }
        try context.global.setProperty(JSCodeGenerator.createStaticNativeFunction, createStaticNativeFunction)

        // Get, set, call native properties and methods
        let getPropertyFunction = JXValue(newFunctionIn: context) { context, this, args in
            // Instance, property name
            guard args.count == 2, let nativeBox = args[0].peer as? NativeBox else {
                throw JXError.internalError("getProperty")
            }
            return try nativeBox.get(property: args[1])
        }
        try context.global.setProperty(JSCodeGenerator.getPropertyFunction, getPropertyFunction)

        let setPropertyFunction = JXValue(newFunctionIn: context) { context, this, args in
            // Instance, property name, value
            guard args.count == 3, let nativeBox = args[0].peer as? NativeBox else {
                throw JXError.internalError("setProperty")
            }
            try nativeBox.set(property: args[1], value: args[2])
            return context.undefined()
        }
        try context.global.setProperty(JSCodeGenerator.setPropertyFunction, setPropertyFunction)

        let callFunction = JXValue(newFunctionIn: context) { context, this, args in
            // Instance, function name, args array
            guard args.count == 3, let nativeBox = args[0].peer as? NativeBox else {
                throw JXError.internalError("callFunction")
            }
            return try nativeBox.call(function: args[1], arguments: args[2])
        }
        try context.global.setProperty(JSCodeGenerator.callFunction, callFunction)
    }

    private func defineClass(for bridge: JXBridge, in context: JXContext) throws {
        guard !definedTypeNames.contains(bridge.qualifiedTypeName) else {
            return
        }
        let superclassBridge = bridge.superclassBridge(in: registry)
        if let superclassBridge {
            try defineClass(for: superclassBridge, in: context)
        }
        let codeGenerator = JSCodeGenerator(bridge: bridge, superclassBridge: superclassBridge)
        let definition = codeGenerator.defineJSClass()
        try context.eval(definition)
        definedTypeNames.insert(bridge.qualifiedTypeName)
    }
    private var definedTypeNames: Set<String> = []
    
    private func importNamespace(_ namespace: JXNamespace, value: JXValue) throws {
        guard let context else {
            return
        }
        guard namespace != .none && namespace != .default else {
            throw JXError(message: "Namespace '\(namespace)' does not support import()")
        }
        if let module = context.registry.module(for: namespace) {
            guard try module.defineAll(namespace: namespace, in: context) else {
                throw JXError(message: "Module for namespace '\(namespace)' does not support import()")
            }
        }
        
        // Now that all namespace symbols are defined, move them into the global namespace.
        // First define all registered types
        for bridge in context.registry.bridges(in: namespace) {
            if !value.hasProperty(bridge.typeName) {
                try defineClass(for: bridge, in: context)
            }
        }
        try importProperties(of: value)
    }
    
    private func importProperties(of value: JXValue) throws {
        guard let context else {
            return
        }
        for entry in try value.dictionary {
            // Don't import the namespace name (if present) or the import function itself
            guard entry.key != JSCodeGenerator.namespaceProperty && entry.key != "import" else {
                continue
            }
            if !context.global.hasProperty(entry.key) {
                try context.global.setProperty(entry.key, entry.value)
            }
        }
    }
}

extension JXBridgeContextSPI: RegistryListener {
    func didAddNamespace(_ namespace: JXNamespace) throws {
        try defineNamespace(namespace)
    }
    
    func didRegisterModule(_ module: JXModule) throws {
        try initializeModule(module, registry: registry)
    }
    
    func didRegisterModuleScript(_ script: JSModuleScript) throws {
        try loadModuleScript(script)
    }
    
    func didRegisterUnnamespacedBridge(_ bridge: JXBridge) throws {
        try defineClass(for: bridge)
    }
}

extension JXBridgeContextSPI: JXContextSPI {
    func eval(_ script: String, this: JXValue?, in: JXContext) throws -> JXValue? {
        try throwInitializationError()
        return nil
    }
    
    func toJX(_ value: Any, in context: JXContext) throws -> JXValue? {
        try throwInitializationError()
        
#if canImport(ObjectiveC)
        // Although String, Int, Array, Dictionary, etc are JXConvertible, the NS* equivalents are not
        if let nsstring = value as? NSString {
            return context.string(nsstring as String)
        }
        if let nsnumber = value as? NSNumber {
            return context.number(nsnumber.doubleValue)
        }
        if let nsarray = value as? NSArray {
            return try context.array(nsarray as [AnyObject])
        }
        if let nsdict = value as? NSDictionary {
            let dict = nsdict.reduce(into: [String: Any]()) { result, entry in
                if let stringKey = entry.key as? String {
                    result[stringKey] = entry.value
                }
            }
            return try context.object(fromDictionary: dict)
        }
#endif
        
        guard let bridge = try registry.bridge(for: value, definingIn: context) else {
            return nil
        }

        // Construct with a special argument to avoid creating a new native instance on construction, then inject our value instance
        let obj = try context.new(bridge.qualifiedTypeName, withArguments: [JSCodeGenerator.nativeProperty])
        let instanceBox = InstanceBox(value, bridge: bridge, registry: registry)
        let nativeBox = context.object(peer: instanceBox)
        try obj.setProperty(JSCodeGenerator.nativeProperty, nativeBox)
        return obj
    }

    func fromJX<T>(_ value: JXValue, to type: T.Type) throws -> T? {
        try throwInitializationError()
        return try value.bridged as? T
    }
    
    func errorDetail(conveying type: Any.Type) -> String? {
        let typeString = String(describing: type)
        if typeString.range(of: "->") != nil {
            return "If this is a function or closure, you may have to wrap it in a JXClosure. See documentation for details"
        } else if typeString.first == "(" && typeString.last == ")" {
            return "If this is a tuple, you may have to wrap it in a JXTuple. See the documentation for details"
        } else {
            return nil
        }
    }
}
