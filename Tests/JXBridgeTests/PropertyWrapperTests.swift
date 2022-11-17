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
}

private class TestClass: JXBridging {
    @JX var intVar: Int
    
    @JXInit var jxinit = TestClass.init
    init(intVar: Int) {
        self.intVar = intVar
    }
    
    @JXFunc var jxincrement = increment
    func increment(by: Int) -> Int {
        intVar += by
        return intVar
    }
    
//    @JXFunc var jxclassName = typeName
//    static func typeName() -> String {
//        return "TestClass"
//    }
}
