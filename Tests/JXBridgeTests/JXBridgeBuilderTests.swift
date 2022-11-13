@testable import JXBridge
import XCTest

final class JXBridgeBuilderTests: XCTestCase {
    func testType() {
        let builder = JXBridgeBuilder(type: TestStruct.self)
        XCTAssertTrue(builder.bridge.type == TestStruct.self)
    }

    func testTypeName() {
        let builder = JXBridgeBuilder(type: TestStruct.self)
        XCTAssertEqual(builder.bridge.typeName, "TestStruct")
    }

    func testVarsSyntax() {
        let _ = JXBridgeBuilder(type: TestStruct.self)
            .var.instanceLet { \.instanceLet }
            .var.instanceVar { \.instanceVar }
            .var.instanceVarOptional { \.instanceVarOptional }
            .var.instanceComputedReadOnly { \.instanceComputedReadOnly }
            .var.instanceComputedReadWrite { \.instanceComputedReadWrite }
            .var.instanceThrowingVar { try $0.instanceThrowingVar }
            .var.syntheticVar { $0.instanceVar * 2 } set: {
                var target = $0
                target.instanceVar = $1 / 2
                return target
            }
    }

    func testStaticVarsSyntax() {
        let _ = JXBridgeBuilder(type: TestStruct.self)
            .static.var.staticLet { TestStruct.staticLet }
            .static.var.staticVar { TestStruct.staticVar } set: { TestStruct.staticVar = $0 }
            .static.var.staticComputedReadOnly { TestStruct.staticComputedReadOnly }
            .static.var.staticComputedReadWrite { TestStruct.staticComputedReadWrite } set: { TestStruct.staticComputedReadWrite = $0 }
    }

    func testFuncsSyntax() {
        let _ = JXBridgeBuilder(type: TestStruct.self)
            .func.instanceFunc { TestStruct.instanceFunc }
            .func.instanceParamFunc { TestStruct.instanceParamFunc(param:) }
            .func.syntheticFunc { $0.instanceFunc() }
            .func.syntheticParamFunc { $0.instanceParamFunc(param: $1) }
    }

    func testMutatingFuncsSyntax() {
        let _ = JXBridgeBuilder(type: TestStruct.self)
            .mutating.func.instanceMutatingFunc { $0.instanceMutatingFunc() }
    }

    func testStaticFuncsSyntax() {
        let _ = JXBridgeBuilder(type: TestStruct.self)
            .static.func.staticFunc { TestStruct.staticFunc }
            .static.func.staticParamFunc { TestStruct.staticParamFunc }
            .static.func.staticSyntheticFunc { TestStruct.staticFunc() }
            .static.func.staticSyntheticParamFunc { TestStruct.staticParamFunc(param: $0) }
    }

    func testConstructorsSyntax() {
        let _ = JXBridgeBuilder(type: TestStruct.self)
            .constructor { TestStruct.init }
            .constructor { TestStruct.init(instanceVarOptional:) }
            .constructor { TestStruct() } // Synthetic constructor
            .constructor { TestStruct(instanceVarOptional: $0) } // Synthetic constructor
    }

    func testClassVars() {
        let _ = JXBridgeBuilder(type: TestClass.self)
            .class.var.classProperty { $0.classProperty }
    }

    func testClassFuncs() {
        let _ = JXBridgeBuilder(type: TestClass.self)
            .class.func.classFunc { $0.classFunc() }
    }

#if canImport(ObjectiveC)

    func testObjC() {
        let builder = JXBridgeBuilder(type: TestObjCClass.self)
        builder.addObjectiveCPropertiesAndMethods()
        // TODO
    }

#endif
}

private struct TestStruct {
    // Instance vars
    let instanceLet = 1
    var instanceVar = 2
    var instanceVarOptional: Int?
    var instanceComputedReadOnly: Int {
        return 3
    }
    var instanceComputedReadWrite: Int {
        get {
            return self.instanceVar + 100
        }
        set {
            self.instanceVar = newValue - 100
        }
    }
    var instanceThrowingVar: Int {
        get throws {
            return 4
        }
    }

    // Instance funcs
    func instanceFunc() -> Int {
        return 1
    }
    func instanceParamFunc(param: Int) -> Int {
        return param + 1
    }
    mutating func instanceMutatingFunc() {
    }

    // Static vars
    static let staticLet = 1
    static var staticVar = 2
    static var staticComputedReadOnly: Int {
        return 3
    }
    static var staticComputedReadWrite: Int {
        get {
            return Self.staticVar + 100
        }
        set {
            Self.staticVar = newValue - 100
        }
    }

    // Static funcs
    static func staticFunc() -> Int {
        return 1
    }
    static func staticParamFunc(param: Int) -> Int {
        return param + 1
    }

    // Constructors
    init(instanceVarOptional: Int? = nil) {
        self.instanceVarOptional = instanceVarOptional
    }
}

private class TestClass {
    static var staticProperty = 100

    class var classProperty: Int {
        return 200
    }

    class func classFunc() -> Int {
        return 300
    }

    var intProperty = 1

    func instanceParamFunc(param: Int) -> Int {
        return param + 1;
    }

    init() {
    }
}

#if canImport(ObjectiveC)

@objc private class TestObjCClass: NSObject {
    @objc var intProperty = 1

    @objc func instanceParamFunc(param: Int) -> Int {
        return param + 1;
    }
}

#endif
