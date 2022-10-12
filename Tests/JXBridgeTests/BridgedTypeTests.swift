import Combine
@testable import JXBridge
import JXKit
import XCTest

final class BridgedTypeTests: XCTestCase {
    func testBoxTypes() throws {
        let context = JXContext()
        let builder = JXBridgeBuilder(JXBridgedStruct.self)
            .constructor { JXBridgedStruct.init }
            .var.readWriteInt { \.readWriteInt }
            .var.readOnlyInt { \.readOnlyInt }
            .var.computedInt { \.computedInt }
            .var.string { \.string }
        context.registry.add(builder.bridge)

        let box = InstanceBox(JXBridgedStruct(), bridge: builder.bridge, registry: context.registry)
        let readWriteInt = context.string("readWriteInt")
        let intReturn = try box.get(property: readWriteInt)
        XCTAssertTrue(intReturn.isNumber)
        try box.set(property: readWriteInt, value: context.number(99.0))
        XCTAssertEqual(try box.get(property: readWriteInt).double, 99.0)
    }
    
    // TODO: Fix tests
//
//    func testStructVars() {
//        let typeBuilder = JXBridgeBuilder(JXBridgedStruct.self)
//            .constructor { JXBridgedStruct.init }
//            .var.readWriteInt { \.readWriteInt }
//            .var.readOnlyInt { \.readOnlyInt }
//            .var.computedInt { \.computedInt }
//        _bridge.registry.add(typeBuilder.bridge)
//        let context = _bridge.newContext()
//        context.evaluate("jsb.import('JXBridgedStruct');")
//
//        var result = context.evaluate("const obj = new JXBridgedStruct(); obj.readWriteInt;")
//        XCTAssertEqual(result.int, 1)
//        result = context.evaluate("obj.readWriteInt = 101; obj.readWriteInt;")
//        XCTAssertEqual(result.int, 101)
//
//        result = context.evaluate("obj.readOnlyInt;")
//        XCTAssertEqual(result.int, 2)
//
//        result = context.evaluate("obj.computedInt;")
//        XCTAssertEqual(result.int, 3)
//    }
//
//    func testScriptCanSetPrivateSetVar_UNDESIRED() {
//        let typeBuilder = JXBridgeBuilder(JXBridgedStruct.self)
//            .constructor { JXBridgedStruct.init }
//            .var.readOnlyInt { \.readOnlyInt }
//        _bridge.registry.add(typeBuilder.bridge)
//        let context = _bridge.newContext()
//        context.evaluate("jsb.import('JXBridgedStruct');")
//
//        // We should not be able to set this private property
//        let result = context.evaluate("const obj = new JXBridgedStruct(); obj.readOnlyInt = 102; obj.readOnlyInt")
//        XCTAssertEqual(result.int, 102)
//    }
//
//    func testRelatedObject() {
//        let structBuilder = JXBridgeBuilder(JXBridgedStruct.self)
//            .constructor { JXBridgedStruct.init }
//            .var.related { \.related }
//        let relatedBuilder = JXBridgeBuilder(JXBridgedRelated.self)
//            .constructor { JXBridgedRelated.init }
//            .var.string { \.string }
//        _bridge.registry.add(structBuilder.bridge)
//        _bridge.registry.add(relatedBuilder.bridge)
//        let context = _bridge.newContext()
//        context.evaluate("jsb.import('JXBridgedStruct', 'JXBridgedRelated');")
//
//        var result = context.evaluate("const bridged = new JXBridgedStruct(); bridged.related.string")
//        XCTAssertEqual(result.string, "related")
//
//        result = context.evaluate("const related = new JXBridgedRelated(); related.string = 'updated'; bridged.related = related; bridged.related.string")
//        XCTAssertEqual(result.string, "updated")
//    }
//
//    func testScriptCannotAutoSetMutatedRelatedStruct_UNDESIRED() {
//        let structBuilder = JXBridgeBuilder(JXBridgedStruct.self)
//            .constructor { JXBridgedStruct.init }
//            .var.related { \.related }
//        let relatedBuilder = JXBridgeBuilder(JXBridgedRelated.self)
//            .constructor { JXBridgedRelated.init }
//            .var.string { \.string }
//        _bridge.registry.add(structBuilder.bridge)
//        _bridge.registry.add(relatedBuilder.bridge)
//        let context = _bridge.newContext()
//        let result = context.evaluate("""
//jsb.import('JXBridgedStruct', 'JXBridgedRelated');
//const bridged = new JXBridgedStruct();
//bridged.related.string = 'updated-ref';
//bridged.related.string;
//""")
//        // This should be 'updated-ref'
//        XCTAssertEqual(result.string, "related")
//    }
//
//    func testNativeCodeThrowsException() {
//        let structBuilder = JXBridgeBuilder(JXBridgedStruct.self)
//            .constructor { JXBridgedStruct.init }
//            .func.exceptionFunc { JXBridgedStruct.exceptionFunc }
//        _bridge.registry.add(structBuilder.bridge)
//        let context = _bridge.newContext()
//        let result = context.evaluate("""
//jsb.import('JXBridgedStruct');
//const bridged = new JXBridgedStruct();
//let caughtErr = '';
//try {
//    bridged.exceptionFunc();
//} catch(err) {
//    caughtErr = err.name + ': ' + err.description;
//}
//caughtErr;
//""")
//        XCTAssertEqual(result.string, "JXBridgedError: JXBridgedError(message: \"exceptionFunc error\")")
//    }
//
//    func testSubclass() {
//        let baseBuilder = JXBridgeBuilder(JXBridgedBaseClass.self)
//            .constructor { JXBridgedBaseClass.init }
//            .var.computedString { \.computedString }
//            .class.var.computedClassString { $0.computedClassString }
//            .class.var.baseClassString { $0.baseClassString }
//            .class.func.classFunc { $0.classFunc() }
//            .static.var.staticString { JXBridgedBaseClass.staticString }
//        let subclassBuilder = JXBridgeBuilder(JXBridgedSubClass.self)
//            .constructor { JXBridgedSubClass.init }
//            .var.readWriteInt { \.readWriteInt }
//            .class.var.subClassString { $0.subClassString }
//
//        _bridge.registry.add(baseBuilder.bridge)
//        _bridge.registry.add(subclassBuilder.bridge)
//        let context = _bridge.newContext()
//        context.evaluate("jsb.import('JXBridgedSubClass');")
//
//        var result = context.evaluate("const bridged = new JXBridgedSubClass(); bridged.computedString;")
//        XCTAssertEqual(result.string, "sub")
//
//        result = context.evaluate("JXBridgedSubClass.computedClassString;")
//        XCTAssertEqual(result.string, "subClass")
//
//        result = context.evaluate("JXBridgedSubClass.baseClassString;")
//        XCTAssertEqual(result.string, "baseOnlyClass")
//
//        result = context.evaluate("JXBridgedSubClass.classFunc();")
//        XCTAssertEqual(result.string, "subFunc")
//
//        result = context.evaluate("JXBridgedBaseClass.staticString;")
//        XCTAssertEqual(result.string, "baseStaticString")
//    }
//
//    func testPropertyWrapped() throws {
//        let bridge = JXBridgeBuilder(JXBridgedBaseClass.self)
//            .constructor { JXBridgedBaseClass.init }
//            .var.publishedInt { \.publishedInt }
//            .bridge
//
//        let scriptContext = _bridge.newContext()._scriptContext
//        let obj = JXBridgedBaseClass()
//        var updateCount = 0
//        var token: Any? = obj.objectWillChange.sink { _ in updateCount += 1 }
//
//        XCTAssertEqual(bridge.properties.count, 1)
//        XCTAssertEqual(try bridge.properties[0].get(in: scriptContext, for: obj) as! Int, 1)
//        let _ = try bridge.properties[0].set(in: scriptContext, for: obj, with: 2)
//        XCTAssertEqual(try bridge.properties[0].get(in: scriptContext, for: obj) as! Int, 2)
//        XCTAssertEqual(updateCount, 1)
//
//        if token != nil { // Satisfy compiler by reading value
//            token = nil
//        }
//    }
}

private struct JXBridgedStruct {
    var readWriteInt = 1
    private(set) var readOnlyInt = 2
    var computedInt: Int { return 3 }

    var string = ""
    var related = JXBridgedRelated()

    func exceptionFunc() throws {
        throw JXBridgedError(message: "exceptionFunc error")
    }
}

private struct JXBridgedRelated {
    var string = "related"
}

private struct JXBridgedError: Error {
    let message: String
}

private class JXBridgedBaseClass: ObservableObject {
    static var staticString: String {
        return "baseStaticString"
    }

    class var computedClassString: String {
        return "baseClass"
    }

    class var baseClassString: String {
        return "baseOnlyClass"
    }

    class func classFunc() -> String {
        return "baseFunc"
    }

    var computedString: String {
        return "base"
    }

    @Published var publishedInt = 1

    init() {
    }
}

private class JXBridgedSubClass: JXBridgedBaseClass {
    override class var computedClassString: String {
        return "subClass"
    }

    class var subClassString: String {
        return "subOnlyClass"
    }

    override class func classFunc() -> String {
        return "subFunc"
    }

    override var computedString: String {
        return "sub"
    }

    var readWriteInt = 1
}
