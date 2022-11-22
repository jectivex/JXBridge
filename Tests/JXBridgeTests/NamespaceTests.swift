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
        try context.registry.register {
            JXBridgeBuilder(type: TestStruct.self, namespace: "test")
                .constructor { TestStruct.init }
                .var.intVar { \.intVar }
                .bridge
        }

        let result = try context.eval("jx.import(test.TestStruct); const obj = new TestStruct(); obj.intVar;")
        XCTAssertEqual(try result.int, 1)
    }
}

private struct TestStruct {
    var intVar = 1
}
