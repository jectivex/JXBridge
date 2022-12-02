import JXKit
import XCTest
#if canImport(Combine)
import Combine
#else
import OpenCombine
#endif

#if DEBUG
@testable import JXBridge

final class BridgedTypeTests: XCTestCase {
    func testBoxTypes() throws {
        let context = JXContext()
        let builder = JXBridgeBuilder(type: TestStruct.self)
            .constructor { TestStruct.init }
            .var.readWriteInt { \.readWriteInt }
            .var.readOnlyInt { \.readOnlyInt }
            .var.computedInt { \.computedInt }
            .var.string { \.string }
        try context.registry.register(builder.bridge)
        guard let bridge = context.registry.bridge(for: TestStruct.self) else {
            XCTFail()
            return
        }
        let box = InstanceBox(TestStruct(), bridge: bridge, registry: context.registry)
        let readWriteInt = context.string("readWriteInt")
        let intReturn = try box.get(property: readWriteInt)
        XCTAssertTrue(intReturn.isNumber)
        try box.set(property: readWriteInt, value: context.number(99.0))
        XCTAssertEqual(try box.get(property: readWriteInt).double, 99.0)
    }
    
    func testStructVars() throws {
        let context = JXContext()
        let builder = JXBridgeBuilder(type: TestStruct.self)
            .constructor { TestStruct.init }
            .var.readWriteInt { \.readWriteInt }
            .var.readOnlyInt { \.readOnlyInt }
            .var.computedInt { \.computedInt }
        try context.registry.register(builder.bridge)

        var result = try context.eval("const obj = new jx.TestStruct(); obj.readWriteInt;")
        XCTAssertEqual(try result.int, 1)
        result = try context.eval("obj.readWriteInt = 101; obj.readWriteInt;")
        XCTAssertEqual(try result.int, 101)

        result = try context.eval("obj.readOnlyInt;")
        XCTAssertEqual(try result.int, 2)

        result = try context.eval("obj.computedInt;")
        XCTAssertEqual(try result.int, 3)
    }

    func testScriptCanSetPrivateSetVar_UNDESIRED() throws {
        let context = JXContext()
        let builder = JXBridgeBuilder(type: TestStruct.self)
            .constructor { TestStruct.init }
            .var.readOnlyInt { \.readOnlyInt }
        try context.registry.register(builder.bridge)

        // We should not be able to set this private property
        let result = try context.eval("const obj = new jx.TestStruct(); obj.readOnlyInt = 102; obj.readOnlyInt")
        XCTAssertEqual(try result.int, 102)
    }

    func testRelatedObject() throws {
        let context = JXContext()
        let structBuilder = JXBridgeBuilder(type: TestStruct.self)
            .constructor { TestStruct.init }
            .var.related { \.related }
        let relatedBuilder = JXBridgeBuilder(type: TestRelated.self)
            .constructor { TestRelated.init }
            .var.string { \.string }
        try context.registry.register(structBuilder.bridge)
        try context.registry.register(relatedBuilder.bridge)

        var result = try context.eval("const bridged = new jx.TestStruct(); bridged.related.string")
        XCTAssertEqual(try result.string, "related")

        result = try context.eval("const related = new jx.TestRelated(); related.string = 'updated'; bridged.related = related; bridged.related.string")
        XCTAssertEqual(try result.string, "updated")
    }

    func testScriptCannotAutoSetMutatedRelatedStruct_UNDESIRED() throws {
        let context = JXContext()
        let structBuilder = JXBridgeBuilder(type: TestStruct.self)
            .constructor { TestStruct.init }
            .var.related { \.related }
        let relatedBuilder = JXBridgeBuilder(type: TestRelated.self)
            .constructor { TestRelated.init }
            .var.string { \.string }
        try context.registry.register(structBuilder.bridge)
        try context.registry.register(relatedBuilder.bridge)

        let result = try context.eval("""
const bridged = new jx.TestStruct();
bridged.related.string = 'updated-ref';
bridged.related.string;
""")
        // This should be 'updated-ref'
        XCTAssertEqual(try result.string, "related")
    }

    func testNativeCodeThrowsException() throws {
        let context = JXContext()
        let structBuilder = JXBridgeBuilder(type: TestStruct.self)
            .constructor { TestStruct.init }
            .func.exceptionFunc { TestStruct.exceptionFunc }
        try context.registry.register(structBuilder.bridge)

        let result = try context.eval("""
const bridged = new jx.TestStruct();
let caughtErr = '';
try {
    bridged.exceptionFunc();
} catch(err) {
    caughtErr = err;
}
caughtErr;
""")
        XCTAssertEqual(try result.string, "Error: TestError(message: \"exceptionFunc error\")")
    }

    func testSubclass() throws {
        let context = JXContext()
        let baseBuilder = JXBridgeBuilder(type: TestBaseClass.self)
            .constructor { TestBaseClass.init }
            .var.computedString { \.computedString }
            .class.var.computedClassString { $0.computedClassString }
            .class.var.baseClassString { $0.baseClassString }
            .class.func.classFunc { $0.classFunc() }
            .static.var.staticString { TestBaseClass.staticString }
        let subclassBuilder = JXBridgeBuilder(type: TestSubClass.self)
            .superclass(TestBaseClass.self)
            .constructor { TestSubClass.init }
            .var.readWriteInt { \.readWriteInt }
            .class.var.subClassString { $0.subClassString }
        try context.registry.register(baseBuilder.bridge)
        try context.registry.register(subclassBuilder.bridge)

        var result = try context.eval("const bridged = new jx.TestSubClass(); bridged.computedString;")
        XCTAssertEqual(try result.string, "sub")

        result = try context.eval("jx.TestSubClass.computedClassString;")
        XCTAssertEqual(try result.string, "subClass")

        result = try context.eval("jx.TestSubClass.baseClassString;")
        XCTAssertEqual(try result.string, "baseOnlyClass")

        result = try context.eval("jx.TestSubClass.classFunc();")
        XCTAssertEqual(try result.string, "subFunc")

        result = try context.eval("jx.TestBaseClass.staticString;")
        XCTAssertEqual(try result.string, "baseStaticString")
    }

    func testPropertyWrapped() throws {
        let context = JXContext()
        let bridge = JXBridgeBuilder(type: TestObservableClass.self)
            .constructor { TestObservableClass.init }
            .var.publishedInt { \.publishedInt }
            .bridge

        let obj = TestObservableClass()
        var updateCount = 0
        var token: Any? = obj.objectWillChange.sink { _ in updateCount += 1 }

        XCTAssertEqual(bridge.properties.count, 1)
        XCTAssertEqual(try bridge.properties[0].get(for: obj, in: context).int, 1)
        let _ = try bridge.properties[0].set(for: obj, value: context.number(2), in: context)
        XCTAssertEqual(try bridge.properties[0].get(for: obj, in: context).int, 2)
        XCTAssertEqual(updateCount, 1)

        if token != nil { // Satisfy compiler by reading value
            token = nil
        }
    }

    func testAsync() async throws {
        let context = JXContext()
        try context.registry.register {
            JXBridgeBuilder(type: TestBaseClass.self)
                .constructor { TestBaseClass.init }
                .var.asyncVar { await $0.asyncVar }
                .func.asyncFunc { TestBaseClass.asyncFunc }
                .bridge
        }
        var result = try await context.eval("const obj = new jx.TestBaseClass(); obj.asyncVar", priority: .low)
        XCTAssertEqual(try result.string, "async")
        
        result = try await context.eval("obj.asyncFunc()", priority: .low)
        XCTAssertEqual(try result.string, "asyncFunc")
        
        result = try await context.eval("""
async function invokeAsync(obj) {
    const result = await obj.asyncFunc();
    return result + "Success";
}
invokeAsync(obj);
""", priority: .low)
        XCTAssertEqual(try result.string, "asyncFuncSuccess")
    }
    
    func testCallbacks() throws {
        let context = JXContext()
        try context.registry.register {
            JXBridgeBuilder(type: TestStruct.self)
                .constructor { TestStruct.init }
                .var.readWriteInt { \.readWriteInt }
                .var.callbackVar { (s: TestStruct) in
                    JXClosure.Arity0(s.callbackVar)
                } set: { (s: TestStruct, v: JXClosure.Arity0<Int>?) in
                    var s = s
                    s.callbackVar = v?.closure
                    return s
                }
                .func.callbackFunc { (s: TestStruct, add: Int, result: JXClosure.Arity1<Int, Void>) in
                    s.callbackFunc(add: add, result: result.closure)
                }
                .bridge
        }
        var result = try context.eval("""
const s = new jx.TestStruct();
s.readWriteInt = 2;
s.callbackVar = () => { return 3; }

let result = 0
let add = s.callbackVar();
s.callbackFunc(add, (r) => { result = r; });
result;
""")
        XCTAssertEqual(try result.int, 5)
        
        var s = TestStruct()
        s.callbackVar = { return 3 }
        result = try context.withValues(s) {
            try context.eval("$0.callbackVar();")
        }
        XCTAssertEqual(try result.int, 3)
    }
    
    func testErrors() throws {
        let context = JXContext()
        try context.registry.register {
            JXBridgeBuilder(type: TestStruct.self)
                .constructor { TestStruct.init }
                .var.readWriteInt { \.readWriteInt }
                .func.exceptionFunc { TestStruct.exceptionFunc }
                .bridge
        }
        try context.registry.register {
            JXBridgeBuilder(type: TestBaseClass.self)
                .bridge
        }

        do {
            try context.eval("var obj = new jx.TestBaseClass();")
            XCTFail("Missing constructor")
        } catch {
            XCTAssertEqual("\(error)", "Error calling TestBaseClass.init: No constructors registered <<script: var obj = new jx.TestBaseClass(); >>")
        }
        
        do {
            try context.eval("var obj = new jx.TestStruct(); obj.readWriteInt = 'a';")
            XCTFail("Bad property type")
        } catch {
            XCTAssertEqual("\(error)", "Error setting TestStruct.readWriteInt: JavaScript value 'a' converted to invalid number 'nan' <<script: var obj = new jx.TestStruct(); obj.readWriteInt = 'a'; >>")
        }
        
        do {
            try context.eval("var obj = new jx.TestStruct(); obj.exceptionFunc(1);")
            XCTFail("Wrong number of arguments")
        } catch {
            XCTAssertEqual("\(error)", "Error calling TestStruct.exceptionFunc: Expected 0 arguments. Received 1 <<script: var obj = new jx.TestStruct(); obj.exceptionFunc(1); >>")
        }
        
        do {
            try context.eval("var obj = new jx.TestStruct(); obj.exceptionFunc();")
            XCTFail("exceptionFunc() should throw")
        } catch {
            XCTAssertEqual("\(error)", "Error calling TestStruct.exceptionFunc: TestError(message: \"exceptionFunc error\") <<script: var obj = new jx.TestStruct(); obj.exceptionFunc(); >>")
        }
    }
}

private struct TestStruct {
    var readWriteInt = 1
    private(set) var readOnlyInt = 2
    var computedInt: Int { return 3 }

    var string = ""
    var related = TestRelated()

    func exceptionFunc() throws {
        throw TestError(message: "exceptionFunc error")
    }
    
    var callbackVar: (() -> Int)?
    
    func callbackFunc(add: Int, result: (Int) -> Void) {
        result(readWriteInt + add)
    }
}

private struct TestRelated {
    var string = "related"
}

private struct TestError: Error {
    let message: String
}

private class TestBaseClass {
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
    
    var asyncVar: String {
        get async {
            return "async"
        }
    }
    
    func asyncFunc() async -> String {
        return "asyncFunc"
    }

    init() {
    }
}

private class TestSubClass: TestBaseClass {
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

private class TestObservableClass: ObservableObject {
    @Published var publishedInt = 1

    init() {
    }
}

#endif // DEBUG
