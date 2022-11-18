import JXKit

/// Module that auto-registers `JXBridging` and `JXStaticBridging` types:
/// 1. To support constructing instances from JavaScript, supply a map of qualified type name -> `JXBridging` instances or `JXStaticBridging` types.
/// 2. Any `JXBridging` or `JXStaticBridging` instance returned from bridged functions and properties will automatically be bridged.
public struct AnyJXBridging: JXModule {
    private let map: (String, JXNamespace) -> Any?
    
    /// To construct instances in JavaScript, supply a map of namespace-qualified type names to `JXBridging` instances or `JXStaticBridging` types.
    public init(map: [String: Any]) {
        func qualifiedTypeName(_ typeName: String, namespace: JXNamespace) -> String {
            guard namespace != .none else {
                return typeName
            }
            return namespace.value + "." + typeName
        }
        self.init(map: { map[qualifiedTypeName($0, namespace: $1)] })
    }
    
    /// To construct instances in JavaScript, supply a mapping function of `(typeName, namespace)` to `JXBridging` instances or `JXStaticBridging` types.
    public init(map: (@escaping (String, JXNamespace) -> Any?) = { _, _ in nil }) {
        self.map = map
    }
    
    public let namespace: JXNamespace = .none
    
    public func registerBridge(for typeName: String, namespace: JXNamespace, in registry: JXRegistry) throws -> Bool {
        guard let value = map(typeName, namespace) else {
            return false
        }
        if let bridging = value as? JXBridging {
            try registry.registerBridge(for: bridging, namespace: namespace)
        } else if let bridgingType = value as? JXStaticBridging.Type {
            try registry.registerBridge(for: bridgingType, namespace: namespace)
        } else {
            return false
        }
        return true
    }

    public func registerBridge(for instance: Any, in registry: JXRegistry) throws -> Bool {
        if let bridging = instance as? JXBridging {
            try registry.registerBridge(for: bridging)
        } else if let bridgingType = type(of: instance) as? JXStaticBridging.Type {
            try registry.registerBridge(for: bridgingType)
        } else {
            return false
        }
        return true
    }
}
