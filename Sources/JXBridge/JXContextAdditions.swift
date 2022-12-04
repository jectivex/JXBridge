#if canImport(ObjectiveC)
import Foundation
#endif
import JXKit

extension JXContext {
    /// Register types bridged to JavaScript for use in this context.
    public var registry: JXRegistry {
        // Note: Accessing the registry causes us to access bridgeSPI, which sets our SPI on the context if needed
        return bridgeSPI.registry
    }
    
    /// Set a pre-configured or shared registry for this context.
    public func setRegistry(_ registry: JXRegistry) throws {
        try bridgeSPI.setRegistry(registry)
    }
    
    private var bridgeSPI: JXBridgeContextSPI {
        if let bridgeSPI = self.spi as? JXBridgeContextSPI {
            return bridgeSPI
        }

        // We setup our SPI lazily so that if a context is used directly and doesn't need it, it doesn't incur any overhead
        let bridgeSPI = JXBridgeContextSPI(context: self)
        self.spi = bridgeSPI
        return bridgeSPI
    }
    
    /// Attempts to convey the given closure or function into this JavaScript context as a function.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyClosure<R>(_ f: (() throws -> R)?) throws -> JXValue {
        guard let f else {
            return null()
        }
        return JXValue(newFunctionIn: self) { context, _, args in
            try validate(arguments: args, count: 0)
            let ret = try f()
            return try context.convey(ret)
        }
    }
    
    /// Attempts to convey the given closure or function into this JavaScript context as a function.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyClosure<P0, R>(_ f: ((P0) throws -> R)?) throws -> JXValue {
        guard let f else {
            return null()
        }
        return JXValue(newFunctionIn: self) { context, _, args in
            try validate(arguments: args, count: 1)
            let p0 = try conveyParameters(args, P0.self)
            let ret = try f(p0)
            return try context.convey(ret)
        }
    }
    
    /// Attempts to convey the given closure or function into this JavaScript context as a function.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyClosure<P0, P1, R>(_ f: ((P0, P1) throws -> R)?) throws -> JXValue {
        guard let f else {
            return null()
        }
        return JXValue(newFunctionIn: self) { context, _, args in
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let ret = try f(p.0, p.1)
            return try context.convey(ret)
        }
    }
}

final class JXBridgeContextSPI {
    private weak var context: JXContext?
    private var initializationError: Error?
    
    init(context: JXContext) {
        self.context = context
        do {
            try defineGlobalFunctions()
        } catch {
            initializationError = error
        }
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

    private func initializeRegistry(_ registry: JXRegistry) throws {
        try registry.namespaces.forEach { try defineNamespace($0) }
        try registry.unnamespacedBridges.forEach { try defineClass(for: $0) }
        try registry.modules.forEach { try initializeModule($0, addErrorContext: true) }
    }
    
    private func defineNamespace(_ namespace: JXNamespace) throws {
        guard namespace != .none, let context, !context.global.hasProperty(namespace.value) else {
            return
        }
        try context.eval(JSCodeGenerator.defineNamespaceJSProxy(namespace))
    }
    
    private func defineClass(for bridge: JXBridge) throws {
        guard let context else {
            return
        }
        try defineClass(for: bridge, in: context)
    }
    
    private func initializeModule(_ module: JXModule, addErrorContext: Bool = false) throws {
        guard let context else {
            return
        }
        try context.global.addNamespace(module.namespace)
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
        
        // jx.import(namespace.symbol) or jx.import(namespace)
        let importFunction = JXValue(newFunctionIn: context) { [weak self] context, this, args in
            guard let self else {
                throw JXError.contextDeallocated()
            }
            for arg in args {
                let typeName = try arg[JSCodeGenerator.typeNamePropertyName]
                if typeName.isUndefined {
                    let namespace = try arg[JSCodeGenerator.namespacePropertyName]
                    guard !namespace.isUndefined else {
                        throw JXError(message: "Import error: '\(try arg.string)' is not a known type or namespace")
                    }
                    try self.importNamespace(JXNamespace(namespace.string), value: arg)
                } else {
                    if !(try context.global.hasProperty(typeName)) {
                        try context.global.setProperty(typeName.string, arg)
                    }
                }
            }
            return context.undefined()
        }
        try context.global[JXNamespace.default.value].setProperty("import", importFunction)
        
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
        try context.global.setProperty(JSCodeGenerator.defineFunctionName, defineFunction)
        
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
        try context.global.setProperty(JSCodeGenerator.createNativeFunctionName, createNativeFunction)

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
        try context.global.setProperty(JSCodeGenerator.createStaticNativeFunctionName, createStaticNativeFunction)

        // Get, set, call native properties and methods
        let getPropertyFunction = JXValue(newFunctionIn: context) { context, this, args in
            // Instance, property name
            guard args.count == 2, let nativeBox = args[0].peer as? NativeBox else {
                throw JXError.internalError("getProperty")
            }
            return try nativeBox.get(property: args[1])
        }
        try context.global.setProperty(JSCodeGenerator.getPropertyFunctionName, getPropertyFunction)

        let setPropertyFunction = JXValue(newFunctionIn: context) { context, this, args in
            // Instance, property name, value
            guard args.count == 3, let nativeBox = args[0].peer as? NativeBox else {
                throw JXError.internalError("setProperty")
            }
            try nativeBox.set(property: args[1], value: args[2])
            return context.undefined()
        }
        try context.global.setProperty(JSCodeGenerator.setPropertyFunctionName, setPropertyFunction)

        let callFunction = JXValue(newFunctionIn: context) { context, this, args in
            // Instance, function name, args array
            guard args.count == 3, let nativeBox = args[0].peer as? NativeBox else {
                throw JXError.internalError("callFunction")
            }
            return try nativeBox.call(function: args[1], arguments: args[2])
        }
        try context.global.setProperty(JSCodeGenerator.callFunctionName, callFunction)
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
            throw JXError(message: "Namespace '\(namespace)' does not support importing all symbols. Import specific symbols")
        }
        guard let module = context.registry.module(for: namespace) else {
            throw JXError(message: "Module '\(namespace)' not found in registry")
        }
        guard try module.defineAll(namespace: namespace, in: context) else {
            throw JXError(message: "Module for namespace '\(namespace)' does not support importing all symbols. Import specific symbols")
        }

        // Now that all namespace symbols are defined, move them into the global namespace.
        // First define all registered types
        for bridge in context.registry.bridges(in: namespace) {
            if !value.hasProperty(bridge.typeName) {
                try defineClass(for: bridge, in: context)
            }
        }
        // Now move all namespace properties to global
        for entry in try context.global[namespace].dictionary {
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
        try initializeModule(module)
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
        let obj = try context.new(bridge.qualifiedTypeName, withArguments: [JSCodeGenerator.nativePropertyName])
        let instanceBox = InstanceBox(value, bridge: bridge, registry: registry)
        let nativeBox = context.object(peer: instanceBox)
        try obj.setProperty(JSCodeGenerator.nativePropertyName, nativeBox)
        return obj
    }

    func fromJX<T>(_ value: JXValue, to type: T.Type) throws -> T? {
        try throwInitializationError()
        return try value.bridged as? T
    }
    
    private func throwInitializationError() throws {
        // If we didn't initialize cleanly, throw an error for all operations.
        guard let initializationError else {
            return
        }
        var error = JXError(cause: initializationError)
        error.message = "Unable to initialize JXBridge for this JXContext: \(error.message)"
        throw error
    }
}
