@testable import JXBridge
import JXKit
import XCTest

final class ModuleTests: XCTestCase {
    func testLazyModule() throws {
        let context = JXContext()
        try context.registry.register(LazyModule())

        let result = try context.eval("const obj = new lazy.TestStruct(); obj.intVar;")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testEagerModule() throws {
        let context = JXContext()
        try context.registry.register(EagerModule())

        let result = try context.eval("const obj = new eager.TestStruct(); obj.intVar;")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testModuleError() throws {
        var module = LazyModule()
        module.throwError = true
        let context = JXContext()
        do {
            try context.registry.register(module)
            XCTFail()
        } catch {
            XCTAssertTrue(context.registry.modulesByNamespace["lazy"]?.count == 0)
        }
        
        // Test that an error when adding a dependency removes the module adding the dependency too
        module.throwError = false
        var dependency = EagerModule()
        dependency.throwError = true
        module.addDependency = dependency
        do {
            try context.registry.register(module)
            XCTFail()
        } catch {
            XCTAssertTrue(context.registry.modulesByNamespace["eager"]?.count == 0)
            XCTAssertTrue(context.registry.modulesByNamespace["lazy"]?.count == 0)
        }
    }
    
    func testAnyJXBridgingModule() throws {
        let context = JXContext()
        try context.registry.register(AnyJXBridging(map: [
            "jx.TestStaticBridgingSubclass": TestStaticBridgingSubclass.self,
            "jx.TestBridgingSubclass": TestBridgingSubclass()
        ]))

        var result = try context.eval("var obj = new jx.TestStaticBridgingSubclass(); obj.stringVar + obj.intVar;")
        XCTAssertEqual(try result.string, "a1")
        
        result = try context.eval("var obj = new jx.TestBridgingSubclass(); obj.stringVar + obj.intVar;")
        XCTAssertEqual(try result.string, "b2")
    }
}

private struct TestStruct {
    var intVar = 1
}

private class TestStaticBridgingBaseClass: JXStaticBridging {
    var intVar = 1
    
    class func jxBridge() throws -> JXBridge {
        return JXBridgeBuilder(type: TestStaticBridgingBaseClass.self)
            .constructor { TestStaticBridgingBaseClass.init }
            .var.intVar { \.intVar }
            .bridge
    }
}

private class TestStaticBridgingSubclass: TestStaticBridgingBaseClass {
    var stringVar = "a"
    
    override class func jxBridge() throws -> JXBridge {
        return JXBridgeBuilder(type: TestStaticBridgingSubclass.self)
            .constructor { TestStaticBridgingSubclass.init }
            .var.stringVar { \.stringVar }
            .bridge
    }
}

private class TestBridgingBaseClass: JXBridging {
    var intVar = 2
    
    class func jxBridge(mirror: Mirror) throws -> JXBridge {
        return JXBridgeBuilder(type: TestBridgingBaseClass.self)
            .constructor { TestBridgingBaseClass.init }
            .var.intVar { \.intVar }
            .bridge
    }
    
#if !canImport(ObjectiveC)
    var jxState: JXState?
#endif
}

private class TestBridgingSubclass: TestBridgingBaseClass {
    var stringVar = "b"
    
    override class func jxBridge(mirror: Mirror) throws -> JXBridge {
        return JXBridgeBuilder(type: TestBridgingSubclass.self)
            .constructor { TestBridgingSubclass.init }
            .var.stringVar { \.stringVar }
            .bridge
    }
}

private struct LazyModule: JXModule {
    var throwError = false
    var addDependency: JXModule?
    var namespace = JXNamespace("lazy")
    
    func register(with registry: JXRegistry) throws {
        if throwError {
            throw JXBridgeErrors.internalError("LazyModule.initialize")
        }
        if let addDependency = self.addDependency {
            try registry.register(addDependency)
        }
    }
    
    func registerBridge(for typeName: String, namespace: JXNamespace, in registry: JXRegistry) throws -> Bool {
        guard typeName == "TestStruct" else {
            return false
        }
        try registry.register {
            JXBridgeBuilder(type: TestStruct.self, namespace: namespace)
                .constructor { TestStruct.init }
                .var.intVar { \.intVar }
                .bridge
        }
        return true
    }
    
    func registerBridge(for instance: Any, in registry: JXRegistry) throws -> Bool {
        return try registerBridge(for: String(describing: type(of: instance)), namespace: namespace, in: registry)
    }
}

private struct EagerModule: JXModule {
    var throwError = false
    let namespace = JXNamespace("eager")
    
    func register(with registry: JXRegistry) throws {
        if throwError {
            throw JXBridgeErrors.internalError("EagerModule.initialize")
        }
        try registry.register {
            JXBridgeBuilder(type: TestStruct.self, namespace: namespace)
                .constructor { TestStruct.init }
                .var.intVar { \.intVar }
                .bridge
        }
    }
}
