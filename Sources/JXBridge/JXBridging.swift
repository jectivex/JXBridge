/// A type that defines its own JavaScript bridging.
///
///     struct Counter: JXBridging {
///         var count = 0
///
///         func increment(by: amount) -> Int {
///             count += amount
///             return count
///         }
///
///         static func jxBridge() -> JXBridge {
///             return JXBridgeBuilder(type: Counter.self)
///                 .constructor { Counter.init }
///                 .var.count { \.count }
///                 .func.increment { Counter.increment }
///                 .bridge
///         }
///     }
public protocol JXBridging {
    /// Create the JavaScript bridge for this type.
    static func jxBridge() throws -> JXBridge
}

extension JXBridging {
    /// The default implementation calls `jxBridgeBuilder` for any tool-generated bridging code.
    public static func jxBridge() -> JXBridge {
        return jxBridgeBuilder().bridge
    }

    /// Any intrinsic namespace for this type. Used by `jxDefaultBridge`. Defaults to `.none`.
    public static var jxNamespace: JXNamespace {
        return .none
    }

    /// A default JavaScript bridge builder for this type, which you can use in your ``JXBridging/jxBridge()`` method.
    ///
    ///     static func jxBridge() -> JXBridge {
    ///         return jxBridgeBuilder()
    ///             // Customizations...
    ///             .bridge
    ///     }
    public static func jxBridgeBuilder() -> JXBridgeBuilder<Self> {
        return JXBridgeBuilder(type: self, namespace: jxNamespace)
    }
}
