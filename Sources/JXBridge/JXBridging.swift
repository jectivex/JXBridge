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
///             return JXBridgeBuilder(Counter.self) // In non-final classes use explicit type. In structs and final classes can use 'self'
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

//~~~
//extension JXBridging {
//
//    static var jxDefaultNamespace: JXNamespace {
//        return .default
//    }
//
//    static func jxDefaultBridge() throws -> JXBridge {
//
//    }
//}
