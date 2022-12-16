import JXKit
import XCTest

#if DEBUG
@testable import JXBridge

final class JSModuleScriptTests: XCTestCase {
    func testModuleScriptString() throws {
        let context = JXContext()
        try context.prepareBridge()
        let exports = try context.evalModule(moduleJS)
        
        XCTAssertFalse(context.global.hasProperty("module"))
        XCTAssertFalse(context.global.hasProperty("name"))
        XCTAssertFalse(context.global.hasProperty("getNameFunction"))
        XCTAssertFalse(context.global.hasProperty("getName"))
        XCTAssertFalse(context.global.hasProperty("NameTypeClass"))
        XCTAssertFalse(context.global.hasProperty("NameType"))
        XCTAssertFalse(context.global.hasProperty("privateName"))
        
        XCTAssertFalse(exports.hasProperty("name"))
        XCTAssertFalse(exports.hasProperty("getNameFunction"))
        XCTAssertTrue(exports.hasProperty("getName"))
        let name = try exports["getName"].call()
        XCTAssertEqual(try name.string, "foo")
        XCTAssertFalse(exports.hasProperty("NameTypeClass"))
        XCTAssertTrue(exports.hasProperty("NameType"))
        XCTAssertFalse(exports.hasProperty("privateName"))
        
        try context.global.integrate(exports)
        let result = try context.eval("const obj = new NameType(); obj.getClassName()")
        XCTAssertEqual(try result.string, "classprivatefoo")
    }
    
    func testJXModuleWithScript() throws {
        let context = JXContext()
        try context.registry.register(TestModule())
        let result = try context.eval("const obj = new module.test.NameType(); obj.getClassName()")
        XCTAssertEqual(try result.string, "classprivatefoo")
    }
}

private let moduleJS = """
var name = 'foo';
function getNameFunction() {
    return name;
}

class NameTypeClass {
    getClassName() {
        return 'class' + privateName();
    }
}

function privateName() {
    return 'private' + name;
}

exports.getName = getNameFunction;
exports.NameType = NameTypeClass;
"""

private struct TestModule: JXModule {
    let namespace = JXNamespace("module.test")
    
    func register(with registry: JXRegistry) throws {
        try registry.registerModuleScript(moduleJS, namespace: namespace)
    }
}

#endif
