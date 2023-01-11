class TypeInfo: CustomStringConvertible {
    let qualifiedName: String
    var extends = "" //~~~ Only add to type bridge at the end if super in same module? Otherwise could be in different and we don't know what to import and if we import all referenced modules there could be name conflicts
    var visibility: Visibility = .unknown
    var isBridging = false
    var isActor = false
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
    extends: \(extends)
    visibility: \(visibility)
    isBridging: \(isBridging)
    isActor: \(isActor)
}
\(membersDescription)
"""
    }
}

struct MemberInfo {
    var name: String
    var type: MemberType = .property
    var visibility: Visibility = .internal
    var hasGetter = false
    var hasSetter = false
    var isAsync = false
    var isThrows = false
    var parameters: [ParameterInfo] = []

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

enum MemberType: Int, CustomStringConvertible {
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
    case `internal`
    case `private`
}
