#if canImport(Foundation)
import Foundation
#endif

/// Policies for bridging types to JavaScript without explicitly adding each type bridge to the `JXBridgeRegistry`. Some policies like `.objc` and `.mapped` focus on bridging type names used in JavaScript to their Swift types. Others like `.related` and `.reachable` focus on adding related types when a native type is registered.
public struct JXBridgeAutoRegistration {
    /// When a type is added to the registry, attempt to auto-register its superclass, property types, function return types, and function param types.
    /// - Note: In order to auto-register a related type, it must be an ObjectiveC type or conform to `JXBridging`.
    public static let related = JXBridgeAutoRegistration(policy: RelatedTypesAutoRegistrationPolicy(processReachable: false))
    
    /// This policy is similar to `.related`, but it is recursive such that the entire reachable graph of types is added to the registry.
    /// - Seealso: `related`
    static let reachable = JXBridgeAutoRegistration(policy: RelatedTypesAutoRegistrationPolicy(processReachable: true))
    
#if canImport(ObjectiveC)
    /// Use reflection to auto-bridge any ObjectiveC class name used in JavaScript.
    static let objc = JXBridgeAutoRegistration(policy: ObjectiveCAutoRegistrationPolicy())
#endif

    /// Provide a mapping of JavaScript type names to ObjectiveC or  `JXBridging` types, or `JXBridging` template instances.
    static func mapped(_ map: [String: Any]) -> JXBridgeAutoRegistration {
        return JXBridgeAutoRegistration(policy: MappedTypeNameAutoRegistrationPolicy(map: map))
    }

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
    func addBridge(for typeName: String, to registry: JXBridgeRegistry) -> Bool
    
    /// Add a bridge for the given type, or return `false`.
    func addBridge(for type: Any.Type, to registry: JXBridgeRegistry) -> Bool
    
    /// Callback when a bridge is added to the registry. Use this to add related types if desired.
    func didAdd(bridge: JXBridge, to registry: JXBridgeRegistry)
}

extension JXBridgeAutoRegistrationPolicy {
    /// Helper to add a bridge for a given `ObjectiveC` type, `JXBridging` type, or `JXBridging` template instance.
    @discardableResult public func addBridge(forInstanceOrType value: Any, to registry: JXBridgeRegistry) -> Bool {
        if let instance = value as? JXBridging {
            registry.add(for: instance)
            return true
        }
        if let bridgingType = value as? JXBridging.Type {
            registry.add(forBridgingType: bridgingType)
            return true
        }
#if canImport(ObjectiveC)
        if let nsobjectType = value as? NSObject.Type {
            registry.add(forObjectiveCType: nsobjectType)
            return true
        }
#endif
        return false
    }
}

class RelatedTypesAutoRegistrationPolicy: JXBridgeAutoRegistrationPolicy {
    private let processReachable: Bool
    private var recursionDepth = 0

    init(processReachable: Bool) {
        self.processReachable = processReachable
    }

    func addBridge(for typeName: String, to registry: JXBridgeRegistry) -> Bool {
        return false
    }

    func addBridge(for type: Any.Type, to registry: JXBridgeRegistry) -> Bool {
        return addBridge(forInstanceOrType: type, to: registry)
    }

    func didAdd(bridge: JXBridge, to registry: JXBridgeRegistry) {
        guard processReachable || recursionDepth == 0 else {
            return
        }
        recursionDepth += 1
        for type in bridge.relatedTypes {
            if !registry.hasBridge(for: type) {
                addBridge(forInstanceOrType: type, to: registry)
            }
        }
        recursionDepth -= 1
    }
}

struct MappedTypeNameAutoRegistrationPolicy: JXBridgeAutoRegistrationPolicy {
    let map: [String: Any]

    func addBridge(for typeName: String, to registry: JXBridgeRegistry) -> Bool {
        guard let result = map[typeName] else {
            return false
        }
        return addBridge(forInstanceOrType: result, to: registry)
    }

    func addBridge(for type: Any.Type, to registry: JXBridgeRegistry) -> Bool {
        return false
    }

    func didAdd(bridge: JXBridge, to registry: JXBridgeRegistry) {
    }
}

#if canImport(ObjectiveC)

struct ObjectiveCAutoRegistrationPolicy: JXBridgeAutoRegistrationPolicy {
    func addBridge(for typeName: String, to registry: JXBridgeRegistry) -> Bool {
        guard let cls = NSClassFromString(typeName), let nsobjectType = cls as? NSObject.Type else {
            return false
        }
        registry.add(forObjectiveCType: nsobjectType)
        return true
    }

    func addBridge(for type: Any.Type, to registry: JXBridgeRegistry) -> Bool {
        guard let nsobjectType = type as? NSObject.Type else {
            return false
        }
        registry.add(forObjectiveCType: nsobjectType)
        return true
    }

    func didAdd(bridge: JXBridge, to registry: JXBridgeRegistry) {
    }
}

#endif
