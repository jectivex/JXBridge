import JXKit

/// Boxes a native type to access its static and class properties and methods.
final class StaticBox: NativeBox {
    static func create(_ typeName: JXValue, namespace: JXValue, registry: JXRegistry) throws -> StaticBox {
        let typeNameString = try typeName.string
        let namespaceString = try namespace.string
        guard let bridge = registry.bridge(for: typeNameString, namespace: JXNamespace(namespaceString)) else {
            throw JXBridgeErrors.unknownSymbol(namespaceString, typeNameString)
        }
        return StaticBox(bridge: bridge, registry: registry)
    }
    
    init(bridge: JXBridge, registry: JXRegistry) {
        self.bridge = bridge
        self.registry = registry
    }

    let bridge: JXBridge
    let registry: JXRegistry

    func get(property: JXValue) throws -> JXValue {
        let propertyName = try property.string
        if bridge.hasClassProperty(for: propertyName, superclassRegistry: registry) {
            let propertyBridge = try bridge.classProperty(for: propertyName, superclassRegistry: registry)
            return try propertyBridge.get(for: bridge.type, in: property.context)
        } else {
            let propertyBridge = try bridge.staticProperty(for: propertyName, superclassRegistry: registry)
            return try propertyBridge.get(in: property.context)
        }
    }

    func set(property: JXValue, value: JXValue) throws {
        let propertyName = try property.string
        if bridge.hasClassProperty(for: propertyName, superclassRegistry: registry) {
            let propertyBridge = try bridge.classProperty(for: propertyName, superclassRegistry: registry)
            let _ = try propertyBridge.set(for: bridge.type, value: value, in: property.context)
        } else {
            let propertyBridge = try bridge.staticProperty(for: propertyName, superclassRegistry: registry)
            try propertyBridge.set(value: value, in: property.context)
        }
    }

    func call(function: JXValue, arguments args: JXValue) throws -> JXValue {
        let functionName = try function.string
        if bridge.hasClassFunction(for: functionName, superclassRegistry: registry) {
            let functionBridge = try bridge.classFunction(for: functionName, superclassRegistry: registry)
            let (_, result) = try functionBridge.call(for: bridge.type, with: args.array, in: function.context)
            return result
        } else {
            let functionBridge = try bridge.staticFunction(for: functionName, superclassRegistry: registry)
            return try functionBridge.call(with: args.array, in: function.context)
        }
    }
}
