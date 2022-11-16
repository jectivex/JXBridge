@testable import JXBridge
import JXKit
import XCTest

final class PropertyWrapperTests: XCTestCase {
    func testJX() throws {
        let context = JXContext()
        try context.registry.add(AnyJXBridging())

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
    
    func testJXFunc() throws {
        let context = JXContext()
        try context.registry.add(AnyJXBridging())

        let test = TestClass()
        try context.global.integrate(test)
        var result = try context.eval("jx.increment(2)")
        XCTAssertEqual(try result.int, 3)
        result = try context.eval("jx.intVar")
        XCTAssertEqual(try result.int, 3)
    }
}

private class TestClass: JXBridging {
    @JX var intVar = 1
    @JX var optionalVar: String?
    
    @JXFunc var jxincrement = increment
    func increment(by: Int) -> Int {
        intVar += by
        return intVar
    }
}
