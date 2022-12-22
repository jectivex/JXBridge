#if canImport(Foundation)
import Foundation
#endif
import JXKit

/// Manage JavaScript script loading and caching.
final class ScriptManager {
    private weak var context: JXContext?
    
#if canImport(Foundation)
    init(context: JXContext, resourceLoader: ResourceLoader = FSEventResourceLoader()) {
        self.context = context
        self.resourceLoader = resourceLoader
        resourcesSubscription = self.resourceLoader.didChange.addListener(ResourceListener { [weak self] in
            self?.resourcesDidChange(urls: $0)
        })
    }
#else
    init(context: JXContext) {
        self.context = context
    }
#endif
    
    /// Invoked when scripts change.
    let didChange = ListenerCollection<ScriptListener>()
    
    /// Invoked when scripts are accessed.
    let didAccess = ListenerCollection<ScriptListener>()
    
    /// Evaluate the given script as a JavaScript module, returning its exports.
    ///
    /// - Parameters:
    ///   - namespace: If given, the module exports will be integrated into this namespace.
    func evalModule(_ script: String, for namespace: JXNamespace? = nil) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        let moduleScript = toModuleScript(script)
        let exports = try context.eval(moduleScript)
        if let namespace {
            try context.global[namespace].integrate(exports)
        }
        return exports
    }
    
#if canImport(Foundation)
    
    private let resourceLoader: ResourceLoader
    private var resourcesSubscription: JXCancellable?
    private var moduleCache: [String: Module] = [:]
    private var evalStack: [(key: String?, url: URL?, root: URL)] = []
    
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
    
    /// Evaluate the given resource as a JavaScript module, returning its exports.
    ///
    /// - Parameters:
    ///   - namespace: If given, the module exports will be integrated into this namespace.
    func evalModule(resource: String, for namespace: JXNamespace? = nil) throws -> JXValue {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        guard let evalState = evalStack.last else {
            throw JXError.unknownResourceRoot(for: resource)
        }
        let url = try resourceLoader.resourceURL(resource: resource, relativeTo: evalState.url, root: evalState.root)
        let key = key(for: url)
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
        
        guard let js = try resourceLoader.loadScript(from: url) else {
            throw JXError.resourceNotFound(resource)
        }
        
        // Create a module reference before evaluating to avoid infinite recursion in the case of circular dependencies.
        // Also see note above about setting references before evaluating in case there is an error
        var module = Module(key: key, type: .js(url, evalState.root))
        module.referencedBy(key: evalState.key)
        module.integratedInto(namespace: namespace)
        moduleCache[key] = module
        
        evalStack.append((key, url, evalState.root))
        defer { evalStack.removeLast() }
        let moduleScript = toModuleScript(js, key: key)
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
    
    // Visible for testing
    func resourcesDidChange(urls: Set<URL>) {
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
        case .js(let url, let root):
            do {
                print("Reloading JavaScript module at \(url.absoluteString)...")
                try reloadModule(module, url: url, root: root)
            } catch {
                print("JavaScript module reload error: \(error)")
            }
        case .jx:
            // Nothing to do. JS modules will integrate into the JX module namespace when they reload
            break
        }
    }
    
    private func reloadModule(_ module: Module, url: URL, root: URL) throws {
        guard let context else {
            throw JXError.contextDeallocated()
        }
        guard let js = try resourceLoader.loadScript(from: url) else {
            throw JXError.resourceNotFound(url.absoluteString)
        }
        evalStack.append((module.key, url, root))
        defer { evalStack.removeLast() }
        let moduleScript = toModuleScript(js, key: module.key)
        let exports = try context.eval(moduleScript)
        for namespace in module.integratedIntoNamespaces {
            try integrate(exports: exports, into: namespace)
        }
    }
    
    @discardableResult private func integrate(exports: JXValue, into namespace: JXNamespace?) throws -> Bool {
        guard let namespace else {
            return false
        }
        let namespaceValue = try exports.context.global[namespace]
        if try mergeExports(previous: namespaceValue, exports: exports).bool == false {
            try namespaceValue.integrate(exports)
        }
        return true
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
    
    private enum ModuleType {
        case js(URL, URL) // resource URL, root URL
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
    
    /// Logic for the function to merge previous exports - if any - with new exports.
    func mergeExports(previous: JXValue, exports: JXValue) throws -> JXValue {
        // TODO: Merge into previous exports by replacing prototypes so that state is preserved
        return exports.context.boolean(false)
    }
    
    /// Return the JavaScript to run to evaluate the given script as a module.
    private func toModuleScript(_ script: String, key: String? = nil) -> String {
        let prepareExports: String
        let updateExports: String
        if let key {
            let moduleExportsCacheKey = "\(JSCodeGenerator.moduleExportsCacheObject).\(key)"
            prepareExports = "const previousExports = \(moduleExportsCacheKey); \(moduleExportsCacheKey) = module.exports;"
            updateExports = "if (\(JSCodeGenerator.moduleExportsMergeFunction)(previousExports, module.exports)) { \(moduleExportsCacheKey) = previousExports; } else { \(moduleExportsCacheKey) = module.exports; }"
        } else {
            prepareExports = ""
            updateExports = ""
        }
        // Cache the empty exports before running the body to vend partial exports in cases of circular dependencies
        // Cache again after running the body in case it resets module.exports = x
        // Note that we use IIFEs to give private scopes and namespaces to the module code
        let js = """
(function() {
    const module = { exports: {} };
    const exports = module.exports;
    \(prepareExports)
    (function() {
        \(script)
    })()
    if (module.exports.import === undefined) {
        module.exports.import = function() { \(JSCodeGenerator.importFunction)(this); }
    }
    \(updateExports)
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
