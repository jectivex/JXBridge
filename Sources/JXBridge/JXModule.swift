import JXKit
import Foundation

/// A self-contained set of native functionality exported to JavaScript under a namespace.
public protocol JXModule {
    /// The namespace for this module.
    ///
    /// - Note: Use ``JXNamespace/none`` for meta-modules that auto-register types in any namespace.
    static var namespace: JXNamespace { get }
    
    /// Use this function to pre-register types or other required modules. It is called once when the module is added to the registry.
    func register(with registry: JXRegistry) throws
    
    /// Use this function to prepare the context for use with this module. It may be used to add values, `integrate` functionality, etc.
    func initialize(in context: JXContext) throws
    
    /// This function is called to lazily define symbols accessed on this namespace. Use it to add values, register bridges, etc. Defaults to `false` as we assume that simple modules will use `register` and `initialize` to eagerly define all symbols.
    ///
    /// - Returns `true` if the symbol was added or a bridge was registered, `false` otherwise.
    func define(symbol: String, namespace: JXNamespace, in context: JXContext) throws -> Bool
    
    /// Prepare for the given conveyed or returned  instance, typically by registering a type bridge. Defaults to `false` as we assume that simple modules will use `register` and `initialize` to eagerly define all symbols.
    ///
    /// - Returns `true` if the instance was handled, `false` otherwise.
    func define(for instance: Any, in context: JXContext) throws -> Bool
    
    /// User has requested that this namespace define all symbols and bridges for use.
    ///
    /// - Returns `true` if this module supports defining all symbols, `false` otherwise. Defaults to `true` as we assume that simple modules will use `register` and `initialize` to eagerly define all symbols.
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

extension JXModule {
    /// Returns this type's namespace.
    var namespace: JXNamespace {
        Self.namespace
    }
}

/// A module with the capability of having its scripts and resources dynamically loaded from an external source.
///
/// The transport scheme and loading mechaism is to be implemented by a host container.
public protocol JXDynamicModule : JXModule {
    /// The bundle that will contain the local module sources and resources.
    static var bundle: Bundle { get }

    /// The path to the locally-installed folder that is expected to contain the scripts and resources for the app.
    ///
    /// The default implementation will look in `bundle`'s subfolder `/jx/<namespace>/`.
    ///
    /// This folder must be included as a `.copy("jx")` directive for the module's `Package.swift`
    static var localModuleRoot: URL { get }

    /// The logical path to the remote root folder in the source archive whose file and folder layout matches the structure of the `localModuleRoot`.
    ///
    /// The returned URL is not necessarily directly reachable; rather, it is expected that the URL's `baseURL` and `relativePath` are used separately in the context of a host environment to resolve individual versions of the module.
    static var remoteModuleSource: URL? { get }
}

public extension JXDynamicModule {
    /// No-op default implementation
    static var remoteModuleSource: URL? {
        nil
    }

    /// The default local URL for the module is based on the modules name's relative to the resource URL.
    ///
    /// For example, the module `xyz` will have it's resources stored in `Resources/jx/xyz/SomeFile.js`
    static var localModuleRoot: URL {
        URL(fileURLWithPath: Self.namespace.string, relativeTo: URL(fileURLWithPath: "jx", relativeTo: bundle.resourceURL))
    }
}
