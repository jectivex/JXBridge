import Combine
@testable import JXBridge
import JXKit
import XCTest

final class BridgedTypeTests: XCTestCase {
    func testBoxTypes() throws {
        let context = JXContext()
        let builder = JXBridgeBuilder(type: JXBridgedStruct.self)
            .constructor { JXBridgedStruct.init }
            .var.readWriteInt { \.readWriteInt }
            .var.readOnlyInt { \.readOnlyInt }
            .var.computedInt { \.computedInt }
            .var.string { \.string }
        try context.registry.add(builder.bridge)
        guard let bridge = context.registry.bridge(for: JXBridgedStruct.self) else {
            XCTFail()
            return
        }
        let box = InstanceBox(JXBridgedStruct(), bridge: bridge, registry: context.registry)
        let readWriteInt = context.string("readWriteInt")
        let intReturn = try box.get(property: readWriteInt)
        XCTAssertTrue(intReturn.isNumber)
        try box.set(property: readWriteInt, value: context.number(99.0))
        XCTAssertEqual(try box.get(property: readWriteInt).double, 99.0)
    }
    
    func testStructVars() throws {
        let context = JXContext()
        let builder = JXBridgeBuilder(type: JXBridgedStruct.self)
            .constructor { JXBridgedStruct.init }
            .var.readWriteInt { \.readWriteInt }
            .var.readOnlyInt { \.readOnlyInt }
            .var.computedInt { \.computedInt }
        try context.registry.add(builder.bridge)

        var result = try context.eval("const obj = new jx.JXBridgedStruct(); obj.readWriteInt;")
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
        let builder = JXBridgeBuilder(type: JXBridgedStruct.self)
            .constructor { JXBridgedStruct.init }
            .var.readOnlyInt { \.readOnlyInt }
        try context.registry.add(builder.bridge)

        // We should not be able to set this private property
        let result = try context.eval("const obj = new jx.JXBridgedStruct(); obj.readOnlyInt = 102; obj.readOnlyInt")
        XCTAssertEqual(try result.int, 102)
    }

    func testRelatedObject() throws {
        let context = JXContext()
        let structBuilder = JXBridgeBuilder(type: JXBridgedStruct.self)
            .constructor { JXBridgedStruct.init }
            .var.related { \.related }
        let relatedBuilder = JXBridgeBuilder(type: JXBridgedRelated.self)
            .constructor { JXBridgedRelated.init }
            .var.string { \.string }
        try context.registry.add(structBuilder.bridge)
        try context.registry.add(relatedBuilder.bridge)

        var result = try context.eval("const bridged = new jx.JXBridgedStruct(); bridged.related.string")
        XCTAssertEqual(try result.string, "related")

        result = try context.eval("const related = new jx.JXBridgedRelated(); related.string = 'updated'; bridged.related = related; bridged.related.string")
        XCTAssertEqual(try result.string, "updated")
    }

    func testScriptCannotAutoSetMutatedRelatedStruct_UNDESIRED() throws {
        let context = JXContext()
        let structBuilder = JXBridgeBuilder(type: JXBridgedStruct.self)
            .constructor { JXBridgedStruct.init }
            .var.related { \.related }
        let relatedBuilder = JXBridgeBuilder(type: JXBridgedRelated.self)
            .constructor { JXBridgedRelated.init }
            .var.string { \.string }
        try context.registry.add(structBuilder.bridge)
        try context.registry.add(relatedBuilder.bridge)

        let result = try context.eval("""
const bridged = new jx.JXBridgedStruct();
bridged.related.string = 'updated-ref';
bridged.related.string;
""")
        // This should be 'updated-ref'
        XCTAssertEqual(try result.string, "related")
    }

    func testNativeCodeThrowsException() throws {
        let context = JXContext()
        let structBuilder = JXBridgeBuilder(type: JXBridgedStruct.self)
            .constructor { JXBridgedStruct.init }
            .func.exceptionFunc { JXBridgedStruct.exceptionFunc }
        try context.registry.add(structBuilder.bridge)

        let result = try context.eval("""
const bridged = new jx.JXBridgedStruct();
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
        let baseBuilder = JXBridgeBuilder(type: JXBridgedBaseClass.self)
            .constructor { JXBridgedBaseClass.init }
            .var.computedString { \.computedString }
            .class.var.computedClassString { $0.computedClassString }
            .class.var.baseClassString { $0.baseClassString }
            .class.func.classFunc { $0.classFunc() }
            .static.var.staticString { JXBridgedBaseClass.staticString }
        let subclassBuilder = JXBridgeBuilder(type: JXBridgedSubClass.self)
            .constructor { JXBridgedSubClass.init }
            .var.readWriteInt { \.readWriteInt }
            .class.var.subClassString { $0.subClassString }
        try context.registry.add(baseBuilder.bridge)
        try context.registry.add(subclassBuilder.bridge)

        var result = try context.eval("const bridged = new jx.JXBridgedSubClass(); bridged.computedString;")
        XCTAssertEqual(try result.string, "sub")

        result = try context.eval("jx.JXBridgedSubClass.computedClassString;")
        XCTAssertEqual(try result.string, "subClass")

        result = try context.eval("jx.JXBridgedSubClass.baseClassString;")
        XCTAssertEqual(try result.string, "baseOnlyClass")

        result = try context.eval("jx.JXBridgedSubClass.classFunc();")
        XCTAssertEqual(try result.string, "subFunc")

        result = try context.eval("jx.JXBridgedBaseClass.staticString;")
        XCTAssertEqual(try result.string, "baseStaticString")
    }

    func testPropertyWrapped() throws {
        let context = JXContext()
        let bridge = JXBridgeBuilder(type: JXBridgedBaseClass.self)
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
