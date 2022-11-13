/// Module that auto-registers any `NSObject` type using ObjectiveC reflection.
public class AnyJXBridgingModule: JXModule {
    private let map: (String) -> JXBridging.Type?
    
    /// Supply a map of type names to native types. Unmapped `JXBridging` types are still supported, but only if an instance is conveyed or returned from a native API. You will not be able to construct the type from JavaScript.
    public convenience init(map: [String: JXBridging.Type]) {
        self.init() { map[$0] }
    }
    
    /// Supply a mapping function of type name to native type.
    public init(map: (@escaping (String) -> JXBridging.Type?) = { _ in nil }) {
        self.map = map
    }
    
    /// Whether to bridge instances that are `conveyed` or returned from native API, even if they do not appear in the supplied type name map. Defaults to `true`.
    public var bridgeUnmappedTypes = true
    
    public var namespace = JXRegistry.defaultNamespace
    
    public func initialize(registry: JXRegistry) throws {
    }
    
    public func addBridge(for typeName: String, to registry: JXRegistry) throws -> Bool {
        guard let bridgingType = map(typeName) else {
            return false
        }
        try registry.add(for: bridgingType, namespace: namespace)
        return true
    }

    public func addBridge(for instance: Any, to registry: JXRegistry) throws -> Bool {
        guard let bridgingType = type(of: instance) as? JXBridging.Type else {
            return false
        }
        try registry.add(for: bridgingType, namespace: namespace)
        return true
    }
    
    public func isEquivalent(to module: JXModule) -> Bool {
        guard let bridgingModule = module as? AnyJXBridgingModule else {
            return false
        }
        // We can't compare mapping functions, so instances must be the same
        return bridgingModule === self
    }
}
