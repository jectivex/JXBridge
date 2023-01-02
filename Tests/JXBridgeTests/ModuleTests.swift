#if DEBUG // Needed for @testable import
import Foundation
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
    
    func testModuleWithScriptString() throws {
        try moduleWithScriptTest(fromResource: false)
    }
    
    func testModuleWithScriptResource() throws {
        try moduleWithScriptTest(fromResource: false)
    }
    
    private func moduleWithScriptTest(fromResource: Bool) throws {
        let context = JXContext()
        try context.registry.register(ScriptModule(fromResource: fromResource))
        let result = try context.eval("const obj = new module.test.NameType(); obj.getClassName()")
        XCTAssertEqual(try result.string, "classprivatefoo")
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
        
        module = LazyModule()
        module.throwInitializeError = true
        let delayedRegistry = JXRegistry()
        try delayedRegistry.register(module)
        let delayedContext = JXContext()
        do {
            try delayedContext.setRegistry(delayedRegistry)
            XCTFail()
        } catch _ as JXError {
            // Expected
        }
    }
    
    func testAnyJXBridgingModule() throws {
        let context = JXContext()
        try context.registry.register(AnyJXBridging(map: [
            "jx.TestStaticBridgingSubclass": TestStaticBridgingSubclass.self,
            "jx.TestBridgingSubclass": TestBridgingSubclass()
        ]))

        var result = try context.evalClosure("const obj = new jx.TestStaticBridgingSubclass(); return obj.stringVar + obj.intVar;")
        XCTAssertEqual(try result.string, "a1")
        
        result = try context.evalClosure("const obj = new jx.TestBridgingSubclass(); return obj.stringVar + obj.intVar;")
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
            .superclass(TestStaticBridgingBaseClass.self)
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
            .superclass(TestBridgingBaseClass.self)
            .constructor { TestBridgingSubclass.init }
            .var.stringVar { \.stringVar }
            .bridge
    }
}

private struct LazyModule: JXModule {
    var throwError = false
    var throwInitializeError = false
    var addDependency: JXModule?
    var namespace = JXNamespace("lazy")
    
    func register(with registry: JXRegistry) throws {
        if throwError {
            throw ModuleError.some("LazyModule.register")
        }
        if let addDependency {
            try registry.register(addDependency)
        }
    }
    
    func initialize(in context: JXContext) throws {
        if throwInitializeError {
            throw ModuleError.some("LazyModule.initialize")
        }
    }
    
    func define(symbol: String, namespace: JXNamespace, in context: JXContext) throws -> Bool {
        guard symbol == "TestStruct" else {
            return false
        }
        try context.registry.register {
            JXBridgeBuilder(type: TestStruct.self, namespace: namespace)
                .constructor { TestStruct.init }
                .var.intVar { \.intVar }
                .bridge
        }
        return true
    }
    
    func define(for instance: Any, in context: JXContext) throws -> Bool {
        return try define(symbol: String(describing: type(of: instance)), namespace: namespace, in: context)
    }
}

private struct EagerModule: JXModule {
    var throwError = false
    let namespace = JXNamespace("eager")
    
    func register(with registry: JXRegistry) throws {
        if throwError {
            throw ModuleError.some("EagerModule.register")
        }
        try registry.register {
            JXBridgeBuilder(type: TestStruct.self, namespace: namespace)
                .constructor { TestStruct.init }
                .var.intVar { \.intVar }
                .bridge
        }
    }
}

private var module1JS = (try? String(contentsOf: Bundle.module.url(forResource: "jsmodules/module1", withExtension: "js")!)) ?? ""

private struct ScriptModule: JXModule {
    let fromResource: Bool
    let namespace = JXNamespace("module.test")
    
    func register(with registry: JXRegistry) throws {
        if fromResource {
            try registry.registerModuleScript(resource: "/jsmodules/module1", root: Bundle.module.resourceURL!, namespace: namespace)
        } else {
            try registry.registerModuleScript(module1JS, namespace: namespace)
        }
    }
}

private enum ModuleError: Error {
    case some(String)
}
#endif
