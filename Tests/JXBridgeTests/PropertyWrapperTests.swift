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
    
    func testJXStatic() throws {
        let context = JXContext()
        try context.registry.add(for: TestClass(intVar: 0))

        let result = try context.eval("jx.TestClass.staticVar = 5; jx.TestClass.staticVar")
        XCTAssertEqual(try result.int, 5)
    }
    
    func testJXStaticFunc() throws {
        let context = JXContext()
        try context.registry.add(for: TestClass(intVar: 0))

        let result = try context.eval("jx.TestClass.staticFunc()")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testJXClass() throws {
        let context = JXContext()
        try context.registry.add(for: TestClass(intVar: 0))

        let result = try context.eval("jx.TestClass.classVar")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testJXClassFunc() throws {
        let context = JXContext()
        try context.registry.add(for: TestClass(intVar: 0))

        let result = try context.eval("jx.TestClass.classFunc()")
        XCTAssertEqual(try result.int, 1)
    }
}

private class TestClass: JXBridging {
    @JXInit var jxinit = TestClass.init
    init(intVar: Int) {
        self.intVar = intVar
    }
    
    @JX var intVar: Int
    
    @JXKeyPath var jxcomputedVar = \TestClass.computedVar
    var computedVar: Int {
        return intVar * 2
    }
    
    @JXFunc var jxincrement = increment
    func increment(by: Int) -> Int {
        intVar += by
        return intVar
    }
    
    @JXStatic var jxstaticVar = (get: { TestClass.staticVar }, set: { TestClass.staticVar = $0 })
    static var staticVar: Int?
    
    @JXStaticFunc var jxstaticFunc = staticFunc
    static func staticFunc() -> Int {
        return 1
    }
    
    @JXClass var jxclassVar = (TestClass.self, { $0.classVar })
    class var classVar: Int {
        return 1
    }
    
    @JXClassFunc var jxclassFunc = (TestClass.self, { $0.classFunc() })
    class func classFunc() -> Int {
        return 1
    }
}
