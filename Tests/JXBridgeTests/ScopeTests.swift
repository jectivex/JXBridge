//
//  ScopeTests.swift
//
//  Created by Abe White on 9/17/22.
//

import JXBridge
import ScriptBridge
import XCTest

final class ScopeTests: XCTestCase {
    func testImportScope() throws {
        let bridge = JXBridge()
        let builder = JXBridgeBuilder(ScopeTestsType.self)
            .constructor { ScopeTestsType.init }
            .var.intProperty { \.intProperty }
        bridge.registry.add(builder.bridge)

        var context = try bridge.newContext()
        var result = try context.eval("""
const x = true;
if (x) {
    jsb.import('ScopeTestsType');
}
const obj = new ScopeTestsType();
obj.intProperty;
""")
        XCTAssertEqual(try result.int, 1)

        context = try bridge.newContext()
        result = try context.eval("""
function someFunc() {
    jsb.import('ScopeTestsType');
}
someFunc();
const obj = new ScopeTestsType();
obj.intProperty;
""")
        XCTAssertEqual(try result.int, 1)
    }
}

private struct ScopeTestsType {
    var intProperty = 1
}
