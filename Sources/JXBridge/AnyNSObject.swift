#if canImport(ObjectiveC)

import Foundation
import JXKit

/// Module that auto-registers any `NSObject` type.
public struct AnyNSObject: JXModule {    
    public let namespace: JXNamespace = .none
    
    public func registerBridge(for typeName: String, namespace: JXNamespace, in registry: JXRegistry) throws -> Bool {
        guard let cls = NSClassFromString(typeName), let nsobjectType = cls as? NSObject.Type else {
            return false
        }
        try registry.registerBridge(forObjectiveC: nsobjectType)
        return true
    }

    public func registerBridge(for instance: Any, in registry: JXRegistry) throws -> Bool {
        guard let obj = instance as? NSObject else {
            return false
        }
        try registry.registerBridge(forObjectiveC: type(of: obj))
        return true
    }
}

#endif
