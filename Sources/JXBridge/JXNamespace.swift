/// A namespace used for JavaScript bridged types.
public struct JXNamespace: ExpressibleByStringLiteral, CustomStringConvertible, Hashable {
    /// The default namespace: `jx`
    public static let `default` = JXNamespace("jx")
    
    /// Special value used to represent the absence of a namespace.
    public static let none = JXNamespace("")
    
    public let value: String
    
    public init(_ value: String) {
        self.value = value
    }
    
    public init(stringLiteral: String) {
        self.value = stringLiteral
    }
    
    public var description: String {
        return value
    }
}
