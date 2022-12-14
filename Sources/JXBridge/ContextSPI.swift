import Foundation
import JXKit

/// SPI integration with the `JXContext`.
final class ContextSPI {
    private weak var context: JXContext?
    private var initializationError: Error?
    private var scriptsSubscription: JXCancellable?
    private var registrySubscription: JXCancellable?
    
    init(context: JXContext) {
        self.context = context
        scriptsSubscription = context.onScriptsDidChange { [weak self] scripts in
            // Script changes may add or change symbols in namespaces, so the next time
            // a namespace is imported we should re-check all the symbols
            scripts.forEach { self?.importedNamespaces.remove($0) }
        }
        do {
            try defineGlobalFunctions()
        } catch {
            initializationError = error
        }
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
        registrySubscription = registry.didUpdate.add(newRegistryListener())
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
        _registry = registry
        registrySubscription = registry.didUpdate.add(newRegistryListener())
        try initializeRegistry(registry)
    }
    private var _registry: JXRegistry?
    
    private func newRegistryListener() -> JXRegistryListener {
        weak var weakSelf = self
        var listener = JXRegistryListener()
        listener.didAddNamespace = { try weakSelf?.defineNamespace($0) }
        listener.didRegisterModule = { try weakSelf?.initializeModule($0) }
        listener.didRegisterModuleScript = { try weakSelf?.loadModuleScript($0) }
        listener.didRegisterUnnamespacedBridge = { try weakSelf?.defineClass(for: $0) }
        return listener
    }
    
    private func initializeRegistry(_ registry: JXRegistry) throws {
        try registry.bridges(in: .none).forEach { try defineClass(for: $0) }
        try registry.moduleScripts(in: .none).forEach { try loadModuleScript($0, addErrorContext: true) }
        for namespace in registry.namespaces {
            try defineNamespace(namespace)
            try registry.moduleScripts(in: namespace).forEach { try loadModuleScript($0, addErrorContext: true) }
        }
        try registry.modules.forEach { try initializeModule($0, addErrorContext: true) }
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
    
    private func loadModuleScript(_ script: JXModuleScript, addErrorContext: Bool = false) throws {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        do {
            switch script.source {
            case .resource(let resource, let root):
                try context.evalModule(resource: resource, integratingExports: script.namespace.string, root: root)
            case .jsWithRoot(let js, let root):
                try context.evalModule(js, integratingExports: script.namespace.string, root: root)
            case .js(let js):
                try context.evalModule(js, integratingExports: script.namespace.string)
            }
        } catch {
            // When initialization isn't an immediate result of the dev registering the module, add context to help them track down the problem
            if addErrorContext {
                var error = JXError(cause: error)
                error.message = "Error integrating JavaScript modules for module'\(script.namespace)': \(error.message)"
                throw error
            } else {
                throw error
            }
        }
    }
    
    private func initializeModule(_ module: JXModule, addErrorContext: Bool = false) throws {
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
        
        let importFunction = JXValue(newFunctionIn: context) { [weak self] context, this, args in
            guard let self else {
                throw JXError.contextDeallocated()
            }
            guard args.count == 1 else {
                throw JXError.internalError("import")
            }
            let object = args[0]
            let namespace = try object[JSCodeGenerator.namespaceProperty]
            try self.importNamespace(JXNamespace(namespace.string), value: object)
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
        guard let context, !importedNamespaces.contains(namespace.string) else {
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
            try defineClass(for: bridge, in: context)
        }
        for entry in try value.dictionary {
            // Don't import the namespace name or the import function itself
            guard entry.key != JSCodeGenerator.namespaceProperty && entry.key != JSCodeGenerator.importProperty else {
                continue
            }
            try context.global.setProperty(entry.key, entry.value)
        }
        importedNamespaces.insert(namespace.string)
    }
    private var importedNamespaces: Set<String> = []
}

extension ContextSPI: JXContextSPI {
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
    
    func require(_ value: JXValue) throws -> String? {
        let moduleNameValue = try value[JSCodeGenerator.namespaceProperty]
        guard moduleNameValue.isString else {
            return nil
        }
        return try moduleNameValue.string
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

