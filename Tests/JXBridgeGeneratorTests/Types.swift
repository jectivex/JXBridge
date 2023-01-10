import JXBridge

struct StructType: JXMarkerBridging {
    let letValue = "let"
    var storedVar = 1
    var computedVar: Int {
        return 100
    }

    private var privateVar = 0

    static let staticLetValue = "staticLet"
    static var staticStoredVar = 2
    static var staticComputedVar: Int {
        return 200
    }

    func instanceFunc(arg: String) -> String {
        return arg
    }
    func asyncFunc(arg: String) async -> String {
        return arg
    }

    mutating func mutatingFunc(arg: String) -> String {
        return arg
    }

    private func privateFunc(arg: String) -> String {
        return arg
    }

    static func staticFunc(arg: String) -> String {
        return arg
    }
}

class OuterType {
    class InnerType {
        var innerVar = 1
    }
}

public struct PublicType: JXMarkerBridging {
    public var publicVar = 1
    var internalVar = 2
}

extension OuterType.InnerType {
    var computedInnerVar: Int {
        return 2
    }
}

// MARK: - Used to reverse engineer parse tree

enum EnumType {
}
