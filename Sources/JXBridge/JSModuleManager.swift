#if canImport(Foundation)
import Foundation
#endif
import JXKit

/// Manage JavaScript module loading and caching.
class JSModuleManager {
    private var context: JXContext?
    
    init(context: JXContext) {
        self.context = context
    }
    
#if canImport(Foundation)
    
    private let loader = JSLoader()
    private var moduleCache: [String: JSModule] = [:]
    private var evalStack: [(key: String, resource: String, root: URL)] = []
    
    func eval(resource: String, root: URL, this: JXValue?) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        let url = loader.scriptURL(resource: resource, root: root)
        guard let js = try loader.loadScript(from: url) else {
            throw JXError.resourceNotFound(resource)
        }
        // Add this resource to the stack so that it is recorded as a referrer of any modules it requires.
        // This resource is not a module, however, and so it doesn't have its own referrers, and changes to it will not propagate
        let key = key(for: url)
        evalStack.append((key, resource, root))
        defer { evalStack.removeLast() }
        return try context.eval(js, this: this)
    }
    
    func evalModule(resource: String, root: URL, cacheExports: Bool) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        
        let url = loader.scriptURL(resource: resource, root: root)
        let key = key(for: url)
        if cacheExports {
            if var module = moduleCache[key] {
                if let referencedBy = evalStack.last, module.referencedByKeys.insert(referencedBy.key).inserted {
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
            if let referencedBy = evalStack.last {
                module.referencedByKeys.insert(referencedBy.key)
            }
            moduleCache[key] = module
        }
        
        evalStack.append((key, resource, root))
        defer { evalStack.removeLast() }
        let moduleJS = Self.toModuleJS(js, key: key)
        return try context.eval(moduleJS)
    }
    
    private func key(for resource: URL) -> String {
        let url = resource.standardized
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
    
    func evalModule(_ js: String) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        let moduleJS = Self.toModuleJS(js)
        return try context.eval(moduleJS)
    }
    
    func require(_ resource: String) throws -> JXValue {
#if canImport(Foundation)
        guard let evalState = evalStack.last else {
            throw JXError(message: "You can only use 'require' in scripts loaded from resource URLs. You cannot use it when passing JavaScript code as a string")
        }
        return try evalModule(resource: resource, root: evalState.root, cacheExports: true)
#else
        throw JXError(message: "JavaScript resource loading is not available on platforms without Foundation support")
#endif
    }
    
    private static func toModuleJS(_ js: String, key: String? = nil) -> String {
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
        \(js)
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
