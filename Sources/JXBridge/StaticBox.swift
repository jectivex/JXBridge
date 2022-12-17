import JXKit

/// Boxes a native type to access its static and class properties and methods.
final class StaticBox: NativeBox {
    static func create(_ typeName: JXValue, namespace: JXValue, registry: JXRegistry) throws -> StaticBox {
        let typeNameString = try typeName.string
        let namespaceString = try namespace.string
        guard let bridge = registry.bridge(for: typeNameString, namespace: JXNamespace(namespaceString)) else {
            throw JXError.missingBridge(for: typeNameString, namespace: namespaceString)
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
        let argsArray = try args.array
        if bridge.hasClassFunction(for: functionName, parameterCount: argsArray.count, superclassRegistry: registry) {
            let functionBridge = try bridge.classFunction(for: functionName, parameterCount: argsArray.count, superclassRegistry: registry)
            let (_, result) = try functionBridge.call(for: bridge.type, with: argsArray, in: function.context)
            return result
        } else {
            let functionBridge = try bridge.staticFunction(for: functionName, parameterCount: argsArray.count, superclassRegistry: registry)
            return try functionBridge.call(with: argsArray, in: function.context)
        }
    }
}
