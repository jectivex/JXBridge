#if canImport(Foundation)
import Foundation
#endif
import JXKit

extension JXContext {
    /// Evaluate the given JavaScript with module semantics, returning its exports.
    public func evalModule(_ script: String) throws -> JXValue {
        return try prepareBridge(throwing: true).scriptManager.evalModule(script)
    }
    
    /// Register types bridged to JavaScript for use in this context.
    public var registry: JXRegistry {
        return (try? prepareBridge(throwing: false))?.registry ?? JXRegistry()
    }
    
    /// Set a pre-configured or shared registry for this context.
    public func setRegistry(_ registry: JXRegistry) throws {
        try prepareBridge(throwing: true).setRegistry(registry)
    }
    
    /// Prepare this context for use with JavaScript and native bridging.
    ///
    /// - Note: Bridge preparation typically happens implicitly when you access the `registry` property. Use this function to prepare explicitly and possibly handle any errors that occur.
    public func prepareBridge() throws {
        let _ = try prepareBridge(throwing: true)
    }
    
    private func prepareBridge(throwing: Bool) throws -> ContextSPI {
        if let bridgeSPI = spi as? ContextSPI {
            return bridgeSPI
        }
        let bridgeSPI = ContextSPI(context: self)
        if throwing {
            try bridgeSPI.throwInitializationError()
        }
        spi = bridgeSPI
        return bridgeSPI
    }
}

#if canImport(Foundation)

extension JXContext {
    /// Evaluate the given JavaScript.
    ///
    /// - Parameters:
    ///   - root: The root of the JavaScript resources, typically `Bundle.module.resourceURL` for a Swift package. This is used to locate any scripts referenced via `require`.
    public func eval(_ script: String, root: URL, this: JXValue? = nil) throws -> JXValue {
        return try prepareBridge(throwing: true).scriptManager.withRoot(root) { _ in
            return try eval(script, this: this)
        }
    }
    
    /// Evaluate the JavaScript contained in the given resource.
    ///
    /// - Parameters:
    ///   - resource: The JavaScript file to load, in the form `/path/file.js` or `/path/file`. Note the leading `/` because the resource path is not being interpreted relative to another resource.
    ///   - root: The root of the JavaScript resources, typically `Bundle.module.resourceURL` for a Swift package. This is used to locate the resource and any scripts it references via `require`.
    public func eval(resource: String, root: URL, this: JXValue? = nil) throws -> JXValue {
        return try prepareBridge(throwing: true).scriptManager.withRoot(root) { rm in
            return try rm.eval(resource: resource, this: this)
        }
    }
    
    /// Evaluate the given JavaScript with module semantics, returning its exports.
    ///
    /// - Parameters:
    ///   - root: The root of the JavaScript resources, typically `Bundle.module.resourceURL` for a Swift package. This is used to locate any scripts referenced via `require`.
    public func evalModule(_ script: String, root: URL) throws -> JXValue {
        return try prepareBridge(throwing: true).scriptManager.withRoot(root) { sm in
            return try sm.evalModule(script)
        }
    }
    
    /// Evaluate the JavaScript contained in the given resource with module semantics, returning its exports.
    ///
    /// - Parameters:
    ///   - resource: The JavaScript file to load, in the form `/path/file.js` or `/path/file`. Note the leading `/` because the resource path is not being interpreted relative to another resource.
    ///   - root: The root of the JavaScript resources, typically `Bundle.module.resourceURL` for a Swift package. This is used to locate the resource and any scripts it references via `require`.
    public func evalModule(resource: String, root: URL) throws -> JXValue {
        return try prepareBridge(throwing: true).scriptManager.withRoot(root) { rm in
            return try rm.evalModule(resource: resource)
        }
    }
    
    /// Listen for changes to JavaScript scripts.
    public func onScriptsDidChange(perform: @escaping (Set<String>) -> Void) -> JXCancellable {
        do {
            return try prepareBridge(throwing: false).scriptManager.didChange.addListener(ScriptListener(handler: perform))
        } catch {
            return JXCancellable {}
        }
    }
    
    /// Perform the given code while tracking its access to JX and JavaScript resources.
    public func trackingScriptAccess<V>(perform: @escaping () throws -> V) throws -> (scriptIDs: Set<String>, value: V) {
        var scriptIDs = Set<String>()
        let listener = ScriptListener { scriptIDs.formUnion($0) }
        let spi = try prepareBridge(throwing: true)
        let subscription = spi.scriptManager.didAccess.addListener(listener)
        defer { subscription.cancel() }
        let value = try perform()
        return (scriptIDs, value)
    }
}

#endif
