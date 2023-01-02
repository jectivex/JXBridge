#if DEBUG // Needed for @testable import
@testable import JXBridge
import JXKit
import XCTest

final class ConvertibleTypesTests: XCTestCase {
    func testURL() throws {
        let context = JXContext()
        let url = URL(string: "http://www.javascript.org/spec")!
        let result = try context.evalClosure("return $0", withArguments: [url])
        XCTAssertEqual(try result.string, "http://www.javascript.org/spec")
        let resultURL = try result.convey(to: URL.self)
        XCTAssertEqual(resultURL, url)
    }
    
    private enum ConvertibleError: String, Error {
        case some
    }
    
    func testConveyClosure() throws {
        let context = JXContext()
        
        var i = 0
        let c0 = { i += 1 }
        let v0 = try context.conveyClosure(c0)
        XCTAssertTrue(v0.isFunction)
        let r0 = try v0.call()
        XCTAssertTrue(r0.isUndefined)
        XCTAssertEqual(i, 1)
        
        let c0conveyed: () -> Void = try v0.convey()
        c0conveyed()
        XCTAssertEqual(i, 2)
        
        let c1: (Int) -> Int = { i in i + 1 }
        let v1 = try context.conveyClosure(c1)
        XCTAssertTrue(v1.isFunction)
        let r1 = try v1.call(withArguments: [2])
        XCTAssertEqual(try r1.int, 3)
        
        let c2: (Int) -> Result<Int, ConvertibleError> = { i in
            if i % 2 == 0 {
                return .success(i)
            } else {
                return .failure(.some)
            }
        }
        let v2 = try context.conveyClosure(c2)
        XCTAssertTrue(v2.isFunction)
        let r2 = try v2.call(withArguments: [2])
        let r2conveyed = try r2.convey(to: Result<Int, ConvertibleError>.self)
        XCTAssertEqual(try r2conveyed.get(), 2)
        let r3 = try v2.call(withArguments: [1])
        let r3conveyed = try r3.convey(to: Result<Int, ConvertibleError>.self)
        switch r3conveyed {
        case .success:
            XCTFail()
        case .failure(let error):
            XCTAssertEqual(error, .some)
        }
        
        let c2conveyed: (Int) -> Result<Int, ConvertibleError> = try v2.convey()
        let result = c2conveyed(4)
        XCTAssertEqual(try result.get(), 4)
    }
}
#endif
