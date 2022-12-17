import JXKit

/// Boxes a native instance to access its properties and methods.
final class InstanceBox: NativeBox {
    static func create(typeName: JXValue, namespace: JXValue, arguments args: JXValue, registry: JXRegistry) throws -> InstanceBox {
        let typeNameString = try typeName.string
        let namespaceString = try namespace.string
        guard let bridge = registry.bridge(for: typeNameString, namespace: JXNamespace(namespaceString)) else {
            throw JXError.missingBridge(for: typeNameString, namespace: namespaceString)
        }
        let argsArray = try args.array
        let constructor = try bridge.constructor(forParameterCount: argsArray.count, superclassRegistry: registry)
        let instance = try constructor.call(argsArray, in: typeName.context)
        return InstanceBox(instance, bridge: bridge, registry: registry)
    }

    init(_ instance: Any, bridge: JXBridge, registry: JXRegistry) {
        self.instance = instance
        self.bridge = bridge
        self.registry = registry
    }

    var instance: Any
    let bridge: JXBridge
    let registry: JXRegistry

    func get(property: JXValue) throws -> JXValue {
        let propertyBridge = try bridge.property(for: property.string, superclassRegistry: registry)
        return try propertyBridge.get(for: instance, in: property.context)
    }

    func set(property: JXValue, value: JXValue) throws {
        let propertyBridge = try bridge.property(for: property.string, superclassRegistry: registry)
        instance = try propertyBridge.set(for: instance, value: value, in: property.context)
    }

    func call(function: JXValue, arguments args: JXValue) throws -> JXValue {
        let argsArray = try args.array
        let functionBridge = try bridge.function(for: function.string, parameterCount: argsArray.count, superclassRegistry: registry)
        let (instance, ret) = try functionBridge.call(for: instance, with: argsArray, in: function.context)
        self.instance = instance
        return ret
    }
}
