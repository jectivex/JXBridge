@testable import JXBridge
import JXKit
import XCTest

final class ObjectiveCTests: XCTestCase {
    //~~~
    func testFileManagerReflection() throws {
        let context = JXContext()
        try context.registry.register(AnyNSObject())
        let result = try context.eval("""
const fm = jx.NSFileManager.defaultManager;
const tmpDir = fm.temporaryDirectory;
tmpDir.description;
""")
        try print("RESULT: \(result.string)")
    }
}
