import XCTest

#if DEBUG
@testable import JXBridge

class TypeNameTests: XCTestCase {
    func testTypeNames() {
        XCTAssertEqual(TypeName(for: Int.self), "Int")
        XCTAssertEqual(asJXTypeName("biz.baz.Booz"), "Booz")
        XCTAssertEqual(TypeName(for: Array<Int>.self), "ArrayOfInt")
        XCTAssertEqual(TypeName(for: Dictionary<Int, String>.self), "DictionaryOfIntAndString")
        XCTAssertEqual(TypeName(for: Array<Dictionary<Array<Int>, Array<String>>>.self), "ArrayOfDictionaryOfArrayOfIntAndArrayOfString")
    }
}
#endif
