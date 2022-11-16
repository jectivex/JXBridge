#if canImport(ObjectiveC)
import ObjectiveC

var kJXStateKey = 0
#endif

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
    
    /// Bridging state managed by the JX runtime. Do not modify.
    ///
    /// - Note: You do not have to implement this on iOS, iPadOS, tvOS, Mac.
    var jxState: JXState? { get set }
}

extension JXBridging {
    public var jxBridge: JXBridge {
        return JXBridgeBuilder(reflecting: self, namespace: jxNamespace).bridge
    }
    
    /// If you do not implement `jxBridge`, use this property to provide a namespace for the auto-generated bridge.
    public var jxNamespace: JXNamespace {
        return .default
    }
    
#if canImport(ObjectiveC)
    public var jxState: JXState? {
        get {
            return objc_getAssociatedObject(self, &kJXStateKey) as? JXState
        }
        set {
            objc_setAssociatedObject(self, &kJXStateKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
#endif
}

/// Opaque reference to JX runtime state.
public class JXState {
    init(instance: Any) {
        let mirror = Mirror(reflecting: instance)
        if let superclassMirror = mirror.superclassMirror {
            addPropertyWrappers(for: superclassMirror)
        }
        addPropertyWrappers(for: mirror)
    }
    
    private(set) var bridgingPropertyWrappers: [String: BridgingPropertyWrapper] = [:]
    
    private func addPropertyWrappers(for mirror: Mirror) {
        for child in mirror.children {
            if let bridgingPropertyWrapper = child.value as? BridgingPropertyWrapper {
                bridgingPropertyWrappers[child.label ?? ""] = bridgingPropertyWrapper
            }
        }
    }
}
