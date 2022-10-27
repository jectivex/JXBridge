import Foundation

/// Registry of bridged types.
public class JXBridgeRegistry {
    /// Auto-bridging behavior.
    public struct AutoBridging: OptionSet {
        /// Auto-add NSObject types to the registry as needed using reflection.
        public static let objc = AutoBridging(rawValue: 1 << 0)

        public let rawValue: UInt8

        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }

    private var bridgesByGivenTypeName: [String: JXBridge] = [:]
    private var bridgesByActualTypeName: [String: JXBridge] = [:]
    private var requestedInvalidTypeNames: Set<String> = []

    /// Auto-bridging behavior.
    var autoBridging: AutoBridging = []

    /// Add a type bridge.
    /// - Seealso `JXBridgeBuilder`
    public func add(_ bridge: JXBridge) {
        var preparedBridge = bridge
        preparedBridge.prepareLookupCaches()
        bridgesByGivenTypeName[bridge.typeName] = preparedBridge
        bridgesByActualTypeName[String(describing: bridge.type)] = preparedBridge
    }

    /// Whether a type bridge is available for the given type name. If auto bridging is enabled, this will always return `true` for a type name that maps to an ObjectiveC type.
    ///
    /// - Parameters:
    ///   - typeName: Corresponds to the desired `JXBridge.typeName`, which may not be the same as the class/struct name.
    public func hasBridge(for typeName: String) -> Bool {
        guard bridgesByGivenTypeName[typeName] == nil else {
            return true
        }
        return addAutoBridge(for: typeName) != nil
    }

    /// Return the type bridge for the given type name. If auto bridging is enabled, this will always return a type bridge for a type name that maps to an ObjectiveC type.
    /// 
    /// - Parameters:
    ///   - typeName: Corresponds to the desired `JXBridge.typeName`, which may not be the same as the class/struct name.
    public func bridge(for typeName: String) throws -> JXBridge {
        if let bridge = bridgesByGivenTypeName[typeName] {
            return bridge
        }
        if let bridge = addAutoBridge(for: typeName) {
            return bridge
        }
        throw JXBridgeErrors.unknownType(typeName)
    }

    /// Whether a type bridge is available for the given type type. If auto bridging is enabled, this will always return `true` for an ObjectiveC type.
    public func hasBridge(for type: Any.Type) -> Bool {
        guard bridgesByActualTypeName[String(describing: type)] == nil else {
            return true
        }
        return addAutoBridge(for: type) != nil
    }

    /// Return the type bridge for the given type. If auto bridge is enabled, this will always return a type bridge for an ObjectiveC type.
    public func bridge(for type: Any.Type) throws -> JXBridge {
        let typeName = String(describing: type)
        if let bridge = bridgesByActualTypeName[typeName] {
            return bridge
        }
        if let bridge = addAutoBridge(for: type) {
            return bridge
        }
        throw JXBridgeErrors.unknownType(typeName)
    }

    private func addAutoBridge(for typeName: String) -> JXBridge? {
#if canImport(ObjectiveC)
        guard autoBridging.contains(.objc), !requestedInvalidTypeNames.contains(typeName) else {
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

    private func addAutoBridge(for type: Any.Type) -> JXBridge? {
#if canImport(ObjectiveC)
        guard autoBridging.contains(.objc) else {
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
