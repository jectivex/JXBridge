import Combine
#if canImport(ObjectiveC)
import Foundation
#endif

/// Registry of bridged types.
public class JXRegistry {
    private var bridgesByGivenTypeName: [TypeNameKey: JXBridge] = [:]
    private var bridgesByActualTypeName: [String: JXBridge] = [:]
    private(set) var modulesByNamespace: [String: [JXModule]] = [:] // 0 or 1 module per known namespace
    private var universalModules: [JXModule] = []
    
    let didAddNamespaceSubject = PassthroughSubject<String, Never>()

    /// The default namespace to which bridged types are added in JavaScript: `jx`.
    public static let defaultNamespace = "jx"
    
    public init() {
        modulesByNamespace[Self.defaultNamespace] = []
    }
    
    /// Register a module for use in JavaScript. Has no effect if the module has a namespace and has already been registered.
    @discardableResult public func add(_ module: JXModule) throws -> Bool {
        guard !module.namespace.isEmpty else {
            try module.initialize(registry: self)
            universalModules.append(module)
            return true
        }
        
        let existingModules = modulesByNamespace[module.namespace]
        guard (existingModules?.count ?? 0) == 0 else {
            return false
        }
        modulesByNamespace[module.namespace] = [module] // Assign before initializing to avoid recursion on circular dependencies
        if existingModules == nil {
            didAddNamespaceSubject.send(module.namespace)
        }
        do {
            try module.initialize(registry: self)
        } catch {
            // Remove bad module
            modulesByNamespace[module.namespace] = []
            throw error
        }
        return true
    }

    /// Register a bridge for use in JavaScript.
    ///
    /// - Throws `JXBrigeErrors.namespaceViolation` if you attempt to register the same type under multiple namespaces.
    public func add(_ bridge: JXBridge) throws {
        let actualTypeName = String(reflecting: bridge.type)
        if let previousNamespace = bridgesByActualTypeName[actualTypeName]?.namespace, previousNamespace != bridge.namespace {
            throw JXBridgeErrors.namespaceViolation(actualTypeName, previousNamespace)
        }
            
        var preparedBridge = bridge
        preparedBridge.prepareLookupCaches()
        bridgesByGivenTypeName[TypeNameKey(typeName: preparedBridge.typeName, namespace: preparedBridge.namespace)] = preparedBridge
        bridgesByActualTypeName[actualTypeName] = preparedBridge
        
        if modulesByNamespace[preparedBridge.namespace] == nil {
            modulesByNamespace[preparedBridge.namespace] = []
            didAddNamespaceSubject.send(preparedBridge.namespace)
        }
    }

    /// Register a bridge generated by a `JXBridging` type for use in JavaScript.
    ///
    /// - Throws `JXBrigeErrors.namespaceViolation` if you attempt to register the same type under multiple namespaces.
    @discardableResult public func add<T: JXBridging>(for type: T.Type) throws -> JXBridge {
        let bridge = T.bridgeJX()
        try add(bridge)
        return bridge
    }

#if canImport(ObjectiveC)

    /// Register a bridge populated using ObjectiveC reflection for use in JavaScript.
    ///
    /// - Parameters:
    ///   - namespace: The namespace under which to add the type.
    /// - Throws `JXBrigeErrors.namespaceViolation` if you attempt to register the same type under multiple namespaces.
    @discardableResult public func add<T: NSObject>(forObjectiveCType type: T.Type, namespace: String = JXRegistry.defaultNamespace) throws -> JXBridge {
        let builder = JXBridgeBuilder(type: type, namespace: namespace)
        builder.addObjectiveCPropertiesAndMethods()
        try add(builder.bridge)
        return builder.bridge
    }

#endif

    /// Return the registered bridge for the given type name, or nil if none has been registered.
    /// 
    /// - Parameters:
    ///   - typeName: Corresponds to the desired `JXBridge.typeName`, which may not be the same as the class/struct name.
    ///   - namespace: The type's namespace, or nil to search the default namespace.
    public func bridge(for typeName: String, namespace: String? = nil) -> JXBridge? {
        do {
            return try bridge(for: typeName, namespace: namespace ?? Self.defaultNamespace, autobridging: false)
        } catch {
            // Call should not have been to throw when autobridging is false
            return nil
        }
    }

    func bridge(for typeName: String, namespace: String, autobridging: Bool) throws -> JXBridge? {
        let key = TypeNameKey(typeName: typeName, namespace: namespace)
        if let bridge = bridgesByGivenTypeName[key] {
            return bridge
        }
        if autobridging, let bridge = try addAutoBridge(for: typeName, namespace: namespace) {
            return bridge
        }
        return nil
    }

    func bridge(for instance: Any, autobridging: Bool) throws -> JXBridge? {
        let type = type(of: instance)
        return try bridge(for: type) ?? (autobridging ? addAutoBridge(for: instance) : nil)
    }

    /// Return the registered bridge for the given type, or nil if none has been registered.
    public func bridge(for type: Any.Type) -> JXBridge? {
        let actualTypeName = String(reflecting: type)
        return bridgesByActualTypeName[actualTypeName]
    }

    private func addAutoBridge(for typeName: String, namespace: String) throws -> JXBridge? {
        for module in (modulesByNamespace[namespace] ?? []) + universalModules {
            if try module.addBridge(for: typeName, namespace: namespace, to: self) {
                return try bridge(for: typeName, namespace: namespace, autobridging: false)
            }
        }
        return nil
    }
    
    private func addAutoBridge(for instance: Any) throws -> JXBridge? {
        for module in modulesByNamespace.values.flatMap({ $0 }) + universalModules {
            if try module.addBridge(for: instance, to: self) {
                return try bridge(for: instance, autobridging: false)
            }
        }
        return nil
    }
}

private struct TypeNameKey: Hashable {
    let typeName: String
    let namespace: String
}
