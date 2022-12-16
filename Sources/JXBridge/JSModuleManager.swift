import JXKit

/// Manage JavaScript module loading and caching.
class JSModuleManager {
    private var context: JXContext?
    private let loader = JSLoader()
    private var moduleCache: [String: JSModule] = [:]
    private var evalKeyStack: [String] = []
    
    init(context: JXContext) {
        self.context = context
    }
    
    func eval(resource: String, this: JXValue?) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        guard let js = try loader.loadScript(resource: resource) else {
            throw JXError.resourceNotFound(resource)
        }
        // Add this resource to the stack so that it is recorded as a referrer of any modules it requires.
        // This resource is not a module, however, and so it doesn't have its own referrers, and changes to it will not propagate
        let key = Self.key(for: resource)
        evalKeyStack.append(key)
        defer { evalKeyStack.removeLast() }
        return try context.eval(js, this: this)
    }
    
    func evalModule(resource: String) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        let key = Self.key(for: resource)
        if var module = moduleCache[key] {
            if let referencedByKey = evalKeyStack.last, module.referencedByKeys.insert(referencedByKey).inserted {
                moduleCache[key] = module
            }
            return try module.exports(in: context)
        }
        guard let js = try loader.loadScript(resource: resource) else {
            throw JXError.resourceNotFound(resource)
        }
        
        // Create a module reference before evaluating to avoid infinite recursion in the case of circular dependencies
        var module = JSModule(resource: resource, key: key)
        if let referencedByKey = evalKeyStack.last {
            module.referencedByKeys.insert(referencedByKey)
        }
        moduleCache[resource] = module
        
        evalKeyStack.append(key)
        defer { evalKeyStack.removeLast() }
        let moduleJS = Self.toModuleJS(js, key: key)
        return try context.eval(moduleJS)
    }
    
    func evalModule(_ js: String) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        let moduleJS = Self.toModuleJS(js)
        return try context.eval(moduleJS)
    }
    
    private static func toModuleJS(_ js: String, key: String? = nil) -> String {
        let cacheExports: String
        if let key {
            cacheExports = "\(JSCodeGenerator.moduleExportsCacheObjectName).\(key) = module.exports;"
        } else {
            cacheExports = ""
        }
        // Cache the empty exports before running the body to vend partial exports in cases of circular dependencies
        // Cache again after running the body in case it resets module.exports = x
        // Note that we use IIFEs to give private scopes and namespaces to the module code
        return """
return (function() {
    const module = { exports: {} };
    const exports = module.exports;
    \(cacheExports)
    (function() {
        \(js)
    })()
    \(cacheExports)
    return module.exports;
})();
"""
    }
    
    private static func key(for resource: String) -> String {
        // Make sure the key is a valid JavaScript property name
        var key = resource
        if key.hasPrefix("./") {
            key = String(key.dropFirst(2))
        }
        return key.replacingOccurrences(of: "/", with: "$").replacingOccurrences(of: ".", with: "__")
    }
}

private struct JSModule {
    let resource: String
    let key: String
    var referencedByKeys = Set<String>()
    
    func exports(in context: JXContext) throws -> JXValue {
        return try context.global[JSCodeGenerator.moduleExportsCacheObjectName][key]
    }
}
