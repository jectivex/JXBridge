/// A type that defines its own JavaScript bridging.
public protocol JXBridging {
    /// Return the JavaScript bridge for this type.
    static func bridgeJX() -> JXBridge
}
