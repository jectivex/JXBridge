public struct JXNamespace: RawRepresentable {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension JXNamespace {
    public static let `default` = JXNamespace(rawValue: "jx")
}
