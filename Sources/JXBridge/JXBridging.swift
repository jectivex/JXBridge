#if canImport(ObjectiveC)
import ObjectiveC

var kJXStateKey = 0
#endif

/// A type that defines its own JavaScript bridging.
public protocol JXStaticBridging {
    /// Return the JavaScript bridge for this type.
    static var jxBridge: JXBridge { get throws }
}

// Note: We only support JXBridging and our bridging property wrappers on classes. It would be a poor API for structs for two reasons:
// 1. We can't support @JX on structs. So only @JXKeyPath would be available for stored properties.
// 2. Using our property wrappers on structs bloats their size and interferes with their automatic implementations of protocols that depend on all members being Hashable, Codeable, whatever.

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
            addPropertyWrapperObjects(for: superclassMirror)
        }
        addPropertyWrapperObjects(for: mirror)
    }
    
    /// Lookup property wrappers that we can access by reference to read their current value.
    private(set) var propertyWrapperObjects: [String: BridgingPropertyWrapper & AnyObject] = [:]
    
    private func addPropertyWrapperObjects(for mirror: Mirror) {
        for child in mirror.children {
            if let propertyWrapperObject = child.value as? (BridgingPropertyWrapper & AnyObject) {
                propertyWrapperObjects[child.label ?? ""] = propertyWrapperObject
            }
        }
    }
}
