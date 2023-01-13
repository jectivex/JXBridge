#if DEBUG // Needed for @testable import
@testable import JXBridge
import XCTest

final class BridgingImplementationTests: XCTestCase {
    func testDefaultsBase() {
        var bridge = DefaultsBase.jxBridge()
        bridge.prepareLookupCaches()
        XCTAssertEqual(bridge.typeName, "DefaultsBase")
    }

    func testDefaultsSub() {
        var bridge = DefaultsSub.jxBridge()
        bridge.prepareLookupCaches()
        XCTAssertEqual(bridge.typeName, "DefaultsSub")
    }

    func testCustomizedBridgeBase() {
        var bridge = CustomizedBridgeBase.jxBridge()
        bridge.prepareLookupCaches()
        XCTAssertEqual(bridge.typeName, "CustomizedBridgeBase")
        XCTAssertTrue(bridge.hasProperty(for: "baseVar"))
    }

    func testCustomizedBridgeSub() {
        var bridge = CustomizedBridgeSub.jxBridge()
        bridge.prepareLookupCaches()
        XCTAssertEqual(bridge.typeName, "CustomizedBridgeSub")
        XCTAssertTrue(bridge.hasProperty(for: "subVar"))
    }

    func testCustomizedBuilderBase() {
        var bridge = CustomizedBuilderBase.jxBridge()
        bridge.prepareLookupCaches()
        XCTAssertEqual(bridge.typeName, "CustomizedBuilderBase")
        XCTAssertTrue(bridge.hasProperty(for: "baseVar"))
    }

    func testCustomizedBuilderSub() {
        var bridge = CustomizedBuilderSub.jxBridge()
        bridge.prepareLookupCaches()
        XCTAssertEqual(bridge.typeName, "CustomizedBuilderSub")
        XCTAssertTrue(bridge.hasProperty(for: "subVar"))
    }
}

class DefaultsBase: JXBridging {
}

class DefaultsSub: DefaultsBase {
}

class CustomizedBridgeBase: JXBridging {
    private var baseVar = 1

    class func jxBridge() -> JXBridge {
        return JXBridgeBuilder(type: self, bridge: jxDefaultBridge())
            .var.baseVar { \.baseVar }
            .bridge
    }
}

class CustomizedBridgeSub: CustomizedBridgeBase {
    private var subVar = 1

    override class func jxBridge() -> JXBridge {
        return JXBridgeBuilder(type: self, bridge: jxDefaultBridge())
            .var.subVar { \.subVar }
            .bridge
    }
}

class CustomizedBuilderBase: JXBridging {
    private var baseVar = 1

    // Required or else protocol extension jxDefaultBridge is used
    class func jxBridge() -> JXBridge {
        return jxDefaultBridge()
    }

    class func jxDefaultBridge() -> JXBridge {
        return JXBridgeBuilder(type: self)
            .var.baseVar { \.baseVar }
            .bridge
    }
}

class CustomizedBuilderSub: CustomizedBuilderBase {
    private var subVar = 1

    override class func jxDefaultBridge() -> JXBridge {
        return JXBridgeBuilder(type: self)
            .var.subVar { \.subVar }
            .bridge
    }
}
#endif
