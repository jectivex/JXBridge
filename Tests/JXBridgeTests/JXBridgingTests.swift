@testable import JXBridge
import JXKit
import XCTest

final class JXBridgingTests: XCTestCase {
    func testStructVars() throws {
        let context = JXContext()
        context.registry.add(JXBridge(reflecting: JXBridgingStruct()))
        try context.eval("jxb.import('JXBridgingStruct');")

        var result = try context.eval("const obj = new JXBridgingStruct(); obj.intVar;")
        XCTAssertEqual(try result.int, 1)
        result = try context.eval("obj.intVar = 101; obj.intVar;")
        XCTAssertEqual(try result.int, 101)

        result = try context.eval("obj.stringVar;")
        XCTAssertEqual(try result.string, "string")
    }
}

private struct JXBridgingStruct: JXBridging {
    var intVar = 1
    var stringVar = "string"

    init() {
    }

    @JXConstructor var _init = Self.init
    @JXVar var _intVar = \Self.intVar

    func bridge(with builder: JXBridgeBuilder<Self>) {
        builder.var.stringVar { \Self.stringVar }
    }
}
