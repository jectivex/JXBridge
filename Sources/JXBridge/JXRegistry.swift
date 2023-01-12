import struct Foundation.URL
import JXKit
#if canImport(ObjectiveC)
import ObjectiveC
#endif

/// Registry of bridged types.
public final class JXRegistry {
    private var bridgesByGivenTypeName: [TypeNameKey: JXBridge] = [:]
    private var bridgesByActualTypeName: [String: JXBridge] = [:]
    private(set) var modulesByNamespace: [JXNamespace: [JXModule]] = [:] // 0 or 1 module per known namespace. Internal for testing
    private var moduleScriptsByNamespace: [JXNamespace: [JXModuleScript]] = [:]
    private var unnamespacedModules: [JXModule] = []
    
    // Allow any context using this registry to listen for additions that require JS generation
    let didUpdate = JXListenerCollection<JXRegistryListener>()
    var namespaces: AnyCollection<JXNamespace> {
        return AnyCollection(modulesByNamespace.keys)
    }
    var modules: AnyCollection<JXModule> {
        return AnyCollection(modulesByNamespace.values.flatMap({ $0 }) + unnamespacedModules)
    }
    func bridges(in namespace: JXNamespace) -> AnyCollection<JXBridge> {
        return AnyCollection(bridgesByGivenTypeName.compactMap { $0.key.namespace == namespace ? $0.value : nil })
    }
    func moduleScripts(in namespace: JXNamespace) -> AnyCollection<JXModuleScript> {
        return AnyCollection(moduleScriptsByNamespace[namespace] ?? [])
    }

    public init() {
        modulesByNamespace[.jx] = []
    }
    
    /// Register a module for use in JavaScript. Has no effect if the module has a namespace and has already been registered.
    @discardableResult public func register(_ module: JXModule) throws -> Bool {
        let namespace = type(of: module).namespace
        guard namespace != .none else {
            try module.register(with: self)
            unnamespacedModules.append(module)
            try didUpdate.forEach { try $0.didRegisterModule(module) }
            return true
        }
        
        let existingModules = modulesByNamespace[namespace]
        guard (existingModules?.count ?? 0) == 0 else {
            return false
        }
        modulesByNamespace[namespace] = [module] // Assign before initializing to avoid recursion on circular dependencies
        if existingModules == nil {
            try didUpdate.forEach { try $0.didAddNamespace(namespace) }
        }
        do {
            try module.register(with: self)
        } catch {
            // Remove bad module
            modulesByNamespace[namespace] = []
            throw error
        }
        try didUpdate.forEach { try $0.didRegisterModule(module) }
        return true
    }
    
    /// Return the module registered under the given namespace, or nil if none has been registered. Modules registered under ``JXNamespace/none`` are not returned.
    public func module(for namespace: JXNamespace) -> JXModule? {
        return modulesByNamespace[namespace]?.first
    }

    /// Register a bridge for use in JavaScript.
    ///
    /// - Throws An error if you attempt to use an invalid namespace or register the same type under multiple namespaces.
    /// - Note: This method does **not** automatically register any superclass bridge.
    public func register(_ bridge: JXBridge) throws {
        let actualTypeName = String(reflecting: bridge.type)
        if let previousNamespace = bridgesByActualTypeName[actualTypeName]?.namespace, previousNamespace != bridge.namespace {
            throw JXError(message: "Attempt to register type '\(String(describing: bridge.type))' under second namespace '\(bridge.namespace)'. That type is already registered under namespace '\(previousNamespace)'")
        }
            
        var preparedBridge = bridge
        preparedBridge.prepareLookupCaches()
        bridgesByGivenTypeName[TypeNameKey(typeName: preparedBridge.typeName, namespace: preparedBridge.namespace)] = preparedBridge
        bridgesByActualTypeName[actualTypeName] = preparedBridge
        
        if preparedBridge.namespace == .none {
            try didUpdate.forEach { try $0.didRegisterUnnamespacedBridge(preparedBridge) }
        } else if modulesByNamespace[preparedBridge.namespace] == nil {
            modulesByNamespace[preparedBridge.namespace] = []
            try didUpdate.forEach { try $0.didAddNamespace(preparedBridge.namespace) }
        }
    }
    
    /// Register a bridge for use in JavaScript. Use this block-based method for trailing closure syntax:
    ///
    ///     registry.register {
    ///         JXBridgeBuilder(...)
    ///             .var.xxx { ... }
    ///             .bridge
    ///     }
    ///
    /// - Throws An error if you attempt to use an invalid namespace or register the same type under multiple namespaces.
    public func register(_ bridge: () -> JXBridge) throws {
        try register(bridge())
    }

    /// Register a bridge generated by a ``JXBridging`` type for use in JavaScript.
    ///
    /// - Parameters:
    ///   - namespace: Override the generated bridge's namespace. This only applies to any superclass bridge that may also be generated if that bridge has a .none namespace.
    /// - Throws An error if you attempt to use an invalid namespace or register the same type under multiple namespaces.
    /// - Note: This method automatically registers the superclass bridge if it also conforms to ``JXBridging``.
    @discardableResult public func registerBridge<T: JXBridging>(for type: T.Type, namespace: JXNamespace? = nil) throws -> JXBridge {
        return try registerBridge(for: type, namespace: namespace, overrideNamespace: true)
    }

    @discardableResult private func registerBridge<T: JXBridging>(for type: T.Type, namespace: JXNamespace?, overrideNamespace: Bool) throws -> JXBridge {
        var bridge = try type.jxBridge()
        if let bridgingSuperclass = bridge.superclass as? JXBridging.Type, self.bridge(for: bridgingSuperclass) == nil {
            try registerBridge(for: bridgingSuperclass, namespace: namespace, overrideNamespace: false)
        }
        if let namespace, overrideNamespace || bridge.namespace == .none {
            bridge.namespace = namespace
        }
        try register(bridge)
        return bridge
    }
    
#if canImport(ObjectiveC)
    /// - Seealso: ``JXBridgeBuilder/reflectObjectiveCMembers(prefixes:)``
    public var objectiveCMemberPrefixes: [String] = []

    /// Register a bridge populated using ObjectiveC reflection for use in JavaScript.
    ///
    /// - Parameters:
    ///   - namespace: The namespace under which to add the type.
    /// - Throws An error if you attempt to use an invalid namespace or register the same type under multiple namespaces.
    /// - Note: This method automatically registers any superclass bridge under the same namespace.
    @discardableResult public func registerBridge<T: NSObject>(forObjectiveC type: T.Type, namespace: JXNamespace? = nil) throws -> JXBridge {
        // Still allow customization
        if let bridgingType = type as? JXBridging.Type {
            return try registerBridge(for: bridgingType, namespace: namespace)
        }
        
        // For fully ObjectiveC types, use proxy bridging
        let builder = JXBridgeBuilder(type: type, namespace: namespace ?? .none)
        builder.reflectObjectiveCMembers(prefixes: objectiveCMemberPrefixes)
        let bridge = builder.bridge
        if let nsobjectSuperclassType = bridge.superclass as? NSObject.Type {
            try registerBridge(forObjectiveC: nsobjectSuperclassType, namespace: namespace)
        }
        try register(bridge)
        return builder.bridge
    }
#endif
    
    /// Register a JavaScript module resource to integrate into the given namespace. The JavaScript will be run and its exports will be added to the namespace.
    ///
    /// - Parameters:
    ///   - resource: The JavaScript file to load, in the form `/path/file.js` or `/path/file`. Note the leading `/` because the resource path is not being interpreted relative to another resource.
    ///   - root: The root of the JavaScript resources, typically `Bundle.module.resourceURL` for a Swift package. This is used to locate the resource and any scripts it references via `require`.
    public func registerModuleScript(resource: String, root: URL, namespace: JXNamespace) throws {
        try registerModuleScript(JXModuleScript(source: .resource(resource, root), namespace: namespace))
    }
    
    /// Register JavaScript module code to integrate into the given namespace. The JavaScript will be run and its exports will be added to the namespace.
    ///
    /// - Parameters:
    ///   - root: The root of the JavaScript resources, typically `Bundle.module.resourceURL` for a Swift package. This is used to locate any scripts referenced via `require`.
    public func registerModuleScript(_ script: String, root: URL, namespace: JXNamespace) throws {
        try registerModuleScript(JXModuleScript(source: .jsWithRoot(script, root), namespace: namespace))
    }

    /// Register JavaScript module code to integrate into the given namespace. The JavaScript will be run and its exports will be added to the namespace.
    public func registerModuleScript(_ script: String, namespace: JXNamespace) throws {
        try registerModuleScript(JXModuleScript(source: .js(script), namespace: namespace))
    }
    
    private func registerModuleScript(_ script: JXModuleScript) throws {
        if var existingScripts = moduleScriptsByNamespace[script.namespace] {
            existingScripts.append(script)
            moduleScriptsByNamespace[script.namespace] = existingScripts
            try didUpdate.forEach { try $0.didRegisterModuleScript(script) }
            return
        }
        
        if script.namespace != .none {
            if !modulesByNamespace.keys.contains(script.namespace) {
                modulesByNamespace[script.namespace] = []
                try didUpdate.forEach { try $0.didAddNamespace(script.namespace) }
            }
        }
        moduleScriptsByNamespace[script.namespace] = [script]
        try didUpdate.forEach { try $0.didRegisterModuleScript(script) }
    }

    /// Return the registered bridge for the given type name, or nil if none has been registered.
    /// 
    /// - Parameters:
    ///   - typeName: Corresponds to the desired `JXBridge.typeName`, which may not be the same as the class/struct name.
    ///   - namespace: The type's namespace.
    public func bridge(for typeName: String, namespace: JXNamespace) -> JXBridge? {
        do {
            return try bridge(for: typeName, namespace: namespace, definingIn: nil)
        } catch {
            // Call should not throw when autobridging is false
            return nil
        }
    }

    func bridge(for typeName: String, namespace: JXNamespace, definingIn context: JXContext?) throws -> JXBridge? {
        let key = TypeNameKey(typeName: typeName, namespace: namespace)
        if let bridge = bridgesByGivenTypeName[key] {
            return bridge
        }
        if let context, let bridge = try define(for: typeName, namespace: namespace, in: context) {
            return bridge
        }
        return nil
    }

    /// Return the registered bridge for the given type, or nil if none has been registered.
    public func bridge(for type: Any.Type) -> JXBridge? {
        let actualTypeName = String(reflecting: type)
        return bridgesByActualTypeName[actualTypeName]
    }
    
    /// Return the registered bridge for the type of the given instance, or nil if none has been registered.
    public func bridge(for instance: Any) -> JXBridge? {
        do {
            return try bridge(for: instance, definingIn: nil)
        } catch {
            // Call should not throw when autobridging is false
            return nil
        }
    }
    
    func bridge(for instance: Any, definingIn context: JXContext?) throws -> JXBridge? {
        let type = type(of: instance)
        if let bridge = bridge(for: type) {
            return bridge
        }
        guard let context else {
            return nil
        }
        return try define(for: instance, in: context)
    }

    private func define(for typeName: String, namespace: JXNamespace, in context: JXContext) throws -> JXBridge? {
        for module in (modulesByNamespace[namespace] ?? []) + unnamespacedModules {
            if try module.define(symbol: typeName, namespace: namespace, in: context) {
                return try bridge(for: typeName, namespace: namespace, definingIn: nil)
            }
        }
        return nil
    }
    
    private func define(for instance: Any, in context: JXContext) throws -> JXBridge? {
        for module in modulesByNamespace.values.flatMap({ $0 }) + unnamespacedModules {
            if try module.define(for: instance, in: context) {
                return try bridge(for: instance, definingIn: nil)
            }
        }
        return nil
    }
}

/// Listen for registry updates.
struct JXRegistryListener {
    var didAddNamespace: (JXNamespace) throws -> Void = { _ in }
    var didRegisterModule: (JXModule) throws -> Void = { _ in }
    var didRegisterModuleScript: (JXModuleScript) throws -> Void = { _ in }
    var didRegisterUnnamespacedBridge: (JXBridge) throws -> Void = { _ in }
}

private struct TypeNameKey: Hashable {
    let typeName: String
    let namespace: JXNamespace
}
