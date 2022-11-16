import JXKit

/// A self-contained set of native functionality exported to JavaScript under a namespace.
public protocol JXModule {
    /// The namespace for this module. Use `none` for modules that auto-register types in any namespace.
    var namespace: JXNamespace { get }
    
    /// Use this function to pre-register types or other required modules. It is called once when the module is added to the registry.
    func register(with registry: JXRegistry) throws
    
    /// Use this function to prepare the context for use with this module. It may be used to add values, `integrate` functionality, etc.
    func initialize(in context: JXContext) throws
    
    /// Add a bridge for the given type name used in JavaScript, or return `false` if it is an unknown type. This will not be called for pre-registered types.
    func addBridge(for typeName: String, namespace: JXNamespace, to registry: JXRegistry) throws -> Bool
    
    /// Add a bridge for the given conveyed or returned instance, or return `false` if the instance does not belong to this module. This will not be called for pre-registered types.
    func addBridge(for instance: Any, to registry: JXRegistry) throws -> Bool
}

extension JXModule {
    public func register(with registry: JXRegistry) {
    }
    
    public func initialize(in context: JXContext) {
    }
    
    public func addBridge(for typeName: String, namespace: JXNamespace, to registry: JXRegistry) -> Bool {
        return false
    }
    
    public func addBridge(for instance: Any, to registry: JXRegistry) -> Bool {
        return false
    }
}
