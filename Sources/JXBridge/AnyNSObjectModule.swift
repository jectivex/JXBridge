#if canImport(ObjectiveC)

import Foundation

/// Module that auto-registers any `NSObject` type. If the type is not `JXBridging`, it must be in the default namespace.
public struct AnyNSObjectModule: JXModule {
    public var namespace = ""
    
    public func initialize(registry: JXRegistry) throws {
    }
    
    public func addBridge(for typeName: String, namespace: String, to registry: JXRegistry) throws -> Bool {
        guard let cls = NSClassFromString(typeName), let nsobjectType = cls as? NSObject.Type else {
            return false
        }
        // Still allow NSObjects to customize bridging
        if let bridgingType = cls as? JXBridging.Type {
            try registry.add(for: bridgingType)
        } else if namespace == JXRegistry.defaultNamespace {
            try registry.add(forObjectiveCType: nsobjectType)
        } else {
            return false
        }
        return true
    }

    public func addBridge(for instance: Any, to registry: JXRegistry) throws -> Bool {
        guard let obj = instance as? NSObject else {
            return false
        }
        // Still allow NSObjects to customize bridging
        if let bridgingType = type(of: instance) as? JXBridging.Type {
            try registry.add(for: bridgingType)
        } else {
            try registry.add(forObjectiveCType: type(of: obj))
        }
        return true
    }
}

#endif
