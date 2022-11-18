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
}

private struct TestStruct {
    var intVar = 1
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
