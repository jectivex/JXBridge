@testable import JXBridge
import JXKit
import XCTest

final class ModuleTests: XCTestCase {
    func testLazyModule() throws {
        let context = JXContext()
        try context.registry.add(LazyModule())

        let result = try context.eval("const obj = new lazy.TestStruct(); obj.intVar;")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testEagerModule() throws {
        let context = JXContext()
        try context.registry.add(EagerModule())

        let result = try context.eval("const obj = new eager.TestStruct(); obj.intVar;")
        XCTAssertEqual(try result.int, 1)
    }
    
    func testModuleError() throws {
        var module = LazyModule()
        module.throwError = true
        let context = JXContext()
        do {
            try context.registry.add(module)
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
            try context.registry.add(module)
            XCTFail()
        } catch {
            XCTAssertTrue(context.registry.modulesByNamespace["eager"]?.count == 0)
            XCTAssertTrue(context.registry.modulesByNamespace["lazy"]?.count == 0)
        }
    }
}

private struct TestStruct {
    var intVar = 1
}

private struct LazyModule: JXModule {
    var throwError = false
    var addDependency: JXModule?
    var namespace = "lazy"
    
    func initialize(registry: JXRegistry) throws {
        if throwError {
            throw JXBridgeErrors.internalError("LazyModule.initialize")
        }
        if let addDependency = self.addDependency {
            try registry.add(addDependency)
        }
    }
    
    func addBridge(for typeName: String, to registry: JXRegistry) throws -> Bool {
        guard typeName == "TestStruct" else {
            return false
        }
        let builder = JXBridgeBuilder(type: TestStruct.self, namespace: namespace)
            .constructor { TestStruct.init }
            .var.intVar { \.intVar }
        try registry.add(builder.bridge)
        return true
    }
    
    func addBridge(for instance: Any, to registry: JXRegistry) throws -> Bool {
        return try addBridge(for: String(describing: type(of: instance)), to: registry)
    }
    
    func isEquivalent(to module: JXModule) -> Bool {
        return module is LazyModule
    }
}

private struct EagerModule: JXModule {
    var throwError = false
    var namespace = "eager"
    
    func initialize(registry: JXRegistry) throws {
        if throwError {
            throw JXBridgeErrors.internalError("EagerModule.initialize")
        }
        let builder = JXBridgeBuilder(type: TestStruct.self, namespace: namespace)
            .constructor { TestStruct.init }
            .var.intVar { \.intVar }
        try registry.add(builder.bridge)
    }
    
    func addBridge(for typeName: String, to registry: JXRegistry) throws -> Bool {
        return false
    }
    
    func addBridge(for instance: Any, to registry: JXRegistry) throws -> Bool {
        return false
    }
    
    func isEquivalent(to module: JXModule) -> Bool {
        return module is EagerModule
    }
}
