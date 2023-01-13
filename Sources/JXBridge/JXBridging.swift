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
    public static func jxBridge() -> JXBridge {
        return jxDefaultBridge()
    }

    /// A default JavaScript bridge for this type. This may be implemented by tools. You can customize the default in your ``JXBridging/jxBridge()`` method:
    ///
    ///     static func jxBridge() -> JXBridge {
    ///         return JXBridgeBuilder(type: self, bridge: jxDefaultBridge())
    ///             // Customizations...
    ///             .bridge
    ///     }
    public static func jxDefaultBridge() -> JXBridge {
        return JXBridge(type: self)
    }
}
