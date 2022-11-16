@testable import JXBridge
import JXKit
import XCTest

final class IntegrateTests: XCTestCase {
    func testStruct() throws {
        let context = JXContext()
        try context.registry.add(TestModule())

        var result = try context.eval("test.intVar")
        XCTAssertEqual(try result.int, 1)
        
        result = try context.eval("test.intVar += 1; test.addFunc(2)")
        XCTAssertEqual(try result.int, 4)
    }
   
    func testClass() throws {
        let context = JXContext()
        let module = TestModule()
        try context.registry.add(module)

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
    
    var namespace = JXNamespace("test")
    
    func register(with registry: JXRegistry) throws {
        try registry.add(for: TestStruct.self)
        try registry.add(for: TestClass.self)
    }
    
    func initialize(namespaceObject: JXValue) throws {
        try namespaceObject.integrate(TestStruct())
        try namespaceObject.integrate(testClass!)
    }
}

private struct TestStruct: JXStaticBridging {
    var intVar = 1
    
    mutating func addFunc(_ value: Int) -> Int {
        intVar += value
        return intVar
    }
    
    static var jxBridge: JXBridge {
        return JXBridgeBuilder(type: self, namespace: "test")
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
    
    class var jxBridge: JXBridge {
        return JXBridgeBuilder(type: self, namespace: "test")
            .var.stringVar { \.stringVar }
            .func.appendFunc { $0.appendFunc($1) }
            .bridge
    }
}
