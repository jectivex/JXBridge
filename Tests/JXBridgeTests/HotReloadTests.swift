#if canImport(Foundation)

import JXKit
import XCTest

#if DEBUG
@testable import JXBridge

let rootURL = URL(string: "file:///tmp")!

final class HotReloadTests: XCTestCase {
    private var context: JXContext!
    private var spi: ContextSPI!
    private var resourceLoader: TestResourceLoader!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.context = JXContext()
        try self.context.prepareBridge()
        self.spi = self.context.spi as? ContextSPI
        self.resourceLoader = TestResourceLoader()
        self.spi.scriptManager.resourceLoader = self.resourceLoader
    }
    
    func testSimpleReload() throws {
        let url = try resourceLoader.resourceURL(resource: "test", relativeTo: nil, root: rootURL)
        resourceLoader.scripts["test"] = """
exports.add = function(x) {
    return x + 1;
}
"""
        let script = "var m = require('/test'); m.add(2);"
        var result = try context.eval(script, root: rootURL)
        XCTAssertEqual(try result.int, 3);
        
        resourceLoader.scripts["test"] = """
exports.add = function(x) {
    return x + 2;
}
"""
        resourceLoader.didChange.forEachListener { $0.handler([url]) }
        result = try context.eval(script, root: rootURL)
        XCTAssertEqual(try result.int, 4);
    }
    
    func testDependentModuleReload() throws {
        let url = try resourceLoader.resourceURL(resource: "test", relativeTo: nil, root: rootURL)
        resourceLoader.scripts["test"] = """
exports.add = function(x) {
    return x + 1;
}
"""
        resourceLoader.scripts["module"] = """
const m = require('/test')
exports.transform = function(x) {
    return m.add(x) * 2;
}
"""
        let script = "var m = require('/module'); m.transform(2);"
        var result = try context.eval(script, root: rootURL)
        XCTAssertEqual(try result.int, 6);
        
        resourceLoader.scripts["test"] = """
exports.add = function(x) {
    return x + 2;
}
"""
        resourceLoader.didChange.forEachListener { $0.handler([url]) }
        result = try context.eval(script, root: rootURL)
        XCTAssertEqual(try result.int, 8);
    }
    
    func testJXModuleReloadFromScript() throws {
        try jxModuleReloadTest(fromResource: false)
    }
    
    func testJXModuleReloadFromResource() throws {
        try jxModuleReloadTest(fromResource: true)
    }
    
    private func jxModuleReloadTest(fromResource: Bool) throws {
        let url = try resourceLoader.resourceURL(resource: "test", relativeTo: nil, root: rootURL)
        resourceLoader.scripts["test"] = """
exports.add = function(x) {
    return x + 1;
}
"""
        let jxscript = """
const m = require('/test');
exports.transform = function(x) {
    return m.add(x) * 2;
}
"""
        if fromResource {
            resourceLoader.scripts["jxmodule"] = jxscript
            try context.registry.register(TestJXModule(fromResource: "jxmodule"))
        } else {
            try context.registry.register(TestJXModule(fromScript: jxscript))
        }
        
        let script = "jxtest.transform(2);"
        var result = try context.eval(script)
        XCTAssertEqual(try result.int, 6);
        
        resourceLoader.scripts["test"] = """
exports.add = function(x) {
    return x + 2;
}
"""
        resourceLoader.didChange.forEachListener { $0.handler([url]) }
        result = try context.eval(script)
        XCTAssertEqual(try result.int, 8);
    }
}

private class TestResourceLoader: ResourceLoader {
    var scripts: [String: String] = [:]
    
    let didChange = ListenerCollection<ResourceListener>()
    
    func resourceURL(resource: String, relativeTo: URL?, root: URL) throws -> URL {
        return root.appendingPathComponent(resource, isDirectory: false)
    }
    
    func loadScript(from url: URL) throws -> String? {
        let path = url.lastPathComponent
        guard let script = scripts[path] else {
            throw JXError(message: "Unknown script \(path)")
        }
        return script
    }
}

private struct TestJXModule: JXModule {
    var fromResource: String?
    var fromScript: String?
    let namespace: JXNamespace = "jxtest"
    
    func register(with registry: JXRegistry) throws {
        if let fromResource {
            try registry.registerModuleScript(resource: fromResource, root: rootURL, namespace: namespace)
        } else if let fromScript {
            try registry.registerModuleScript(fromScript, root: rootURL, namespace: namespace)
        }
    }
}

#endif
#endif
