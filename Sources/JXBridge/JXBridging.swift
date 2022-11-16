/// A type that defines its own JavaScript bridging.
public protocol JXStaticBridging {
    /// Return the JavaScript bridge for this type.
    static var jxBridge: JXBridge { get throws }
}

/// An instance that defines its own JavaScript bridging, typically using property wrappers.
public protocol JXBridging: AnyObject {
    /// Return the JavaScript bridge for the type of this instance. If not implemented, defaults to using this class's JX property wrappers.
    ///
    /// - Note: If you want to accept the default bridge but want a custom namespace, return the desired namespace from your `jxNamespace` property.
    var jxBridge: JXBridge { get throws }
}

extension JXBridging {
    public var jxBridge: JXBridge {
        return JXBridgeBuilder(reflecting: self, namespace: jxNamespace).bridge
    }
    
    /// If you do not implement `jxBridge`, use this property to provide a namespace for the auto-generated bridge.
    public var jxNamespace: JXNamespace {
        return .default
    }
}
