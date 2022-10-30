import Foundation
import JXKit

extension JXContext {
    private var bridgeSPI: JXBridgeContextSPI {
        if let bridgeSPI = self.spi as? JXBridgeContextSPI {
            return bridgeSPI
        }

        let bridgeSPI = JXBridgeContextSPI()
        self.spi = bridgeSPI
        do {
            try bridgeSPI.prepare(self)
        } catch {
            fatalError("Unable to initialize JXBridge: \(error))")
        }
        return bridgeSPI
    }

    /// Register types bridged to JavaScript for use in this context.
    public var registry: JXBridgeRegistry {
        get {
            return bridgeSPI.registry
        }
        set {
            bridgeSPI.registry = newValue
        }
    }

    // TODO: Remove need to import types: we can detect use via a proxy object in JS and via checking return types from native methods and auto-import

    /// Import the given type for use in this context.
    public func `import`(_ type: Any.Type) throws {
        try bridgeSPI.import(type, in: self)
    }
}

class JXBridgeContextSPI {
    lazy var registry = JXBridgeRegistry()

    func prepare(_ context: JXContext) throws {
        try defineInitialFunctions(in: context)
        try context.eval(JSCodeGenerator.defineInitialFunctions())
    }

    func `import`(_ type: Any.Type, in context: JXContext) throws {
        try defineNativeAccessFunctions(in: context)
        let bridge = try registry.bridge(for: type)
        try defineClass(for: bridge, in: context)
    }

    private func defineInitialFunctions(in context: JXContext) throws {
        let importFunction = JXValue(newFunctionIn: context) { [weak self] context, this, args in
            guard let self else {
                throw JXBridgeErrors.invalidContext
            }
            guard args.count == 1 else {
                throw JXBridgeErrors.internalError("import")
            }
            let bridge = try self.registry.bridge(for: args[0].string)
            try self.defineNativeAccessFunctions(in: context)
            try self.defineClass(for: bridge, in: context)
            return context.undefined()
        }
        try context.global.setProperty(JSCodeGenerator.importFunctionName, importFunction)
    }

    private func defineNativeAccessFunctions(in context: JXContext) throws {
        guard !hasDefinedNativeAccessFunctions else {
            return
        }
        hasDefinedNativeAccessFunctions = true

        // Create a native instance box
        let createNativeFunction = JXValue(newFunctionIn: context) { [weak self] context, this, args in
            guard let self else {
                throw JXBridgeErrors.invalidContext
            }
            guard args.count == 2 else {
                throw JXBridgeErrors.internalError("createNative")
            }
            let instanceBox = try InstanceBox.create(typeName: args[0], arguments: args[1], registry: self.registry)
            let object = context.object(peer: instanceBox)
            return object
        }
        try context.global.setProperty(JSCodeGenerator.createNativeFunctionName, createNativeFunction)

        // Create a native static box
        let createStaticNativeFunction = JXValue(newFunctionIn: context) { [weak self] context, this, args in
            guard let self else {
                throw JXBridgeErrors.invalidContext
            }
            guard args.count == 1 else {
                throw JXBridgeErrors.internalError("createStaticNative")
            }
            let staticBox = try StaticBox.create(args[0], registry: self.registry)
            let object = context.object(peer: staticBox)
            return object
        }
        try context.global.setProperty(JSCodeGenerator.createStaticNativeFunctionName, createStaticNativeFunction)

        // Get, set, call native properties and methods
        let getPropertyFunction = JXValue(newFunctionIn: context) { context, this, args in
            guard args.count == 2, let nativeBox = args[0].peer as? NativeBox else {
                throw JXBridgeErrors.internalError("getProperty")
            }
            return try nativeBox.get(property: args[1])
        }
        try context.global.setProperty(JSCodeGenerator.getPropertyFunctionName, getPropertyFunction)

        let setPropertyFunction = JXValue(newFunctionIn: context) { context, this, args in
            guard args.count == 3, let nativeBox = args[0].peer as? NativeBox else {
                throw JXBridgeErrors.internalError("setProperty")
            }
            try nativeBox.set(property: args[1], value: args[2])
            return context.undefined()
        }
        try context.global.setProperty(JSCodeGenerator.setPropertyFunctionName, setPropertyFunction)

        let callFunction = JXValue(newFunctionIn: context) { context, this, args in
            guard args.count == 3, let nativeBox = args[0].peer as? NativeBox else {
                throw JXBridgeErrors.internalError("callFunction")
            }
            return try nativeBox.call(function: args[1], arguments: args[2])
        }
        try context.global.setProperty(JSCodeGenerator.callFunctionName, callFunction)
    }
    private var hasDefinedNativeAccessFunctions = false

    private func defineClass(for bridge: JXBridge, in context: JXContext) throws {
        guard !definedTypeNames.contains(bridge.typeName) else {
            return
        }
        let superclassBridge = bridge.hasSuperclass(in: registry) ? try bridge.superclass(in: registry) : nil
        if let superclassBridge {
            try defineClass(for: superclassBridge, in: context)
        }
        let codeGenerator = JSCodeGenerator(bridge: bridge, superclassBridge: superclassBridge)
        let definition = codeGenerator.defineJSClass()
        try context.eval(definition)
        definedTypeNames.insert(bridge.typeName)
    }
    private var definedTypeNames: Set<String> = []
}

extension JXBridgeContextSPI: JXContextSPI {
    func toJX(_ value: Any, in context: JXContext) throws -> JXValue? {
//~~~ This is also called for convey() not just param and return types. Need to figure out proper auto-register behavior
        let valueType = type(of: value)
        if !registry.hasBridge(for: valueType) {
            if let jxbridging = value as? JXBridging {
                registry.add(for: jxbridging)
            } else {
#if canImport(ObjectiveC)
                if let nsobject = value as? NSObject {
                    registry.add(forObjectiveCType: type(of: nsobject))
                } else {
                    return nil
                }
#else
                return nil
#endif
            }
        }

        var bridge = try registry.bridge(for: valueType)
        if !bridge.includesInstanceInfo && value is JXBridging {
            let builder = MirrorBuilder(Mirror(reflecting: value), bridge: bridge)
            builder.addReflectedMembers()
            registry.add(builder.bridge)
            bridge = try registry.bridge(for: valueType)
        }

        // Construct with a special argument to avoid creating a new native instance on construction, then inject our value instance
        let obj = try context.eval("new \(bridge.typeName)('\(JSCodeGenerator.nativePropertyName)')")
        let instanceBox = InstanceBox(value, bridge: bridge, registry: registry)
        let nativeBox = context.object(peer: instanceBox)
        try obj.setProperty(JSCodeGenerator.nativePropertyName, nativeBox)
        return obj
    }

    func fromJX<T>(_ value: JXValue, to type: T.Type) throws -> T? {
        guard value.hasProperty(JSCodeGenerator.nativePropertyName) else {
            return nil
        }
        let nativeProperty = try value[JSCodeGenerator.nativePropertyName]
        guard let instanceBox = nativeProperty.peer as? InstanceBox, let instance = instanceBox.instance as? T else {
            return nil
        }
        return instance
    }
}
