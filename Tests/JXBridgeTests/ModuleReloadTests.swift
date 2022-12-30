#if DEBUG // Needed for @testable import
import Foundation
@testable import JXBridge
import JXKit
import XCTest

let rootURL = URL(string: "file:///tmp")!

final class ModuleReloadTests: XCTestCase {
    private var context: JXContext!
    private var scriptLoader: TestScriptLoader!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.scriptLoader = TestScriptLoader()
        self.context = JXContext(configuration: .init(scriptLoader: self.scriptLoader))
    }
    
    func testModuleReloadFromScript() throws {
        try moduleReloadTest(fromResource: false)
    }
    
    func testModuleReloadFromResource() throws {
        try moduleReloadTest(fromResource: true)
    }
    
    private func moduleReloadTest(fromResource: Bool) throws {
        let url = try scriptLoader.scriptURL(resource: "test", relativeTo: nil, root: rootURL)
        scriptLoader.scripts["test"] = """
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
            scriptLoader.scripts["jxmodule"] = jxscript
            try context.registry.register(TestJXModule(fromResource: "jxmodule"))
        } else {
            try context.registry.register(TestJXModule(fromScript: jxscript))
        }
        
        let script = "jxtest.transform(2);"
        var result = try context.eval(script)
        XCTAssertEqual(try result.int, 6);
        
        scriptLoader.scripts["test"] = """
exports.add = function(x) {
    return x + 2;
}
"""
        scriptLoader.didChange?.forEach { $0([url]) }
        result = try context.eval(script)
        XCTAssertEqual(try result.int, 8);
    }
}

private class TestScriptLoader: JXScriptLoader {
    var scripts: [String: String] = [:]
    
    let didChange: JXListenerCollection<(Set<URL>) -> Void>? = JXListenerCollection<(Set<URL>) -> Void>()
    
    func scriptURL(resource: String, relativeTo: URL?, root: URL) throws -> URL {
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
