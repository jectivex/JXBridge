import JXBridge

struct StructType: JXMarkerBridging {
    let letValue = "let"
    var storedVar = 1
    var storedInitializerVar: Int = { return 2 }()
    var computedVar: Int {
        return 100
    }
    var computedThrowsVar: Int {
        get throws {
            return 100
        }
    }
    var computedAsyncVar: Int {
        get async {
            return 100
        }
    }
    var computedAsyncThrowsVar: Int {
        get async throws {
            return 100
        }
    }
    var computedGetSetVar: Int {
        get {
            return storedVar * 2
        }
        set {
            storedVar = newValue / 2
        }
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

    func multiParamFunc(_ unnamed: String, firstNamed: String, secondNamed: String, defaultedParam: String = "") -> String {
        return firstNamed
    }

    func asyncFunc() async -> Void {
    }

    func throwsFunc() throws -> Void {
    }

    func asyncThrowsFunc() async throws -> Void {
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

        init(innerVar: Int) {
            self.innerVar = innerVar
        }

        class func classFunc(arg: String) -> String {
            return arg
        }

        class InnerInnerType {
            var innerInnerVar = 2
        }
    }
}

public struct PublicType: JXMarkerBridging {
    public var publicVar = 1
    var internalVar = 2
}

extension OuterType {
    var computedOuterVar: Int {
        return 2
    }
}

extension OuterType.InnerType.InnerInnerType: JXMarkerBridging {
    var computedInnerInnerVar: Int {
        return 2
    }
}
