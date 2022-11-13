#if canImport(ObjectiveC)

import Foundation

/// Module that auto-registers any `NSObject` type using ObjectiveC reflection.
public struct AnyNSObjectModule: JXModule {
    public var namespace = JXRegistry.defaultNamespace
    
    public func initialize(registry: JXRegistry) throws {
    }
    
    public func addBridge(for typeName: String, to registry: JXRegistry) throws -> Bool {
        guard let cls = NSClassFromString(typeName), let nsobjectType = cls as? NSObject.Type else {
            return false
        }
        // Still allow NSObjects to customize bridging
        if let bridgingType = cls as? JXBridging.Type {
            try registry.add(for: bridgingType, namespace: namespace)
        } else {
            try registry.add(forObjectiveCType: nsobjectType, namespace: namespace)
        }
        return true
    }

    public func addBridge(for instance: Any, to registry: JXRegistry) throws -> Bool {
        guard let obj = instance as? NSObject else {
            return false
        }
        // Still allow NSObjects to customize bridging
        if let bridgingType = type(of: instance) as? JXBridging.Type {
            try registry.add(for: bridgingType, namespace: namespace)
        } else {
            try registry.add(forObjectiveCType: type(of: obj), namespace: namespace)
        }
        return true
    }
    
    public func isEquivalent(to module: JXModule) -> Bool {
        return module is AnyNSObjectModule
    }
}

#endif
