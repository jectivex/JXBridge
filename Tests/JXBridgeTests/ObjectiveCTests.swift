@testable import JXBridge
import JXKit
import XCTest

final class ObjectiveCTests: XCTestCase {
    // TODO: Flesh out tests
    func testFileManagerReflection() throws {
        let context = JXContext()
        try context.registry.register(AnyNSObject())
        let result = try context.eval("""
//const view = new jx.UIView();
//view.tag = 100;
//view.tag;
//const url = jx.NSURL.URLWithString("http://www.abc.com:8080");
//url.port;
const fm = jx.NSFileManager.defaultManager;
const tmpDir = fm.temporaryDirectory;
const files = fm.subpathsAtPath(tmpDir.path);
files.length;
""")
        try print("RESULT: \(result.int)")
    }
}
