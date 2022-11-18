#if canImport(ObjectiveC)

import Foundation
import JXKit

/// Module that auto-registers any `NSObject` type. If the type is not `JXBridging`, it must be in the default or none namespace.
public struct AnyNSObject: JXModule {
    public let namespace: JXNamespace = .none
    
    public func registerBridge(for typeName: String, namespace: JXNamespace, in registry: JXRegistry) throws -> Bool {
        guard let cls = NSClassFromString(typeName), let nsobjectType = cls as? NSObject.Type else {
            return false
        }
        // Still allow NSObjects to customize bridging
        if let bridgingType = cls as? JXStaticBridging.Type {
            try registry.registerBridge(for: bridgingType, namespace: namespace)
        } else if namespace == .default {
            try registry.registerBridge(forObjectiveC: nsobjectType)
        } else {
            return false
        }
        return true
    }

    public func registerBridge(for instance: Any, in registry: JXRegistry) throws -> Bool {
        guard let obj = instance as? NSObject else {
            return false
        }
        // Still allow NSObjects to customize bridging
        if let bridgingType = type(of: instance) as? JXStaticBridging.Type {
            try registry.registerBridge(for: bridgingType)
        } else {
            try registry.registerBridge(forObjectiveC: type(of: obj))
        }
        return true
    }
}

#endif
