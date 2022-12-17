#if canImport(Foundation)
import Foundation
#endif
import JXKit

/// Manage JavaScript module loading and caching.
class JSModuleManager {
    private weak var context: JXContext?
    
    init(context: JXContext) {
        self.context = context
    }
    
#if canImport(Foundation)
    
    private let loader = ResourceLoader()
    private var moduleCache: [String: JSModule] = [:]
    private var evalStack: [(key: String?, url: URL?, root: URL)] = []
    
    func withRoot(_ root: URL, perform: (JSModuleManager) throws -> JXValue) throws -> JXValue {
        evalStack.append((nil, nil, root))
        defer { evalStack.removeLast() }
        return try perform(self)
    }
    
    func eval(resource: String, this: JXValue?) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        guard let evalState = evalStack.last else {
            throw JXError.unknownResourceRoot(for: resource)
        }
        let url = try loader.resourceURL(resource: resource, relativeTo: evalState.url, root: evalState.root)
        guard let js = try loader.loadScript(from: url) else {
            throw JXError.resourceNotFound(resource)
        }
        // Add this resource to the stack so that it is recorded as a referrer of any modules it requires.
        // This resource is not a module, however, and so it doesn't have its own referrers, and changes to it will not propagate
        let key = key(for: url)
        evalStack.append((key, url, evalState.root))
        defer { evalStack.removeLast() }
        return try context.eval(js, this: this)
    }
    
    func evalModule(resource: String, cacheExports: Bool) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        guard let evalState = evalStack.last else {
            throw JXError.unknownResourceRoot(for: resource)
        }
        let url = try loader.resourceURL(resource: resource, relativeTo: evalState.url, root: evalState.root)
        let key = key(for: url)
        if cacheExports {
            if var module = moduleCache[key] {
                if let referencedBy = evalState.key, module.referencedByKeys.insert(referencedBy).inserted {
                    moduleCache[key] = module
                }
                return try module.exports(in: context)
            }
        }
        
        guard let js = try loader.loadScript(from: url) else {
            throw JXError.resourceNotFound(resource)
        }
        
        if cacheExports {
            // Create a module reference before evaluating to avoid infinite recursion in the case of circular dependencies
            var module = JSModule(key: key, url: url)
            if let referencedBy = evalState.key {
                module.referencedByKeys.insert(referencedBy)
            }
            moduleCache[key] = module
        }
        
        evalStack.append((key, url, evalState.root))
        defer { evalStack.removeLast() }
        let moduleScript = toModuleScript(js, key: key)
        return try context.eval(moduleScript)
    }
    
    private func key(for url: URL) -> String {
        if let key = resourceURLToKey[url] {
            return key
        }
        let key = "r\(resourceId)"
        resourceId += 1
        resourceURLToKey[url] = key
        return key
    }
    
    private var resourceURLToKey: [URL: String] = [:]
    private var resourceId = 0
    
    private struct JSModule {
        let key: String
        let url: URL
        var referencedByKeys = Set<String>()
        
        func exports(in context: JXContext) throws -> JXValue {
            return try context.global[JSCodeGenerator.moduleExportsCacheObject][key]
        }
    }
    
#endif
    
    func require(_ resource: String) throws -> JXValue {
#if canImport(Foundation)
        return try evalModule(resource: resource, cacheExports: true)
#else
        throw JXError(message: "'require' is not available on platforms without Foundation support")
#endif
    }
    
    /// Return the JavaScript to run to evaluate the given script as a module.
    func toModuleScript(_ script: String, key: String? = nil) -> String {
        let cacheExports: String
        if let key {
            cacheExports = "\(JSCodeGenerator.moduleExportsCacheObject).\(key) = module.exports;"
        } else {
            cacheExports = ""
        }
        // Cache the empty exports before running the body to vend partial exports in cases of circular dependencies
        // Cache again after running the body in case it resets module.exports = x
        // Note that we use IIFEs to give private scopes and namespaces to the module code
        let js = """
(function() {
    const module = { exports: {} };
    const exports = module.exports;
    \(cacheExports)
    (function() {
        \(script)
    })()
    if (module.exports.import === undefined) {
        module.exports.import = function() { \(JSCodeGenerator.importFunction)(this); }
    }
    \(cacheExports)
    return module.exports;
})();
"""
        //print(js)
        return js
    }
}
