#if canImport(Foundation)
import Foundation
#endif
import JXKit

/// Manage JavaScript module loading and caching.
final class JSModuleManager {
    private weak var context: JXContext?
    
    init(context: JXContext) {
        self.context = context
    }
    
#if canImport(Foundation)
    
    private let loader = ResourceLoader()
    private var moduleCache: [String: Module] = [:]
    private var evalStack: [(key: String?, url: URL?, root: URL)] = []
    
    /// Perform a set of operations where any given resources use the given root URL.
    ///
    /// - Parameters:
    ///   - namespace: If given, the opeations are being performed by the ``JXModule`` using the given namespace.
    func withRoot(_ root: URL, namespace: JXNamespace? = nil, perform: (JSModuleManager) throws -> JXValue) throws -> JXValue {
        evalStack.append((namespace?.string, nil, root))
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
            var module = Module(key: key, type: .js(url))
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
    
    private func recordJXModuleReference(namespace: JXNamespace) {
        guard let referencedBy = evalStack.last?.key else {
            return
        }
        var module = moduleCache[namespace.string] ?? Module(key: namespace.string, type: .jx(namespace))
        if module.referencedByKeys.insert(referencedBy).inserted {
            moduleCache[namespace.string] = module
        }
    }
    
    private func resourcesDidUpdate(at urls: Set<URL>) {
        // When a module changes, we have to reload that module and also all the modules that reference it,
        // as their exports could also be affected. And so on recursively. Perform a breadth-first traversal
        // of the reference graph to create an ordered list of modules to reload
        let keys = urls.map { key(for: $0) }
        var processKeyQueue = keys
        var seenKeys = Set(keys)
        var reloadKeys: [String] = []
        while !processKeyQueue.isEmpty {
            let key = processKeyQueue.removeFirst()
            reloadKeys.append(key)
            if let module = moduleCache[key] {
                processKeyQueue += module.referencedByKeys.subtracting(seenKeys)
                seenKeys.formUnion(module.referencedByKeys)
            }
        }
        reloadKeys.forEach { reloadModule(for: $0) }
        //~~~ tell listeners that all seenKeys updated
    }
    
    private func reloadModule(for key: String) {
        guard let module = moduleCache[key] else {
            return
        }
        switch module.type {
        case .js(let url):
            break //~~~
        case .jx(let namespace):
            break //~~~
        }
    }
    
    private func key(for url: URL) -> String {
        if let key = resourceURLToKey[url] {
            return key
        }
        let key = "_jxr\(resourceId)"
        resourceId += 1
        resourceURLToKey[url] = key
        resourceURLToKey[url] = key
        return key
    }
    
    private var resourceURLToKey: [URL: String] = [:]
    private var resourceId = 0
    
    private enum ModuleType {
        case js(URL)
        case jx(JXNamespace)
    }
    
    private struct Module {
        let key: String
        let type: ModuleType
        var referencedByKeys = Set<String>()
        
        func exports(in context: JXContext) throws -> JXValue {
            switch type {
            case .js:
                return try context.global[JSCodeGenerator.moduleExportsCacheObject][key]
            case .jx(let namespace):
                return try context.global[namespace]
            }
        }
    }
    
#endif
    
    /// Logic for the `require` JavaScript module function.
    func require(_ value: JXValue) throws -> JXValue {
#if canImport(Foundation)
        guard !value.isString else {
            return try evalModule(resource: value.string, cacheExports: true)
        }
        let moduleNameValue = try value[JSCodeGenerator.namespaceProperty]
        guard moduleNameValue.isString else {
            throw JXError(message: "'require' expects a file path string or a JXModule namespace object, e.g. require('/module.js') or require(jxswiftui)")
        }
        try recordJXModuleReference(namespace: JXNamespace(moduleNameValue.string))
        return value
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
