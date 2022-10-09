import Foundation

/// Behavior when using ObjectiveC types in scripts.
public enum ObjectiveCAutoBridging {
    /// ObjectiveC types must be explicitly added to the registry to use them.
    case none
    /// Auto-add NSObject types to the registry as needed using reflection.
    case all
}

/// Registry of bridged types.
public class JXBridgeRegistry {
    private var typeBridgesByGivenTypeName: [String: JXBridge] = [:]
    private var typeBridgesByActualTypeName: [String: JXBridge] = [:]
    private var requestedInvalidTypeNames: Set<String> = []

    public init(objectiveCAutoBridging: ObjectiveCAutoBridging = .none) {
        self.objectiveCAutoBridging = objectiveCAutoBridging
    }

    let objectiveCAutoBridging: ObjectiveCAutoBridging

    /// Add a type bridge.
    /// - Seealso `JXBridgeBuilder`
    public func add(_ bridge: JXBridge) {
        typeBridgesByGivenTypeName[bridge.typeName] = bridge
        typeBridgesByActualTypeName[String(describing: bridge.type)] = bridge
    }

#if canImport(ObjectiveC)

    /// Add a type bridge for the ObjectiveC properties and methods of the given type.
    /// - Seealso `JXBridgeBuilder.addObjectiveCPropertiesAndMethods`
    public func addObjectiveC<T: NSObject>(type: T.Type) {
        let builder = JXBridgeBuilder(type)
        builder.addObjectiveCPropertiesAndMethods()
        add(builder.bridge)
    }
    
#endif

    /// Whether a type bridge is available for the given type name. If `objectiveCAutoBridging` is enabled, this will always return `true` for a type name that maps to an ObjectiveC type.
    /// - Parameters:
    ///   - typeName: Corresponds to the desired `JXBridge.typeName`, which may not be the same as the class/struct name.
    public func hasJXBridge(for typeName: String) -> Bool {
        guard typeBridgesByGivenTypeName[typeName] == nil else {
            return true
        }
        return addAutoObjectiveCJXBridge(for: typeName) != nil
    }

    /// Return the type bridge for the given type name. If `objectiveCAutoBridging` is enabled, this will always return a type bridge for a type name that maps to an ObjectiveC type.
    /// - Parameters:
    ///   - typeName: Corresponds to the desired `JXBridge.typeName`, which may not be the same as the class/struct name.
    public func typeBridge(for typeName: String) throws -> JXBridge {
        if let typeBridge = typeBridgesByGivenTypeName[typeName] {
            return typeBridge
        }
        if let typeBridge = addAutoObjectiveCJXBridge(for: typeName) {
            return typeBridge
        }
        throw JXBridgeErrors.unknownType(typeName)
    }

    /// Whether a type bridge is available for the given type type. If `objectiveCAutoBridging` is enabled, this will always return `true` for an ObjectiveC type.
    public func hasJXBridge(for type: Any.Type) -> Bool {
        guard typeBridgesByActualTypeName[String(describing: type)] == nil else {
            return true
        }
        return addAutoObjectiveCJXBridge(for: type) != nil
    }

    /// Return the type bridge for the given type. If `objectiveCAutoBridging` is enabled, this will always return a type bridge for an ObjectiveC type.
    public func typeBridge(for type: Any.Type) throws -> JXBridge {
        let typeName = String(describing: type)
        if let typeBridge = typeBridgesByActualTypeName[typeName] {
            return typeBridge
        }
        if let typeBridge = addAutoObjectiveCJXBridge(for: type) {
            return typeBridge
        }
        throw JXBridgeErrors.unknownType(typeName)
    }

    private func addAutoObjectiveCJXBridge(for typeName: String) -> JXBridge? {
#if canImport(ObjectiveC)
        guard objectiveCAutoBridging == .all, !requestedInvalidTypeNames.contains(typeName) else {
            return nil
        }
        guard let type = NSClassFromString(typeName), type.isSubclass(of: NSObject.self) else {
            requestedInvalidTypeNames.insert(typeName)
            return nil
        }
        let bridge = JXBridge(objectiveCClass: type)
        add(bridge)
        return bridge
#else
        return nil
#endif
    }

    private func addAutoObjectiveCJXBridge(for type: Any.Type) -> JXBridge? {
#if canImport(ObjectiveC)
        guard objectiveCAutoBridging == .all else {
            return nil
        }
        guard let cls = type as? AnyClass, cls.isSubclass(of: NSObject.self) else {
            return nil
        }
        let bridge = JXBridge(objectiveCClass: cls)
        add(bridge)
        return bridge
#else
        return nil
#endif
    }
}
