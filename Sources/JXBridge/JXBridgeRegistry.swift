import Combine
#if canImport(ObjectiveC)
import Foundation
#endif

/// Registry of bridged types.
public class JXBridgeRegistry {
    private var bridgesByGivenTypeName: [QualifiedTypeName: JXBridge] = [:]
    private var bridgesByActualTypeName: [QualifiedTypeName: JXBridge] = [:]
    private var namespacesByActualTypeName: [String: String] = [:]
    private var requestedInvalidTypeNames: Set<String> = []
    
    private(set) var namespaces: Set<String> = []
    let didAddNamespaceSubject = PassthroughSubject<String, Never>()
    let didAddInstanceInfoSubject = PassthroughSubject<(JXBridge, String), Never>()

    /// The default namespace to which bridged types are added in JavaScript. Defaults to `jx`. Any type that is added without an explicit namespace uses this default.
    public var defaultNamespace = "jx"
    
    /// The set of auto-registration behaviors for this registry.
    ///
    /// - Note: Auto-registration only applies to type names in the default namespace.
    public var autoRegistration: [JXBridgeAutoRegistration] = []
    // We rely on context.registry being accessed to initialize our SPI. Defaulting to no auto-registration
    // ensures the developer must access the registry before attempting to use any bridged types
    
    public init() {
        namespaces.insert(defaultNamespace)
    }

    /// Add a type bridge.
    public func add(_ bridge: JXBridge, namespace: String? = nil) {
        var preparedBridge = bridge
        preparedBridge.prepareLookupCaches()
         
        let assignedNamespace = namespace ?? defaultNamespace
        bridgesByGivenTypeName[QualifiedTypeName(typeName: bridge.typeName, namespace: assignedNamespace)] = preparedBridge
        bridgesByActualTypeName[QualifiedTypeName(typeName: String(describing: bridge.type), namespace: assignedNamespace)] = preparedBridge
        namespacesByActualTypeName[String(describing: bridge.type)] = assignedNamespace
        
        let (inserted, _) = namespaces.insert(assignedNamespace)
        if inserted {
            didAddNamespaceSubject.send(assignedNamespace)
        }
        if bridge.includesInstanceInfo {
            didAddInstanceInfoSubject.send((bridge, assignedNamespace))
        }
    }

    /// Add a type bridge generated by a `JXBridging` type.
    public func add<T: JXBridging>(forBridgingType type: T.Type, namespace: String? = nil) {
        add(T.bridgeJX(), namespace: namespace)
    }

    /// Add a type bridge for a `JXBridging` instance, including property wrapper information.
    public func add<T: JXBridging>(for instance: T, namespace: String? = nil) {
        let bridge = T.bridgeJX()
        if bridge.includesInstanceInfo {
            add(bridge, namespace: namespace)
        } else {
            let builder = MirrorBuilder(Mirror(reflecting: instance), bridge: bridge)
            builder.addReflectedMembers()
            add(builder.bridge, namespace: namespace)
        }
    }

#if canImport(ObjectiveC)

    /// Add a type bridge for an ObjectiveC type using reflection.
    public func add<T: NSObject>(forObjectiveCType type: T.Type, namespace: String? = nil) {
        let builder = JXBridgeBuilder(type: type)
        builder.addObjectiveCPropertiesAndMethods()
        add(builder.bridge, namespace: namespace)
    }

#endif

    /// Return the registered type bridge for the given type name.
    /// 
    /// - Parameters:
    ///   - typeName: Corresponds to the desired `JXBridge.typeName`, which may not be the same as the class/struct name.
    public func bridge(for typeName: String, namespace: String? = nil) -> JXBridge? {
        return bridge(for: typeName, namespace: namespace ?? defaultNamespace, autobridging: false)
    }

    func bridge(for typeName: String, namespace: String, autobridging: Bool) -> JXBridge? {
        let key = QualifiedTypeName(typeName: typeName, namespace: namespace)
        if let bridge = bridgesByGivenTypeName[key] {
            return bridge
        }
        if autobridging && namespace == defaultNamespace, let bridge = addAutoBridge(for: typeName) {
            return bridge
        }
        return nil
    }

    /// Return the type bridge for the given instance's type.
    public func bridge(for instance: Any) -> JXBridge? {
        return bridge(for: instance, autobridging: false)
    }
    
    func bridge(for instance: Any, autobridging: Bool) -> JXBridge? {
        let type = type(of: instance)
        guard let bridge = bridge(for: type) ?? (autobridging ? addAutoBridge(for: instance) : nil) else {
            return nil
        }
        guard !bridge.includesInstanceInfo && instance is JXBridging else {
            return bridge
        }

        let builder = MirrorBuilder(Mirror(reflecting: instance), bridge: bridge)
        builder.addReflectedMembers()
        add(builder.bridge, namespace: namespacesByActualTypeName[String(describing: type)])
        return self.bridge(for: type)
    }

    /// Return the type bridge for the given type.
    public func bridge(for type: Any.Type) -> JXBridge? {
        let typeName = String(describing: type)
        guard let namespace = namespacesByActualTypeName[typeName] else {
            return nil
        }
        let key = QualifiedTypeName(typeName: typeName, namespace: namespace)
        return bridgesByActualTypeName[key]
    }

    private func addAutoBridge(for typeName: String) -> JXBridge? {
        for registration in autoRegistration {
            if registration.policy.addBridge(for: typeName, to: self) {
                return bridge(for: typeName, namespace: defaultNamespace, autobridging: false)
            }
        }
        return nil
    }
    
    private func addAutoBridge(for instance: Any) -> JXBridge? {
        for registration in autoRegistration {
            if registration.policy.addBridge(for: instance, to: self) {
                return bridge(for: type(of: instance))
            }
        }
        return nil
    }
}
