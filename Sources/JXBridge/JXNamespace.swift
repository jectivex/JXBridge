import JXKit

/// A namespace used for JavaScript bridged types.
public struct JXNamespace: ExpressibleByStringLiteral, CustomStringConvertible, Hashable {
    /// The JX system namespace: `jx`
    public static let jx = JXNamespace("jx")
    
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

extension JXNamespace: JXConvertible {
    public static func fromJX(_ value: JXValue) throws -> JXNamespace {
        return try JXNamespace(value.string)
    }

    public func toJX(in context: JXContext) throws -> JXValue {
        return context.string(string)
    }
}
