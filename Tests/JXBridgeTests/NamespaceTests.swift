import JXBridge
import JXKit
import XCTest

final class NamespaceTests: XCTestCase {
    func testNonDefaultNamespace() throws {
        let context = JXContext()
        try context.registry.register {
            JXBridgeBuilder(type: TestStruct.self, namespace: "test")
                .constructor { TestStruct.init }
                .var.intVar { \.intVar }
                .bridge
        }

        let result = try context.eval("const obj = new test.TestStruct(); obj.intVar;")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testNoneNamespace() throws {
        let context = JXContext()
        try context.registry.register {
            JXBridgeBuilder(type: TestStruct.self, namespace: .none)
                .constructor { TestStruct.init }
                .var.intVar { \.intVar }
                .bridge
        }

        let result = try context.eval("const obj = new TestStruct(); obj.intVar;")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testImport() throws {
        let context = JXContext()
        try context.registry.registerBridge(for: TestStruct.self)
        try context.registry.registerBridge(for: TestStruct2.self)

        let result = try context.eval("jx.import(test.TestStruct, test.TestStruct2); const obj = new TestStruct(); const obj2 = new TestStruct2(); obj2.stringVar + obj.intVar;")
        XCTAssertEqual(try result.string, "a1")
    }
    
    func testImportModule() throws {
        let context = JXContext()
        try context.registry.register(TestModule())

        let result = try context.eval("jx.import(test); const obj = new TestStruct(); const obj2 = new TestStruct2(); obj2.stringVar + obj.intVar + testFunc();")
        XCTAssertEqual(try result.string, "a1testFunc")
    }
}

private struct TestStruct: JXStaticBridging {
    var intVar = 1
    
    static func jxBridge() throws -> JXBridge {
        JXBridgeBuilder(type: TestStruct.self, namespace: "test")
            .constructor { TestStruct.init }
            .var.intVar { \.intVar }
            .bridge
    }
}
private struct TestStruct2: JXStaticBridging {
    var stringVar = "a"
    
    static func jxBridge() throws -> JXBridge {
        JXBridgeBuilder(type: TestStruct2.self, namespace: "test")
            .constructor { TestStruct2.init }
            .var.stringVar { \.stringVar }
            .bridge
    }
}

private class TestModule: JXModule, JXBridging {
    private var typeMap: [String: JXStaticBridging.Type] = [
        "TestStruct": TestStruct.self,
        "TestStruct2": TestStruct2.self
    ]
    
    var namespace = JXNamespace("test")
    
    func initialize(in context: JXContext) throws {
        try context.registry.registerBridge(for: self, namespace: namespace)
        try context.global.integrate(self, namespace: namespace)
    }
    
    func define(symbol: String, namespace: JXNamespace, in context: JXContext) throws -> Bool {
        guard let type = typeMap[symbol] else {
            return false
        }
        try context.registry.registerBridge(for: type)
        return true
    }
    
    func defineAll(namespace: JXNamespace, in context: JXContext) throws -> Bool {
        for entry in typeMap {
            if context.registry.bridge(for: entry.key, namespace: namespace) == nil {
                try context.registry.registerBridge(for: entry.value)
            }
        }
        return true
    }
    
    @JXFunc var jxtestFunc = testFunc
    private func testFunc() -> String {
        return "testFunc"
    }
}
