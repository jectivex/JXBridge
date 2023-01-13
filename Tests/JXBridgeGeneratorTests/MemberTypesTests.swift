#if DEBUG // Needed for @testable import
@testable import JXBridge
import XCTest

final class MemberTypesTests: XCTestCase {
    func testMemberTypes() {
        var bridge = MemberTypes.jxBridge()
        bridge.prepareLookupCaches()
        XCTAssertTrue(bridge.hasConstructor(forParameterCount: 0))

        XCTAssertTrue(bridge.hasProperty(for: "letVar"))
        XCTAssertTrue(bridge.hasProperty(for: "storedVar"))
        XCTAssertTrue(bridge.hasProperty(for: "storedVarWithInitializer"))
        XCTAssertTrue(bridge.hasProperty(for: "computedVar"))
        XCTAssertTrue(bridge.hasProperty(for: "computedThrowsVar"))
        XCTAssertTrue(bridge.hasProperty(for: "computedAsyncVar"))
        XCTAssertTrue(bridge.hasProperty(for: "computedAsyncThrowsVar"))
        XCTAssertTrue(bridge.hasProperty(for: "computedGetSetVar"))
        XCTAssertFalse(bridge.hasProperty(for: "privateVar"))

        XCTAssertTrue(bridge.hasStaticProperty(for: "staticLetVar"))
        XCTAssertTrue(bridge.hasStaticProperty(for: "staticStoredVar"))
        XCTAssertTrue(bridge.hasStaticProperty(for: "staticComputedVar"))

        XCTAssertTrue(bridge.hasFunction(for: "instanceFunc", parameterCount: 1))
        XCTAssertFalse(bridge.hasFunction(for: "duplicateInstanceFunc", parameterCount: 1))
        XCTAssertTrue(bridge.hasFunction(for: "multiParamFunc", parameterCount: 3))
        XCTAssertTrue(bridge.hasFunction(for: "multiParamFunc", parameterCount: 4))
        XCTAssertTrue(bridge.hasFunction(for: "asyncFunc", parameterCount: 0))
        XCTAssertTrue(bridge.hasFunction(for: "throwsFunc", parameterCount: 0))
        XCTAssertTrue(bridge.hasFunction(for: "asyncThrowsFunc", parameterCount: 0))
        XCTAssertTrue(bridge.hasFunction(for: "mutatingFunc", parameterCount: 1))
        XCTAssertFalse(bridge.hasFunction(for: "privateFunc", parameterCount: 1))

        XCTAssertTrue(bridge.hasStaticFunction(for: "staticFunc", parameterCount: 1))
    }
}

struct MemberTypes: JXBridging {
    let letVar = "let"

    var storedVar = 1

    var storedVarWithInitializer: Int = { return 2 }()

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

    static let staticLetVar = "staticLet"

    static var staticStoredVar = 2

    static var staticComputedVar: Int {
        return 200
    }

    func instanceFunc(arg: String) -> String {
        return arg
    }

    func duplicateInstanceFunc(arg: String) -> String {
        return arg
    }

    func duplicateInstanceFunc(arg: Int) -> Int {
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
#endif
