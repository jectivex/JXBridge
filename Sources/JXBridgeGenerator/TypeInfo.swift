class TypeInfo: CustomStringConvertible {
    let qualifiedName: String
    var type: TypeInfoType = .unknown
    var extends: String?
    var visibility: Visibility = .unknown
    var isBridging = false
    var members: [MemberInfo] = []

    init(qualifiedName: String) {
        self.qualifiedName = qualifiedName
    }

    var hasDefaultBridge: Bool {
        return members.contains { member in
            return member.name == "jxDefaultBridge"
                && (member.type == .staticFunction || member.type == .classFunction)
                && member.parameters.isEmpty
        }
    }

    var description: String {
        let membersDescription = members
            .sorted { $0.type.rawValue < $1.type.rawValue }
            .map { $0.description(in: qualifiedName) }
            .joined(separator: "\n")
        return """
\(qualifiedName) {
    type: \(type)
    extends: \(extends ?? "nil")
    visibility: \(visibility)
    isBridging: \(isBridging)
}
\(membersDescription)
"""
    }
}

struct MemberInfo {
    var name: String
    var type: MemberInfoType = .property
    var visibility: Visibility = .internal
    var hasGetter = false
    var hasSetter = false
    var isAsync = false
    var isThrows = false
    var parameters: [ParameterInfo] = []

    func isVisible(in typeInfo: TypeInfo) -> Bool {
        switch typeInfo.visibility {
        case .public, .open:
            return visibility == .public || visibility == .open
        case .internal:
            return visibility != .private
        case .private:
            return true
        case .unknown:
            return visibility != .private
        }
    }

    func description(in typeName: String) -> String {
        return """
\(typeName).\(name) {
    type: \(type)
    visibility: \(visibility)
    hasGetter: \(hasGetter)
    hasSetter: \(hasSetter)
    isAsync: \(isAsync)
    isThrows: \(isThrows)
    parameters: \(parameters)
}
"""
    }
}

struct ParameterInfo: CustomStringConvertible {
    var name: String
    var hasDefault: Bool

    var description: String {
        return "\(name): \(hasDefault)"
    }
}

enum TypeInfoType: String {
    case unknown
    case `class`
    case `struct`
    case `actor`
}

// Extend Int for sortability
enum MemberInfoType: Int, CustomStringConvertible {
    case constructor
    case property
    case function
    case mutatingFunction
    case classProperty
    case classFunction
    case staticProperty
    case staticFunction

    var description: String {
        switch self {
        case .constructor:
            return "constructor"
        case .property:
            return "property"
        case .function:
            return "function"
        case .mutatingFunction:
            return "mutatingFunction"
        case .classProperty:
            return "classProperty"
        case .classFunction:
            return "classFunction"
        case .staticProperty:
            return "staticProperty"
        case .staticFunction:
            return "staticFunction"
        }
    }
}

enum Visibility: String {
    case unknown
    case `public`
    case `open`
    case `internal`
    case `private`
}
