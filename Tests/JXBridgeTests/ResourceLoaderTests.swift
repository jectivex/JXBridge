import JXKit
import XCTest

#if DEBUG
@testable import JXBridge

final class ResourceLoaderTests: XCTestCase {
    func testURLStandardization() throws {
        let loader = FSEventResourceLoader()
        let rootURL = URL(string: "file:///tmp/test")!
        let url1 = try loader.resourceURL(resource: "/dir/r1", relativeTo: nil, root: rootURL)
        let url2 = try loader.resourceURL(resource: "./r1", relativeTo: url1, root: rootURL)
        XCTAssertEqual(url1, url2)
        let url3 = try loader.resourceURL(resource: "../dir/r1", relativeTo: url1, root: rootURL)
        XCTAssertEqual(url1, url3)
    }
}

#endif
