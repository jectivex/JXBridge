//
//  JXBContextTests.swift
//
//  Created by Abe White on 9/18/22.
//

import JXBridge
import JXKit
import ScriptBridge
import XCTest

final class JXBContextTests: XCTestCase {
    var _context: JXBContext!

    override func setUpWithError() throws {
        try super.setUpWithError()

        let bridge = JXBridge()
        let builder = JXBridgeBuilder(JXBContextTestsType.self)
            .constructor { JXBContextTestsType.init }
            .var.intProperty { \.intProperty }
        bridge.registry.add(builder.bridge)

        let context = try bridge.newContext()
        try context.import(JXBContextTestsType.self)
        _context = context
    }

    func testValueForKey() throws {
        let context = _context!
        try context.eval("""
var testNil = null;
var testInt = 1;
var testObject = new JXBContextTestsType();
testObject.intProperty = 2;
""")
        var result = try context.value(for: "testNil")
        XCTAssertTrue(result.isNull)

        result = try context.value(for: "testInt")
        XCTAssertEqual(try result.int, 1)

        result = try context.value(for: "testObject")
        let value = try result.value
        if let object = value as? JXBContextTestsType {
            XCTAssertEqual(object.intProperty, 2)
        } else {
            XCTFail()
        }
    }

    func testSetValueForKey() throws {
        let context = _context!
        try context.set(nil, for: "testNil")
        try context.set(1, for: "testInt")
        var obj = JXBContextTestsType()
        obj.intProperty = 2
        try context.set(obj, for: "testObject")

        var result = try context.eval("'|' + testNil + '|' + testInt + '|' + testObject.intProperty + '|'")
        XCTAssertEqual(try result.string, "|null|1|2|")

        try context.set(2, for: "testInt")
        obj.intProperty = 3
        try context.set(obj, for: "testObject")
        result = try context.eval("'|' + testInt + '|' + testObject.intProperty + '|'")
        XCTAssertEqual(try result.string, "|2|3|")
    }

    func testJXKitSimpleEvalPerformance() throws {
        let vm = JXVM()
        let startTime = CFAbsoluteTimeGetCurrent()
        try _performSimpleEval(vm: vm)
        let firstTime = CFAbsoluteTimeGetCurrent()
        for _ in 0 ..< 100 {
            try _performSimpleEval(vm: vm)
        }
        let endTime = CFAbsoluteTimeGetCurrent()
        print("JavaScriptCore first eval time: \(firstTime - startTime)")
        print("JavaScriptCore avg next 100 times: \((endTime - firstTime) / 100.0)")
    }

    func testJXBridgeSimpleEvalPerformance() throws {
        let bridge = JXBridge()
        let startTime = CFAbsoluteTimeGetCurrent()
        try _performSimpleEval(bridge: bridge)
        let firstTime = CFAbsoluteTimeGetCurrent()
        for _ in 0 ..< 100 {
            try _performSimpleEval(bridge: bridge)
        }
        let endTime = CFAbsoluteTimeGetCurrent()
        print("JXBridge first eval time: \(firstTime - startTime)")
        print("JXBridge avg next 100 times: \((endTime - firstTime) / 100.0)")
    }

    private func _performSimpleEval(vm: JXVM) throws {
        let context = JXContext(virtualMachine: vm)
        let result = try context.eval("1 + 1;")
        XCTAssertEqual(Int(try result.numberValue), 2)
    }

    private func _performSimpleEval(bridge: JXBridge) throws {
        let context = try bridge.newContext()
        let result = try context.eval("1 + 1;")
        XCTAssertEqual(try result.int, 2)
    }
}

private struct JXBContextTestsType {
    var intProperty = 1
}
