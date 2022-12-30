import JXKit

extension JXContext {
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
