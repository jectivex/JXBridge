import JXKit

/// A self-contained set of native functionality exported to JavaScript under a namespace.
public protocol JXModule {
    /// The namespace for this module. Use ``JXNamespace/none`` for modules that auto-register types in any namespace.
    var namespace: JXNamespace { get }
    
    /// Use this function to pre-register types or other required modules. It is called once when the module is added to the registry.
    func register(with registry: JXRegistry) throws
    
    /// Use this function to prepare the context for use with this module. It may be used to add values, `integrate` functionality, etc.
    func initialize(in context: JXContext) throws
    
    /// This function is called to lazily define symbols accessed on this namespace. Use it to add values, register bridges, etc.
    ///
    /// - Returns `true` if the symbol was added or a bridge was registered, `false` otherwise.
    func define(symbol: String, namespace: JXNamespace, in context: JXContext) throws -> Bool
    
    /// Prepare for the given conveyed or returned  instance, typically by registering a type bridge.
    ///
    /// - Returns `true` if the instance was handled, `false` otherwise.
    func define(for instance: Any, in context: JXContext) throws -> Bool
    
    /// User has requested that this namespace define all symbols and bridges for use.
    ///
    /// - Returns `true` if this module supports defining all symbols, `false` otherwise. Defaults to `true`.
    func defineAll(namespace: JXNamespace, in context: JXContext) throws -> Bool
}

extension JXModule {
    public func register(with registry: JXRegistry) {
    }
    
    public func initialize(in context: JXContext) {
    }
    
    public func define(symbol: String, namespace: JXNamespace, in context: JXContext) throws -> Bool {
        return false
    }
    
    public func define(for instance: Any, in context: JXContext) throws -> Bool {
        return false
    }
    
    public func defineAll(namespace: JXNamespace, in context: JXContext) throws -> Bool {
        return true
    }
}
