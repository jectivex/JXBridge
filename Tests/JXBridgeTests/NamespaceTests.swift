@testable import JXBridge
import JXKit
import XCTest

final class NamespaceTests: XCTestCase {
    func testNonDefaultNamespace() throws {
        let context = JXContext()
        let builder = JXBridgeBuilder(type: TestStruct.self)
            .constructor { TestStruct.init }
            .var.intVar { \.intVar }
        try context.registry.add(builder.bridge, namespace: "test")

        let result = try context.eval("const obj = new test.TestStruct(); obj.intVar;")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testImport() throws {
        let context = JXContext()
        let builder = JXBridgeBuilder(type: TestStruct.self)
            .constructor { TestStruct.init }
            .var.intVar { \.intVar }
        try context.registry.add(builder.bridge, namespace: "test")

        let result = try context.eval("jx.import(test.TestStruct); const obj = new TestStruct(); obj.intVar;")
        XCTAssertEqual(try result.int, 1)
    }
}

private struct TestStruct {
    var intVar = 1
}
