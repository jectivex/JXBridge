/// Module that auto-registers `JXBridging` types:
/// 1. To support constructing instances from JavaScript, supply a map of qualified type name -> `JXBridging` native type.
/// 2. Any `JXBridging` instance returne from bridged functions and properties will automatically be bridged.
public struct AnyJXBridgingModule: JXModule {
    private let map: (String, JXNamespace) -> JXBridging.Type?
    
    /// To construct instances in JavaScript, supply a map of namespace-qualified type names to native types.
    public init(map: [String: JXBridging.Type]) {
        self.init(map: { map[$1.value + "." + $0] })
    }
    
    /// To construct instances in JavaScript, supply a mapping function of `(typeName, namespace) -> JXBridging`.
    public init(map: (@escaping (String, JXNamespace) -> JXBridging.Type?) = { _, _ in nil }) {
        self.map = map
    }
    
    public let namespace: JXNamespace = .any
    
    public func initialize(registry: JXRegistry) throws {
    }
    
    public func addBridge(for typeName: String, namespace: JXNamespace, to registry: JXRegistry) throws -> Bool {
        guard let bridgingType = map(typeName, namespace) else {
            return false
        }
        try registry.add(for: bridgingType)
        return true
    }

    public func addBridge(for instance: Any, to registry: JXRegistry) throws -> Bool {
        guard let bridgingType = type(of: instance) as? JXBridging.Type else {
            return false
        }
        try registry.add(for: bridgingType)
        return true
    }
}
