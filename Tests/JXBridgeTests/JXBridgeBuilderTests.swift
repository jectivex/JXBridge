@testable import JXBridge
import XCTest

final class JXBridgeBuilderTests: XCTestCase {
    func testType() {
        let builder = JXBridgeBuilder(type: JXBridgeBuilderTestsStruct.self)
        XCTAssertTrue(builder.bridge.type == JXBridgeBuilderTestsStruct.self)
    }

    func testTypeName() {
        let builder = JXBridgeBuilder(type: JXBridgeBuilderTestsStruct.self)
        XCTAssertEqual(builder.bridge.typeName, "JXBridgeBuilderTestsStruct")
    }

    func testVarsSyntax() {
        let _ = JXBridgeBuilder(type: JXBridgeBuilderTestsStruct.self)
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
        let _ = JXBridgeBuilder(type: JXBridgeBuilderTestsStruct.self)
            .static.var.staticLet { JXBridgeBuilderTestsStruct.staticLet }
            .static.var.staticVar { JXBridgeBuilderTestsStruct.staticVar } set: { JXBridgeBuilderTestsStruct.staticVar = $0 }
            .static.var.staticComputedReadOnly { JXBridgeBuilderTestsStruct.staticComputedReadOnly }
            .static.var.staticComputedReadWrite { JXBridgeBuilderTestsStruct.staticComputedReadWrite } set: { JXBridgeBuilderTestsStruct.staticComputedReadWrite = $0 }
    }

    func testFuncsSyntax() {
        let _ = JXBridgeBuilder(type: JXBridgeBuilderTestsStruct.self)
            .func.instanceFunc { JXBridgeBuilderTestsStruct.instanceFunc }
            .func.instanceParamFunc { JXBridgeBuilderTestsStruct.instanceParamFunc(param:) }
            .func.syntheticFunc { $0.instanceFunc() }
            .func.syntheticParamFunc { $0.instanceParamFunc(param: $1) }
    }

    func testMutatingFuncsSyntax() {
        let _ = JXBridgeBuilder(type: JXBridgeBuilderTestsStruct.self)
            .mutating.func.instanceMutatingFunc { $0.instanceMutatingFunc() }
    }

    func testStaticFuncsSyntax() {
        let _ = JXBridgeBuilder(type: JXBridgeBuilderTestsStruct.self)
            .static.func.staticFunc { JXBridgeBuilderTestsStruct.staticFunc }
            .static.func.staticParamFunc { JXBridgeBuilderTestsStruct.staticParamFunc }
            .static.func.staticSyntheticFunc { JXBridgeBuilderTestsStruct.staticFunc() }
            .static.func.staticSyntheticParamFunc { JXBridgeBuilderTestsStruct.staticParamFunc(param: $0) }
    }

    func testConstructorsSyntax() {
        let _ = JXBridgeBuilder(type: JXBridgeBuilderTestsStruct.self)
            .constructor { JXBridgeBuilderTestsStruct.init }
            .constructor { JXBridgeBuilderTestsStruct.init(instanceVarOptional:) }
            .constructor { JXBridgeBuilderTestsStruct() } // Synthetic constructor
            .constructor { JXBridgeBuilderTestsStruct(instanceVarOptional: $0) } // Synthetic constructor
    }

    func testClassVars() {
        let _ = JXBridgeBuilder(type: JXBridgeBuilderTestsClass.self)
            .class.var.classProperty { $0.classProperty }
    }

    func testClassFuncs() {
        let _ = JXBridgeBuilder(type: JXBridgeBuilderTestsClass.self)
            .class.func.classFunc { $0.classFunc() }
    }

#if canImport(ObjectiveC)

    func testObjC() {
        let _ = JXBridge(objectiveCClass: JXBridgeBuilderTestsObjCClass.self)
    }

#endif
}

private struct JXBridgeBuilderTestsStruct {
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

private class JXBridgeBuilderTestsClass {
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

@objc private class JXBridgeBuilderTestsObjCClass: NSObject {
    @objc var intProperty = 1

    @objc func instanceParamFunc(param: Int) -> Int {
        return param + 1;
    }
}

#endif
