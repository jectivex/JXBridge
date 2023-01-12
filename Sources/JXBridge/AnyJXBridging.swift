import JXKit

/// Module that auto-registers ``JXBridging`` types:
/// 1. To support constructing instances from JavaScript, supply a map of qualified type name -> ``JXBridging`` types.
/// 2. Any ``JXBridging`` instance returned from bridged functions and properties will automatically be bridged.
public struct AnyJXBridging: JXModule {
    private let map: (String, JXNamespace) -> JXBridging.Type?
    
    /// To construct instances in JavaScript, supply a map of namespace-qualified type names to ``JXBridging`` types.
    public init(map: [String: JXBridging.Type]) {
        func qualifiedTypeName(_ typeName: String, namespace: JXNamespace) -> String {
            guard namespace != .none else {
                return typeName
            }
            return "\(namespace).\(typeName)"
        }
        self.init(map: { map[qualifiedTypeName($0, namespace: $1)] })
    }
    
    /// To construct instances in JavaScript, supply a mapping function of `(typeName, namespace)` to ``JXBridging`` types.
    public init(map: (@escaping (String, JXNamespace) -> JXBridging.Type?) = { _, _ in nil }) {
        self.map = map
    }
    
    public static let namespace: JXNamespace = .none
    
    public func define(symbol: String, namespace: JXNamespace, in context: JXContext) throws -> Bool {
        guard let value = map(symbol, namespace) else {
            return false
        }
        try context.registry.registerBridge(for: value, namespace: namespace)
        return true
    }

    public func define(for instance: Any, in context: JXContext) throws -> Bool {
        guard let bridgingType = type(of: instance) as? JXBridging.Type else {
            return false
        }
        try context.registry.registerBridge(for: bridgingType)
        return true
    }
}
