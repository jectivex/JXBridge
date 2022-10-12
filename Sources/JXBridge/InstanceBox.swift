import JXKit

/// Boxes a native instance to access its properties and methods.
class InstanceBox: NativeBox {
    static func create(typeName: JXValue, arguments args: JXValue, registry: JXBridgeRegistry) throws -> InstanceBox {
        let bridge = try registry.bridge(for: typeName.string)
        let argsArray = try args.array
        let constructor = try bridge.constructor(forParameterCount: argsArray.count, superclassRegistry: registry)
        let instance = try constructor.call(argsArray, in: typeName.context)
        return InstanceBox(instance, bridge: bridge, registry: registry)
    }

    init(_ instance: Any, bridge: JXBridge, registry: JXBridgeRegistry) {
        self.instance = instance
        self.bridge = bridge
        self.registry = registry
    }

    var instance: Any
    let bridge: JXBridge
    let registry: JXBridgeRegistry

    func get(property: JXValue) throws -> JXValue {
        let propertyBridge = try bridge.property(for: property.string, superclassRegistry: registry)
        return try propertyBridge.get(for: instance, in: property.context)
    }

    func set(property: JXValue, value: JXValue) throws {
        let propertyBridge = try bridge.property(for: property.string, superclassRegistry: registry)
        instance = try propertyBridge.set(for: instance, value: value, in: property.context)
    }

    func call(function: JXValue, arguments args: JXValue) throws -> JXValue {
        let functionBridge = try bridge.function(for: function.string, superclassRegistry: registry)
        let (instance, ret) = try functionBridge.call(for: instance, with: args.array, in: function.context)
        self.instance = instance
        return ret
    }
}
