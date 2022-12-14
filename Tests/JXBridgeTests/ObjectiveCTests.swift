#if DEBUG // Needed for @testable import
#if canImport(ObjectiveC)
import Foundation
@testable import JXBridge
import JXKit
import XCTest

final class ObjectiveCTests: XCTestCase {
    // TODO: Flesh out tests
    func testFileManagerReflection() throws {
        let context = JXContext()
        try context.registry.register(AnyNSObject())
        let result = try context.eval("""
const fm = jx.NSFileManager.defaultManager;
const tmpDir = fm.temporaryDirectory;
const files = fm.subpathsAtPath(tmpDir.path);
files.length;
""")
        XCTAssertGreaterThanOrEqual(try result.int, 0)
    }
}
#endif
#endif
