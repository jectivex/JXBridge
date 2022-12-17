#if canImport(Foundation)
import Foundation
#endif
import JXKit

extension JXContext {
#if canImport(Foundation)
    
    /// Evaluate the given JavaScript.
    ///
    /// - Parameters:
    ///   - root: The root of the JavaScript resources, typically `Bundle.module.resourceURL` for a Swift package. This is used to locate any scripts referenced via `require`.
    public func eval(_ script: String, root: URL, this: JXValue? = nil) throws -> JXValue {
        return try prepareBridge(throwing: true).moduleManager.withRoot(root) { _ in
            return try eval(script, this: this)
        }
    }
    
    /// Evaluate the JavaScript contained in the given resource.
    ///
    /// - Parameters:
    ///   - resource: The JavaScript file to load, in the form `/path/file.js` or `/path/file`. Note the leading `/` because the resource path is not being interpreted relative to another resource.
    ///   - root: The root of the JavaScript resources, typically `Bundle.module.resourceURL` for a Swift package. This is used to locate the resource and any scripts it references via `require`.
    public func eval(resource: String, root: URL, this: JXValue? = nil) throws -> JXValue {
        return try prepareBridge(throwing: true).moduleManager.withRoot(root) { mm in
            return try mm.eval(resource: resource, this: this)
        }
    }
    
    /// Evaluate the given JavaScript with module semantics, returning its exports.
    ///
    /// - Parameters:
    ///   - root: The root of the JavaScript resources, typically `Bundle.module.resourceURL` for a Swift package. This is used to locate any scripts referenced via `require`.
    public func evalModule(_ script: String, root: URL) throws -> JXValue {
        return try prepareBridge(throwing: true).moduleManager.withRoot(root) { mm in
            let moduleScript =  mm.toModuleScript(script)
            return try eval(moduleScript)
        }
    }
    
    /// Evaluate the JavaScript contained in the given resource with module semantics, returning its exports.
    ///
    /// - Parameters:
    ///   - resource: The JavaScript file to load, in the form `/path/file.js` or `/path/file`. Note the leading `/` because the resource path is not being interpreted relative to another resource.
    ///   - root: The root of the JavaScript resources, typically `Bundle.module.resourceURL` for a Swift package. This is used to locate the resource and any scripts it references via `require`.
    ///   - cacheExports: Whether to cache the module exports for future `eval` and `require` calls. Defaults to `false` because the result of this call is often immediately integrated into a `JXModule`, which is already cached.
    public func evalModule(resource: String, root: URL, cacheExports: Bool = false) throws -> JXValue {
        return try prepareBridge(throwing: true).moduleManager.withRoot(root) { mm in
            return try mm.evalModule(resource: resource, cacheExports: cacheExports)
        }
    }
    
#endif
    
    /// Evaluate the given JavaScript with module semantics, returning its exports.
    public func evalModule(_ script: String) throws -> JXValue {
        let mm = try prepareBridge(throwing: true).moduleManager
        let moduleScript = mm.toModuleScript(script)
        return try eval(moduleScript)
    }
    
    /// Prepare this context for use with JavaScript and native bridging.
    ///
    /// - Note: Bridge preparation typically happens implicitly when you access the `registry` property. Use this function to prepare explicitly and possibly handle any errors that occur.
    public func prepareBridge() throws {
        let _ = try prepareBridge(throwing: true)
    }
    
    /// Register types bridged to JavaScript for use in this context.
    public var registry: JXRegistry {
        return (try? prepareBridge(throwing: false))?.registry ?? JXRegistry()
    }
    
    /// Set a pre-configured or shared registry for this context.
    public func setRegistry(_ registry: JXRegistry) throws {
        try prepareBridge(throwing: true).setRegistry(registry)
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
