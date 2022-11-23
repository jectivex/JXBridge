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
        try registry.modules.forEach { try initializeModule($0) }
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
    
    private func initializeModule(_ module: JXModule) throws {
        guard let context else {
            return
        }
        try context.global.addNamespace(module.namespace)
        try module.initialize(in: context)
    }
    
    private func defineGlobalFunctions() throws {
        guard let context else {
            return
        }
        try defineNamespace(.default)
        
        // jx.import(namespace.symbol) or jx.import(namespace)
        let importFunction = JXValue(newFunctionIn: context) { [weak self] context, this, args in
            guard let self else {
                throw JXBridgeErrors.invalidContext("Context has been deallocated")
            }
            for arg in args {
                let typeName = try arg[JSCodeGenerator.typeNamePropertyName]
                if typeName.isUndefined {
                    let namespace = try arg[JSCodeGenerator.namespacePropertyName]
                    guard !namespace.isUndefined else {
                        throw JXBridgeErrors.unknownSymbol(try arg.string, "")
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
                throw JXBridgeErrors.invalidContext("Context has been deallocated")
            }
            // Symbol name, namespace name
            guard args.count == 2 else {
                throw JXBridgeErrors.internalError("define")
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
                throw JXBridgeErrors.invalidContext("Context has been deallocated")
            }
            // Type name, namespace name, args array
            guard args.count == 3 else {
                throw JXBridgeErrors.internalError("createNative")
            }
            let instanceBox = try InstanceBox.create(typeName: args[0], namespace: args[1], arguments: args[2], registry: self.registry)
            let object = context.object(peer: instanceBox)
            return object
        }
        try context.global.setProperty(JSCodeGenerator.createNativeFunctionName, createNativeFunction)

        // Create a native static box
        let createStaticNativeFunction = JXValue(newFunctionIn: context) { [weak self] context, this, args in
            guard let self else {
                throw JXBridgeErrors.invalidContext("Context has been deallocated")
            }
            // Type name, namespace name
            guard args.count == 2 else {
                throw JXBridgeErrors.internalError("createStaticNative")
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
                throw JXBridgeErrors.internalError("getProperty")
            }
            return try nativeBox.get(property: args[1])
        }
        try context.global.setProperty(JSCodeGenerator.getPropertyFunctionName, getPropertyFunction)

        let setPropertyFunction = JXValue(newFunctionIn: context) { context, this, args in
            // Instance, property name, value
            guard args.count == 3, let nativeBox = args[0].peer as? NativeBox else {
                throw JXBridgeErrors.internalError("setProperty")
            }
            try nativeBox.set(property: args[1], value: args[2])
            return context.undefined()
        }
        try context.global.setProperty(JSCodeGenerator.setPropertyFunctionName, setPropertyFunction)

        let callFunction = JXValue(newFunctionIn: context) { context, this, args in
            // Instance, function name, args array
            guard args.count == 3, let nativeBox = args[0].peer as? NativeBox else {
                throw JXBridgeErrors.internalError("callFunction")
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
            throw JXBridgeErrors.unsupported("\(namespace.value) does not support importing all symbols")
        }
        guard let module = context.registry.module(for: namespace) else {
            throw JXBridgeErrors.internalError("Module not found in registry: \(namespace.value)")
        }
        guard try module.defineAll(namespace: namespace, in: context) else {
            throw JXBridgeErrors.unsupported("\(namespace.value) does not support importing all symbols")
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
        // Although String is JXConvertible, the NSString class cluster is not
        if let string = value as? NSString {
            return context.string(string as String)
        }
        // Same with NSNumber
        if let number = value as? NSNumber {
            return context.number(number.doubleValue)
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
        guard value.hasProperty(JSCodeGenerator.nativePropertyName) else {
            return nil
        }
        let nativeProperty = try value[JSCodeGenerator.nativePropertyName]
        guard let instanceBox = nativeProperty.peer as? InstanceBox, let instance = instanceBox.instance as? T else {
            return nil
        }
        return instance
    }
    
    private func throwInitializationError() throws {
        // If we didn't initialize cleanly, throw an error for all operations.
        if let initializationError {
            throw initializationError
        }
    }
}
