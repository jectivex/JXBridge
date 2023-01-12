import JXBridge
import JXKit
import XCTest

final class NamespaceTests: XCTestCase {
    func testNoneNamespace() throws {
        let context = JXContext()
        XCTAssertTrue(try context.global.hasNamespace(.none))
        XCTAssertFalse(try context.global[JXNamespace.none].isUndefined)
        XCTAssertFalse(try context.global.addNamespace(JXNamespace.none).isUndefined)
        XCTAssertFalse(try context.global.deleteNamespace(.none))
    }
    
    func testSingleTokenNamespace() throws {
        try namespaceTest("test")
    }
    
    func testMultipleTokenNamespace() throws {
        try namespaceTest("com.domain.test")
    }
    
    private func namespaceTest(_ namespace: JXNamespace) throws {
        let context = JXContext()
        XCTAssertFalse(try context.global.hasNamespace(namespace))
        XCTAssertTrue(try context.global[namespace].isUndefined)
        XCTAssertFalse(try context.global.deleteNamespace(namespace))
        
        XCTAssertFalse(try context.global.addNamespace(namespace).isUndefined)
        XCTAssertTrue(try context.global.hasNamespace(namespace))
        XCTAssertFalse(try context.global[namespace].isUndefined)
        XCTAssertTrue(try context.global.deleteNamespace(namespace))
    }
    
    func testNamespaceBridge() throws {
        let context = JXContext()
        try context.registry.register {
            JXBridgeBuilder(type: TestStruct.self, namespace: "test.bridge")
                .constructor { TestStruct.init }
                .var.intVar { \.intVar }
                .bridge
        }

        let result = try context.eval("const obj = new test.bridge.TestStruct(); obj.intVar;")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testNoneNamespaceBridge() throws {
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

        let result = try context.eval("test.import(); const obj = new TestStruct(); const obj2 = new TestStruct2(); obj2.stringVar + obj.intVar;")
        XCTAssertEqual(try result.string, "a1")
    }
    
    func testAlias() throws {
        let context = JXContext()
        try context.registry.register(TestModule())

        let result = try context.eval("const { TestStruct: TS, TestStruct2: TS2 } = test; const obj = new TS(); const obj2 = new TS2(); obj2.stringVar + obj.intVar;")
        XCTAssertEqual(try result.string, "a1")
    }
    
    func testModuleAlias() throws {
        let context = JXContext()
        try context.registry.register(TestModule())

        let result = try context.eval("const t = test; const obj = new t.TestStruct(); const obj2 = new t.TestStruct2(); obj2.stringVar + obj.intVar + t.testFunc();")
        XCTAssertEqual(try result.string, "a1testFunc")
    }
}

private struct TestStruct: JXBridging {
    var intVar = 1
    
    static func jxBridge() throws -> JXBridge {
        JXBridgeBuilder(type: TestStruct.self, namespace: "test")
            .constructor { TestStruct.init }
            .var.intVar { \.intVar }
            .bridge
    }
}
private struct TestStruct2: JXBridging {
    var stringVar = "a"
    
    static func jxBridge() throws -> JXBridge {
        JXBridgeBuilder(type: TestStruct2.self, namespace: "test")
            .constructor { TestStruct2.init }
            .var.stringVar { \.stringVar }
            .bridge
    }
}

private class TestModule: JXModule, JXBridging {
    private var typeMap: [String: JXBridging.Type] = [
        "TestStruct": TestStruct.self,
        "TestStruct2": TestStruct2.self
    ]
    
    static let namespace = JXNamespace("test")
    
    func define(symbol: String, namespace: JXNamespace, in context: JXContext) throws -> Bool {
        guard let type = typeMap[symbol] else {
            return false
        }
        try context.registry.registerBridge(for: type)
        return true
    }
    
    func defineAll(in context: JXContext) throws -> Bool {
        for entry in typeMap {
            if context.registry.bridge(for: entry.key, namespace: namespace) == nil {
                try context.registry.registerBridge(for: entry.value)
            }
        }
        return true
    }
    
    private func testFunc() -> String {
        return "testFunc"
    }
    
    static func jxBridge() throws -> JXBridge {
        return JXBridgeBuilder(type: self, namespace: namespace)
            .func.testFunc { $0.testFunc() }
            .bridge
    }
}
