#if canImport(Foundation)
import Foundation
#endif

/// Policies for bridging types to JavaScript without explicitly adding each full type bridge to the `JXBridgeRegistry`.
public struct JXBridgeAutoRegistration {
#if canImport(ObjectiveC)
    /// Use reflection to auto-bridge any ObjectiveC class name used in JavaScript, or any ObjectiveC object returned from a bridged property or function.
    static let objc = JXBridgeAutoRegistration(policy: ObjectiveCAutoRegistrationPolicy())
#endif
    
    /// Conveyed or returned instances that conform to `JXBridging` or are ObjectiveC types are automatically bridged.
    static let instance = JXBridgeAutoRegistration(policy: InstanceAutoRegistrationPolicy())

    /// Add your own auto-bridging policy.
    static func custom(_ policy: JXBridgeAutoRegistrationPolicy) -> JXBridgeAutoRegistration {
        return JXBridgeAutoRegistration(policy: policy)
    }

    public let policy: JXBridgeAutoRegistrationPolicy

    init(policy: JXBridgeAutoRegistrationPolicy) {
        self.policy = policy
    }
}

/// A policty controlling the auto-addition of bridges to the `JXBridgeRegistry`.
public protocol JXBridgeAutoRegistrationPolicy {
    /// Add a bridge for the given type name used in JavaScript, or return `false`.
    func addBridge(for typeName: String, to registry: JXBridgeRegistry) throws -> Bool
    
    /// Add a bridge for the given conveyed or returned instance, or return `false`.
    func addBridge(for instance: Any, to registry: JXBridgeRegistry) throws -> Bool
}

#if canImport(ObjectiveC)

struct ObjectiveCAutoRegistrationPolicy: JXBridgeAutoRegistrationPolicy {
    func addBridge(for typeName: String, to registry: JXBridgeRegistry) throws -> Bool {
        guard let cls = NSClassFromString(typeName), let nsobjectType = cls as? NSObject.Type else {
            return false
        }
        if let bridgingType = cls as? JXBridging.Type {
            try registry.add(for: bridgingType)
        } else {
            try registry.add(forObjectiveCType: nsobjectType)
        }
        return true
    }

    func addBridge(for instance: Any, to registry: JXBridgeRegistry) throws -> Bool {
        guard let obj = instance as? NSObject else {
            return false
        }
        if let bridgingType = type(of: instance) as? JXBridging.Type {
            try registry.add(for: bridgingType)
        } else {
            try registry.add(forObjectiveCType: type(of: obj))
        }
        return true
    }
}

#endif

struct InstanceAutoRegistrationPolicy: JXBridgeAutoRegistrationPolicy {
    func addBridge(for typeName: String, to registry: JXBridgeRegistry) -> Bool {
        return false
    }

    func addBridge(for instance: Any, to registry: JXBridgeRegistry) throws -> Bool {
        if let bridgingType = type(of: instance) as? JXBridging.Type {
            try registry.add(for: bridgingType)
        } else if let obj = instance as? NSObject {
            try registry.add(forObjectiveCType: type(of: obj))
        }
        return true
    }
}
