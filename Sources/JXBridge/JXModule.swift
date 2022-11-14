/// A self-contained set of native functionality exported to JavaScript under a namespace.
public protocol JXModule {
    /// The namespace for this module. Use `any` for modules that auto-register types in any namespace.
    var namespace: JXNamespace { get }
    
    /// Initialize this module. Use this function to pre-register types or other required modules.
    func initialize(registry: JXRegistry) throws
    
    /// Add a bridge for the given type name used in JavaScript, or return `false` if it is an unknown type. This will not be called for pre-registered types.
    func addBridge(for typeName: String, namespace: JXNamespace, to registry: JXRegistry) throws -> Bool
    
    /// Add a bridge for the given conveyed or returned instance, or return `false` if the instance does not belong to this module. This will not be called for pre-registered types.
    func addBridge(for instance: Any, to registry: JXRegistry) throws -> Bool
}
