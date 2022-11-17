@testable import JXBridge
import JXKit
import XCTest

final class PropertyWrapperTests: XCTestCase {
    func testJX() throws {
        let context = JXContext()
        try context.registry.add(AnyJXBridging())

        let test = TestClass(intVar: 1)
        try context.global.integrate(test)
        var result = try context.eval("jx.intVar")
        XCTAssertEqual(try result.int, 1)
        
        result = try context.eval("jx.intVar += 2; jx.intVar")
        XCTAssertEqual(try result.int, 3)
        
        XCTAssertEqual(test.intVar, 3)
        test.intVar += 1
        result = try context.eval("jx.intVar")
        XCTAssertEqual(try result.int, 4)
    }
    
    func testJXFunc() throws {
        let context = JXContext()
        try context.registry.add(AnyJXBridging())

        let test = TestClass(intVar: 1)
        try context.global.integrate(test)
        var result = try context.eval("jx.increment(2)")
        XCTAssertEqual(try result.int, 3)
        result = try context.eval("jx.intVar")
        XCTAssertEqual(try result.int, 3)
        XCTAssertEqual(test.intVar, 3)
    }
    
    func testJXInit() throws {
        let context = JXContext()
        try context.registry.add(for: TestClass(intVar: 0))

        let result = try context.eval("const test = new jx.TestClass(1); test.increment(2); test.intVar")
        XCTAssertEqual(try result.int, 3)
    }
    
    func testJXKeyPath() throws {
        let context = JXContext()
        try context.registry.add(AnyJXBridging())

        let test = TestClass(intVar: 1)
        try context.global.integrate(test)
        let result = try context.eval("jx.increment(2); jx.computedVar")
        XCTAssertEqual(try result.int, 6)
    }
}

private class TestClass: JXBridging {
    init(intVar: Int) {
        self.intVar = intVar
    }
    @JXInit var jxinit = TestClass.init
    
    @JX var intVar: Int
    
    var computedVar: Int {
        return intVar * 2
    }
    @JXKeyPath var jxcomputedVar = \TestClass.computedVar
    
    func increment(by: Int) -> Int {
        intVar += by
        return intVar
    }
    @JXFunc var jxincrement = increment
}
