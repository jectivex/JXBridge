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
    
    func testStructVars() throws {
        let context = JXContext()
        let builder = JXBridgeBuilder(JXBridgedStruct.self)
            .constructor { JXBridgedStruct.init }
            .var.readWriteInt { \.readWriteInt }
            .var.readOnlyInt { \.readOnlyInt }
            .var.computedInt { \.computedInt }
        context.registry.add(builder.bridge)
        try context.eval("jxb.import('JXBridgedStruct');")

        var result = try context.eval("const obj = new JXBridgedStruct(); obj.readWriteInt;")
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
        let builder = JXBridgeBuilder(JXBridgedStruct.self)
            .constructor { JXBridgedStruct.init }
            .var.readOnlyInt { \.readOnlyInt }
        context.registry.add(builder.bridge)
        try context.eval("jxb.import('JXBridgedStruct');")

        // We should not be able to set this private property
        let result = try context.eval("const obj = new JXBridgedStruct(); obj.readOnlyInt = 102; obj.readOnlyInt")
        XCTAssertEqual(try result.int, 102)
    }

    func testRelatedObject() throws {
        let context = JXContext()
        let structBuilder = JXBridgeBuilder(JXBridgedStruct.self)
            .constructor { JXBridgedStruct.init }
            .var.related { \.related }
        let relatedBuilder = JXBridgeBuilder(JXBridgedRelated.self)
            .constructor { JXBridgedRelated.init }
            .var.string { \.string }
        context.registry.add(structBuilder.bridge)
        context.registry.add(relatedBuilder.bridge)

        try context.eval("jxb.import('JXBridgedStruct', 'JXBridgedRelated');")

        var result = try context.eval("const bridged = new JXBridgedStruct(); bridged.related.string")
        XCTAssertEqual(try result.string, "related")

        result = try context.eval("const related = new JXBridgedRelated(); related.string = 'updated'; bridged.related = related; bridged.related.string")
        XCTAssertEqual(try result.string, "updated")
    }

    func testScriptCannotAutoSetMutatedRelatedStruct_UNDESIRED() throws {
        let context = JXContext()
        let structBuilder = JXBridgeBuilder(JXBridgedStruct.self)
            .constructor { JXBridgedStruct.init }
            .var.related { \.related }
        let relatedBuilder = JXBridgeBuilder(JXBridgedRelated.self)
            .constructor { JXBridgedRelated.init }
            .var.string { \.string }
        context.registry.add(structBuilder.bridge)
        context.registry.add(relatedBuilder.bridge)

        let result = try context.eval("""
jxb.import('JXBridgedStruct', 'JXBridgedRelated');
const bridged = new JXBridgedStruct();
bridged.related.string = 'updated-ref';
bridged.related.string;
""")
        // This should be 'updated-ref'
        XCTAssertEqual(try result.string, "related")
    }

    func testNativeCodeThrowsException() throws {
        let context = JXContext()
        let structBuilder = JXBridgeBuilder(JXBridgedStruct.self)
            .constructor { JXBridgedStruct.init }
            .func.exceptionFunc { JXBridgedStruct.exceptionFunc }
        context.registry.add(structBuilder.bridge)

        let result = try context.eval("""
jxb.import('JXBridgedStruct');
const bridged = new JXBridgedStruct();
let caughtErr = '';
try {
    bridged.exceptionFunc();
} catch(err) {
    caughtErr = err;
}
caughtErr;
""")
        XCTAssertEqual(try result.string, "Error: JXBridgedError(message: \"exceptionFunc error\")")
    }

    func testSubclass() throws {
        let context = JXContext()
        let baseBuilder = JXBridgeBuilder(JXBridgedBaseClass.self)
            .constructor { JXBridgedBaseClass.init }
            .var.computedString { \.computedString }
            .class.var.computedClassString { $0.computedClassString }
            .class.var.baseClassString { $0.baseClassString }
            .class.func.classFunc { $0.classFunc() }
            .static.var.staticString { JXBridgedBaseClass.staticString }
        let subclassBuilder = JXBridgeBuilder(JXBridgedSubClass.self)
            .superclass(JXBridgedBaseClass.self)
            .constructor { JXBridgedSubClass.init }
            .var.readWriteInt { \.readWriteInt }
            .class.var.subClassString { $0.subClassString }
        context.registry.add(baseBuilder.bridge)
        context.registry.add(subclassBuilder.bridge)

        try context.eval("jxb.import('JXBridgedSubClass');")

        var result = try context.eval("const bridged = new JXBridgedSubClass(); bridged.computedString;")
        XCTAssertEqual(try result.string, "sub")

        result = try context.eval("JXBridgedSubClass.computedClassString;")
        XCTAssertEqual(try result.string, "subClass")

        result = try context.eval("JXBridgedSubClass.baseClassString;")
        XCTAssertEqual(try result.string, "baseOnlyClass")

        result = try context.eval("JXBridgedSubClass.classFunc();")
        XCTAssertEqual(try result.string, "subFunc")

        result = try context.eval("JXBridgedBaseClass.staticString;")
        XCTAssertEqual(try result.string, "baseStaticString")
    }

    func testPropertyWrapped() throws {
        let context = JXContext()
        let bridge = JXBridgeBuilder(JXBridgedBaseClass.self)
            .constructor { JXBridgedBaseClass.init }
            .var.publishedInt { \.publishedInt }
            .bridge

        let obj = JXBridgedBaseClass()
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
