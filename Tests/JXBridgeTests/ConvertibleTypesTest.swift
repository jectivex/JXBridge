import JXKit
import XCTest

#if DEBUG
@testable import JXBridge

final class ConvertibleTypesTests: XCTestCase {
    func testURL() throws {
        let context = JXContext()
        let url = URL(string: "http://www.javascript.org/spec")!
        try context.withValues(url) {
            let result = try context.eval("$0")
            XCTAssertEqual(try result.string, "http://www.javascript.org/spec")
            let resultURL = try result.convey(to: URL.self)
            XCTAssertEqual(resultURL, url)
        }
    }
}
#endif
