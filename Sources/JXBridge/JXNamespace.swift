/// A namespace used for JavaScript bridged types.
public struct JXNamespace: ExpressibleByStringLiteral, Hashable {
    /// The default namespace.
    public static let `default` = JXNamespace("jx")
    
    /// Special value used to represent any namespace in some API.
    public static let any = JXNamespace("")
    
    public let value: String
    
    public init(_ value: String) {
        self.value = value
    }
    
    public init(stringLiteral: String) {
        self.value = stringLiteral
    }
}
