class TypeInfo: CustomStringConvertible {
    let qualifiedName: String
    var type: TypeInfoType = .unknown
    var extends: String?
    var visibility: Visibility = .unknown
    var hasJXBridging = false
    var hasJXModule = false
    var hasJXSuperclass = false
    var members: [MemberInfo] = []

    init(qualifiedName: String) {
        self.qualifiedName = qualifiedName
    }

    var hasBridgeBuilder: Bool {
        return members.contains { member in
            return member.name == "jxBridgeBuilder"
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
    hasJXBridging: \(hasJXBridging)
    hasJXSuperclass: \(hasJXSuperclass)
}
\(membersDescription)
"""
    }
}

struct MemberInfo {
    var name: String
    var type: MemberInfoType = .property
    var visibility: Visibility = .internal
    var isOverride = false
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

    func isJXProtocolMember(in typeInfo: TypeInfo) -> Bool {
        if (name == "jxNamespace" || name == "jxSuperclass") && (type == .staticProperty || type == .classProperty) {
            return true
        }
        if (name == "jxBridge" || name == "jxBridgeBuilder") && (type == .staticFunction || type == .classFunction) {
            return true
        }
        guard typeInfo.hasJXModule else {
            return false
        }

        // JXModule API
        if name == "namespace" && (type == .staticProperty || type == .classProperty) {
            return true
        }
        if type == .function {
            return name == "register" || name == "initialize" || name == "define" || name == "defineAll"
        }
        return false
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
    case defaultConstructor
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
        case .defaultConstructor:
            return "defaultConstructor"
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
