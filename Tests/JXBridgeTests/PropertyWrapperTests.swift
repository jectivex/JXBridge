@testable import JXBridge
import JXKit
import XCTest

final class PropertyWrapperTests: XCTestCase {
    func testJX() throws {
        let context = JXContext()
        try context.registry.add(for: TestClass())

        let test = TestClass()
        try context.global.integrate(test)
        var result = try context.eval("jx.intVar")
        XCTAssertEqual(try result.int, 1)
        
        result = try context.eval("jx.intVar += 2; jx.intVar")
        XCTAssertEqual(try result.int, 3)
        
        result = try context.eval("jx.optionalVar")
        XCTAssertTrue(result.isNull)
        
        result = try context.eval("jx.optionalVar = 'abc'; jx.optionalVar")
        XCTAssertEqual(try result.string, "abc")
    }
}

private class TestClass: JXBridging {
    @JX var intVar = 1
    @JX var optionalVar: String?
}
