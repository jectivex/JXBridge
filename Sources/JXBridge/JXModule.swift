/// A self-contained set of native functionality exported to JavaScript under a namespace.
public protocol JXModule {
    /// The namespace for this module. Must initially be set to the module default, but may be overridden by module users.
    var namespace: String { get set }
    
    /// Initialize this module. Use this function to pre-register types or other required modules.
    func initialize(registry: JXRegistry) throws
    
    /// Add a bridge for the given type name used in JavaScript, or return `false` if it is an unknown type. This will not be called for pre-registered types.
    func addBridge(for typeName: String, to registry: JXRegistry) throws -> Bool
    
    /// Add a bridge for the given conveyed or returned instance, or return `false` if the instance does not belong to this module. This will not be called for pre-registered types.
    func addBridge(for instance: Any, to registry: JXRegistry) throws -> Bool
    
    /// Whether these modules are equivalent. This is used to detect when a module that has already been registered.
    func isEquivalent(to module: JXModule) -> Bool
}
