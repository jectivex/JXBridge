import JXBridge
import JXKit
import XCTest

final class IntegrateTests: XCTestCase {
    func testStruct() throws {
        let context = JXContext()
        try context.registry.register(TestModule())

        var result = try context.eval("test.intVar")
        XCTAssertEqual(try result.int, 1)
        
        result = try context.eval("test.intVar += 1; test.addFunc(2)")
        XCTAssertEqual(try result.int, 4)
    }
   
    func testClass() throws {
        let context = JXContext()
        let module = TestModule()
        try context.registry.register(module)

        var result = try context.eval("test.stringVar")
        XCTAssertEqual(try result.string, "a")
        
        result = try context.eval("test.stringVar += 'bc'; test.appendFunc('de');")
        XCTAssertEqual(try result.string, "abcde")
        
        module.testClass = nil // Should dealloc backing instance
        do {
            try context.eval("test.appendFunc('fg')")
            XCTFail("Expected invalid instance error")
        } catch {
            // Expected
        }
    }
}

private class TestModule: JXModule {
    var testClass: TestClass? = TestClass() // Allow assignment to nil to test weak ref
    
    static let namespace = JXNamespace("test")
    
    func register(with registry: JXRegistry) throws {
        try registry.registerBridge(for: TestStruct.self, namespace: Self.namespace)
        try registry.registerBridge(for: TestClass.self, namespace: Self.namespace)
    }
    
    func initialize(in context: JXContext) throws {
        try context.global.integrate(TestStruct(), namespace: Self.namespace)
        try context.global.integrate(testClass!, namespace: Self.namespace)
    }
}

private struct TestStruct: JXStaticBridging {
    var intVar = 1
    
    mutating func addFunc(_ value: Int) -> Int {
        intVar += value
        return intVar
    }
    
    static func jxBridge() -> JXBridge {
        return JXBridgeBuilder(type: self)
            .var.intVar { \.intVar }
            .mutating.func.addFunc { $0.addFunc($1) }
            .bridge
    }
}

private class TestClass: JXStaticBridging {
    var stringVar = "a"
    
    func appendFunc(_ value: String) -> String {
        stringVar += value
        return stringVar
    }
    
    class func jxBridge() -> JXBridge {
        return JXBridgeBuilder(type: self)
            .var.stringVar { \.stringVar }
            .func.appendFunc { $0.appendFunc($1) }
            .bridge
    }
}
