/// A namespace used for JavaScript bridged types.
public struct JXNamespace: ExpressibleByStringLiteral, CustomStringConvertible, Hashable {
    /// The default namespace: `jx`
    public static let `default` = JXNamespace("jx")
    
    /// Special value used to represent the absence of a namespace.
    public static let none = JXNamespace("")
    
    /// The namespace string.
    public let string: String
    
    public init(_ string: String) {
        self.string = string
    }
    
    public init(stringLiteral: String) {
        self.string = stringLiteral
    }
    
    public var description: String {
        return string
    }
}
