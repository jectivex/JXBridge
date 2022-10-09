//
//  ConverterTests.swift
//  
//  Created by Abe White on 8/16/22.
//

@testable import ScriptBridge
import XCTest

final class ConverterTests: XCTestCase {
    func testOptional() throws {
        let registry = JXBridgeRegistry()

        let nilValue: Int? = nil
        let nilArgument: Any? = nilValue

        let convertedNilValue = try Converter.convertFromScript(typeName: "", function: "", argument: nilArgument, index: 0, to: type(of: nilValue), registry: registry)
        XCTAssertNil(convertedNilValue)

        let nonnilValue: Int? = 1
        let nonnilArgument: Any? = nonnilValue
        let convertedNonilValue = try Converter.convertFromScript(typeName: "", function: "", argument: nonnilArgument, index: 0, to: type(of: nonnilValue), registry: registry)
        XCTAssertEqual(convertedNonilValue, 1)
    }

    func testConvertibleType() throws {
        let registry = JXBridgeRegistry()
        let point = CGPoint(x: 1.0, y: 2.0)

        let scriptPoint = try Converter.convertToScript(typeName: "", function: "", value: point, registry: registry)
        XCTAssertFalse(scriptPoint is CGPoint)
        let nativePoint = try Converter.convertFromScript(typeName: "", function: "", argument: scriptPoint, index: 0, to: CGPoint.self, registry: registry)
        XCTAssertEqual(nativePoint, point)

        let intPoint = ["x": 1, "y": 2]
        let fromIntPoint = try Converter.convertFromScript(typeName: "", function: "", argument: intPoint, index: 0, to: CGPoint.self, registry: registry)
        XCTAssertEqual(fromIntPoint.x, 1.0)
        XCTAssertEqual(fromIntPoint.y, 2.0)
    }

    func testConvertibleTypeArray() throws {
        let registry = JXBridgeRegistry()
        let points = [CGPoint(x: 1.0, y: 2.0), CGPoint(x: 3.0, y: 4.0)]

        let scriptPoints = try Converter.convertToScript(typeName: "", function: "", value: points, registry: registry)
        XCTAssertFalse(scriptPoints is [CGPoint])
        XCTAssertTrue(scriptPoints is [Any])
        let nativePoints = try Converter.convertFromScript(typeName: "", function: "", argument: scriptPoints, index: 0, to: [CGPoint].self, registry: registry)
        XCTAssertEqual(nativePoints, points)
    }

    func testCodable() throws {
        let registry = JXBridgeRegistry()
        let codable = ConverterTestsCodable(a: 1, b: "b", c: 3.0)

        let scriptCodable = try Converter.convertToScript(typeName: "", function: "", value: codable, registry: registry)
        XCTAssertFalse(scriptCodable is ConverterTestsCodable)
        XCTAssertTrue(scriptCodable is [String: Any])
        let nativeCodable = try Converter.convertFromScript(typeName: "", function: "", argument: scriptCodable, index: 0, to: ConverterTestsCodable.self, registry: registry)
        XCTAssertEqual(nativeCodable.a, 1)
        XCTAssertEqual(nativeCodable.b, "b")
        XCTAssertEqual(nativeCodable.c, 3.0)
    }
}

private struct ConverterTestsCodable: Codable {
    var a = 0
    var b = ""
    var c = 0.0
}
