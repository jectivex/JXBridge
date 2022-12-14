#if DEBUG // Needed for @testable import
@testable import JXBridge
import XCTest

class TypeNameTests: XCTestCase {
    func testTypeNames() {
        XCTAssertEqual(JXTypeName(for: Int.self), "Int")
        XCTAssertEqual(asJXTypeName("biz.baz.Booz"), "Booz")
        XCTAssertEqual(JXTypeName(for: Array<Int>.self), "ArrayOfInt")
        XCTAssertEqual(JXTypeName(for: Dictionary<Int, String>.self), "DictionaryOfIntAndString")
        XCTAssertEqual(JXTypeName(for: Array<Dictionary<Array<Int>, Array<String>>>.self), "ArrayOfDictionaryOfArrayOfIntAndArrayOfString")
    }
}
#endif
