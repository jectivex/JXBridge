@testable import JXBridge
import JXKit
import XCTest

final class PropertyWrapperTests: XCTestCase {
    func testJX() throws {
        let context = JXContext()
        try context.registry.register(AnyJXBridging())

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
        try context.registry.register(AnyJXBridging())

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
        try context.registry.registerBridge(for: TestClass(intVar: 0))

        let result = try context.eval("const test = new jx.TestClass(1); test.increment(2); test.intVar")
        XCTAssertEqual(try result.int, 3)
    }
    
    func testJXKeyPath() throws {
        let context = JXContext()
        try context.registry.register(AnyJXBridging())

        let test = TestClass(intVar: 1)
        try context.global.integrate(test)
        let result = try context.eval("jx.increment(2); jx.computedVar")
        XCTAssertEqual(try result.int, 6)
    }
    
    func testJXStatic() throws {
        let context = JXContext()
        try context.registry.registerBridge(for: TestClass(intVar: 0))

        let result = try context.eval("jx.TestClass.staticVar = 5; jx.TestClass.staticVar")
        XCTAssertEqual(try result.int, 5)
    }
    
    func testJXStaticFunc() throws {
        let context = JXContext()
        try context.registry.registerBridge(for: TestClass(intVar: 0))

        let result = try context.eval("jx.TestClass.staticFunc()")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testJXClass() throws {
        let context = JXContext()
        try context.registry.registerBridge(for: TestClass(intVar: 0))

        let result = try context.eval("jx.TestClass.classVar")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testJXClassFunc() throws {
        let context = JXContext()
        try context.registry.registerBridge(for: TestClass(intVar: 0))

        let result = try context.eval("jx.TestClass.classFunc()")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testSubclass() throws {
        let context = JXContext()
        try context.registry.registerBridge(for: TestSubClass(intVar: 0))

        var result = try context.eval("const sub = new jx.TestSubClass(2); sub.increment(3); sub.intVar")
        XCTAssertEqual(try result.int, -1) // increment is overridden to decrement
        result = try context.eval("sub.stringVar")
        XCTAssertEqual(try result.string, "a")
        
        result = try context.eval("jx.TestSubClass.classVar")
        XCTAssertEqual(try result.int, 2)
        
        result = try context.eval("jx.TestSubClass.classFunc()")
        XCTAssertEqual(try result.int, 2)
    }
    
#if canImport(Combine)
    func testJXPublished() throws {
        let context = JXContext()
        try context.registry.registerBridge(for: TestObservable(intVar: 0))
        
        let obj = TestObservable(intVar: 1)
        var objectUpdateCount = 0
        var jxPublishedUpdateCount = 0
        var jxPublishedValue = 0
        var publishedUpdateCount = 0
        var publishedValue = 0.0
        var objectWillChangeToken: Any? = obj.objectWillChange.sink { _ in objectUpdateCount += 1 }
        var jxPublishedWillChangeToken: Any? = obj.$intVar.sink { value in
            jxPublishedUpdateCount += 1
            jxPublishedValue = value
        }
        var publishedWillChangeToken: Any? = obj.$publishedVar.sink { value in
            publishedUpdateCount += 1
            publishedValue = value
        }
        
        XCTAssertEqual(jxPublishedUpdateCount, 1)
        XCTAssertEqual(jxPublishedValue, 1)
        XCTAssertEqual(publishedUpdateCount, 1)
        XCTAssertEqual(publishedValue, 1.0)

        obj.intVar += 1
        XCTAssertEqual(obj.intVar, 2)
        XCTAssertEqual(objectUpdateCount, 1)
        XCTAssertEqual(jxPublishedUpdateCount, 2)
        XCTAssertEqual(jxPublishedValue, 2)
        XCTAssertEqual(publishedUpdateCount, 1)
        XCTAssertEqual(publishedValue, 1.0)
        
        try context.withValues(obj) {
            try context.eval("$0.intVar += 1")
        }
        XCTAssertEqual(obj.intVar, 3)
        XCTAssertEqual(objectUpdateCount, 2)
        XCTAssertEqual(jxPublishedUpdateCount, 3)
        XCTAssertEqual(jxPublishedValue, 3)
        XCTAssertEqual(publishedUpdateCount, 1)
        XCTAssertEqual(publishedValue, 1.0)
        
        obj.publishedVar += 1.0
        XCTAssertEqual(obj.intVar, 3)
        XCTAssertEqual(objectUpdateCount, 3)
        XCTAssertEqual(jxPublishedUpdateCount, 3)
        XCTAssertEqual(jxPublishedValue, 3)
        XCTAssertEqual(publishedUpdateCount, 2)
        XCTAssertEqual(publishedValue, 2.0)

        if objectWillChangeToken != nil { // Satisfy compiler by reading value
            objectWillChangeToken = nil
        }
        if jxPublishedWillChangeToken != nil {
            jxPublishedWillChangeToken = nil
        }
        if publishedWillChangeToken != nil {
            publishedWillChangeToken = nil
        }
    }
#endif
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

private class TestSubClass: TestClass {
    @JXInit var subinit = TestSubClass.init
    
    @JX var stringVar = "a"
    
    override func increment(by: Int) -> Int {
        intVar -= by
        return intVar
    }
    
    override class var classVar: Int {
        return 2
    }
    
    override class func classFunc() -> Int {
        return 2
    }
}

#if canImport(Combine)
private class TestObservable: ObservableObject, JXBridging {
    init(intVar: Int) {
        self.intVar = intVar
    }
    
    @JXPublished var intVar: Int
    @Published var publishedVar = 1.0
}
#endif
