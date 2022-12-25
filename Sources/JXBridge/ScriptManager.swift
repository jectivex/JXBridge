#if canImport(Foundation)
import Foundation
#endif
import JXKit

/// Manage JavaScript script loading and caching.
final class ScriptManager {
    private weak var context: JXContext?
    
    init(context: JXContext) {
        self.context = context
#if canImport(Foundation)
        resourcesSubscription = self.resourceLoader.didChange.addListener(ResourceListener { [weak self] in
            self?.resourcesDidChange(urls: $0)
        })
#endif
    }
    
    /// Invoked when scripts change.
    let didChange = ListenerCollection<ScriptListener>()
    
    /// Invoked when scripts are accessed.
    let didAccess = ListenerCollection<ScriptListener>()
    
#if canImport(Foundation)
    
    var resourceLoader: ResourceLoader = FSEventResourceLoader() { // Visible for testing
        didSet {
            resourcesSubscription = self.resourceLoader.didChange.addListener(ResourceListener { [weak self] in
                self?.resourcesDidChange(urls: $0)
            })
        }
    }
    private var resourcesSubscription: JXCancellable?
    private var moduleCache: [String: Module] = [:]
    private var evalStack: [(key: String?, url: URL?, root: URL)] = []
    private var scriptKeyGenerator = 0
    
    /// Perform a set of operations where any given resources use the given root URL.
    func withRoot(_ root: URL, perform: (ScriptManager) throws -> JXValue) throws -> JXValue {
        evalStack.append((nil, nil, root))
        defer { evalStack.removeLast() }
        return try perform(self)
    }
    
    /// Evaluate the given script as a JavaScript module, returning its exports.
    func eval(resource: String, this: JXValue?) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        guard let evalState = evalStack.last else {
            throw JXError.unknownResourceRoot(for: resource)
        }
        let url = try resourceLoader.resourceURL(resource: resource, relativeTo: evalState.url, root: evalState.root)
        guard let js = try resourceLoader.loadScript(from: url) else {
            throw JXError.resourceNotFound(resource)
        }
        // Add this resource to the stack so that it is recorded as a referrer of any modules it requires.
        // This resource is not a module, however, and so it doesn't have its own referrers, and changes to it will not propagate
        let key = key(for: url)
        didAccess.forEachListener { $0.handler([key]) }
        evalStack.append((key, url, evalState.root))
        defer { evalStack.removeLast() }
        return try context.eval(js, this: this)
    }
    
    /// Evaluate the given script as a JavaScript module, returning its exports.
    ///
    /// - Parameters:
    ///   - namespace: If given, the module exports will be integrated into this namespace.
    func evalModule(_ script: String, for namespace: JXNamespace? = nil) throws -> JXValue {
        // We only need to treat this as a full cached module if we have to integrate it into a namespace and
        // it might include other modules, which means we'll need to re-integrate if a dependency changes.
        // Otherwise we can treat it as transient
        if namespace != nil, let evalState = evalStack.last {
            return try evalModule(script, resource: nil, for: namespace, evalState: evalState)
        } else {
            return try evalTransientModule(script)
        }
    }
    
    /// Evaluate the given resource as a JavaScript module, returning its exports.
    ///
    /// - Parameters:
    ///   - namespace: If given, the module exports will be integrated into this namespace.
    func evalModule(resource: String, for namespace: JXNamespace? = nil) throws -> JXValue {
        guard let evalState = evalStack.last else {
            throw JXError.unknownResourceRoot(for: resource)
        }
        return try evalModule(nil, resource: resource, for: namespace, evalState: evalState)
    }
    
    private func evalModule(_ script: String?, resource: String?, for namespace: JXNamespace?, evalState: (key: String?, url: URL?, root: URL)) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        
        var module: Module
        let js: String
        let url: URL?
        let cacheKey: String?
        if let script {
            let key = "s\(scriptKeyGenerator)"
            scriptKeyGenerator += 1
            module = Module(key: key, type: .js(script, evalState.root))
            js = script
            url = nil
            cacheKey = nil
        } else if let resource {
            let resourceURL = try resourceLoader.resourceURL(resource: resource, relativeTo: evalState.url, root: evalState.root)
            let key = key(for: resourceURL)
            didAccess.forEachListener { $0.handler([key]) }
            
            // Already have cached exports?
            if var module = moduleCache[key] {
                // Setup references before eval in case there are errors: when the script updates
                // we want to be sure to update its references as well
                module.referencedBy(key: evalState.key)
                module.integratedInto(namespace: namespace)
                moduleCache[key] = module
                let exports = try module.exports(in: context)
                try integrate(exports: exports, into: namespace)
                return exports
            }
            
            guard let script = try resourceLoader.loadScript(from: resourceURL) else {
                throw JXError.resourceNotFound(resource)
            }
            module = Module(key: key, type: .jsResource(resourceURL, evalState.root))
            js = script
            url = resourceURL
            cacheKey = key
        } else {
            throw JXError.internalError("script == nil && resource == nil")
        }
        
        // Create a module reference before evaluating to avoid infinite recursion in the case of circular dependencies.
        // Also see note above about setting references before evaluating in case there is an error
        if let evalStateKey = evalState.key {
            module.referencedBy(key: evalStateKey)
        }
        if let namespace {
            module.integratedInto(namespace: namespace)
        }
        moduleCache[module.key] = module
        
        evalStack.append((module.key, url, evalState.root))
        defer { evalStack.removeLast() }
        let moduleScript = toModuleScript(js, cacheKey: cacheKey)
        let exports = try context.eval(moduleScript)
        try integrate(exports: exports, into: namespace)
        return exports
    }
    
    private func recordJXModuleReference(namespace: JXNamespace) {
        guard let referencedBy = evalStack.last?.key else {
            return
        }
        // Record which JS modules 'require' a JX namespace just as we record which JS modules
        // 'require' other JS modules. JX namespaces can change when any integrated scripts change
        var module = moduleCache[namespace.string] ?? Module(key: namespace.string, type: .jx(namespace))
        if module.referencedBy(key: referencedBy) {
            moduleCache[namespace.string] = module
        }
    }
    
    func integrate(exports: JXValue, into namespace: JXNamespace?) throws {
        guard let namespace else {
            return
        }
        let namespaceValue = try exports.context.global[namespace]
        try namespaceValue.integrate(exports)
    }
    
    private func key(for url: URL) -> String {
        if let key = resourceURLToKey[url] {
            return key
        }
        let key = "_jxr\(resourceId)"
        resourceId += 1
        resourceURLToKey[url] = key
        return key
    }
    
    private var resourceURLToKey: [URL: String] = [:]
    private var resourceId = 0
        
#else
    
    /// Evaluate the given script as a JavaScript module, returning its exports.
    ///
    /// - Parameters:
    ///   - namespace: If given, the module exports will be integrated into this namespace.
    func evalModule(_ script: String, for namespace: JXNamespace? = nil) throws -> JXValue {
        let exports = try evalTransientModule(script)
        if let namespace {
            try context.global[namespace].integrate(exports)
        }
        return exports
    }
    
#endif
    
    private func evalTransientModule(_ script: String) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        let moduleScript = toModuleScript(script)
        return try context.eval(moduleScript)
    }
    
    /// Logic for the `require` JavaScript module function.
    func require(_ value: JXValue) throws -> JXValue {
#if canImport(Foundation)
        guard !value.isString else {
            return try evalModule(resource: value.string)
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
    private func toModuleScript(_ script: String, cacheKey: String? = nil) -> String {
        let cacheExports: String
        if let cacheKey {
            cacheExports = "\(JSCodeGenerator.moduleExportsCacheObject).\(cacheKey) = module.exports;"
        } else {
            cacheExports = ""
        }
        // Cache the empty exports before running the body to vend partial exports in cases of circular dependencies
        // Cache again after running the body in case it resets module.exports = x
        // Note that we use IIFEs to give private scopes and namespaces to the module code
        let js = """
(function() {
    const module = { exports: {} };
    \(cacheExports)
    const exports = module.exports;
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

/// Listen for script IDs.
struct ScriptListener {
    let handler: (Set<String>) -> Void
}

#if canImport(Foundation)

extension ScriptManager {
    private func resourcesDidChange(urls: Set<URL>) {
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
                let newKeys = module.referencedByKeys.subtracting(seenKeys)
                processKeyQueue += newKeys
                seenKeys.formUnion(newKeys)
            }
        }
        reloadKeys.forEach { reloadModule(for: $0) }
        didChange.forEachListener { $0.handler(seenKeys) }
    }
    
    private func reloadModule(for key: String) {
        guard let module = moduleCache[key] else {
            return
        }
        switch module.type {
        case .js(let script, let root):
            do {
                print("Reloading JavaScript module script \(key)...")
                try reloadModule(module, script: script, url: nil, root: root)
            } catch {
                print("JavaScript module reload error: \(error)")
            }
        case .jsResource(let url, let root):
            do {
                print("Reloading JavaScript module at \(url.absoluteString)...")
                try reloadModule(module, script: nil, url: url, root: root)
            } catch {
                print("JavaScript module reload error: \(error)")
            }
        case .jx:
            // Nothing to do. JS modules will integrate into the JX module namespace when they reload
            break
        }
    }
    
    private func reloadModule(_ module: Module, script: String?, url: URL?, root: URL) throws {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        let js: String
        let cacheKey: String?
        if let script {
            js = script
            cacheKey = nil
        } else if let url {
            guard let script = try resourceLoader.loadScript(from: url) else {
                throw JXError.resourceNotFound(url.absoluteString)
            }
            js = script
            cacheKey = module.key
        } else {
            throw JXError.internalError("script == nil && url == nil")
        }
        evalStack.append((module.key, url, root))
        defer { evalStack.removeLast() }
        let moduleScript = toModuleScript(js, cacheKey: cacheKey)
        let exports = try context.eval(moduleScript)
        for namespace in module.integratedIntoNamespaces {
            try integrate(exports: exports, into: namespace)
        }
    }
}

private enum ModuleType {
    case js(String, URL) // script, root URL
    case jsResource(URL, URL) // resource URL, root URL
    case jx(JXNamespace)
}

private struct Module {
    let key: String
    let type: ModuleType
    private(set) var referencedByKeys = Set<String>()
    private(set) var integratedIntoNamespaces = Set<JXNamespace>()
    
    @discardableResult mutating func referencedBy(key: String?) -> Bool {
        guard let key else {
            return false
        }
        return referencedByKeys.insert(key).inserted
    }
    
    @discardableResult mutating func integratedInto(namespace: JXNamespace?) -> Bool {
        guard let namespace else {
            return false
        }
        return integratedIntoNamespaces.insert(namespace).inserted
    }
    
    func exports(in context: JXContext) throws -> JXValue {
        switch type {
        case .js, .jsResource:
            return try context.global[JSCodeGenerator.moduleExportsCacheObject][key]
        case .jx(let namespace):
            return try context.global[namespace]
        }
    }
}

#endif
