@testable import JXBridge
import JXKit
import XCTest

final class ScopeTests: XCTestCase {
    private var context: JXContext!

    override func setUp() {
        super.setUp()
        context = JXContext()
        let builder = JXBridgeBuilder(type: ScopeTestsType.self)
            .constructor { ScopeTestsType.init }
            .var.intProperty { \.intProperty }
        context.registry.add(builder.bridge)
    }

    func testImportScope1() throws {
        let result = try context.eval("""
const x = true;
if (x) {
    jxb.import('ScopeTestsType');
}
const obj = new ScopeTestsType();
obj.intProperty;
""")
        XCTAssertEqual(try result.int, 1)
    }

    func testImportScope2() throws {
        let result = try context.eval("""
function someFunc() {
    jxb.import('ScopeTestsType');
}
someFunc();
const obj = new ScopeTestsType();
obj.intProperty;
""")
        XCTAssertEqual(try result.int, 1)
    }
}

private struct ScopeTestsType {
    var intProperty = 1
}
