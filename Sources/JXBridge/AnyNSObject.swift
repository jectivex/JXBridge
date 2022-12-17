#if canImport(ObjectiveC)

import Foundation
import JXKit

/// Module that auto-registers any `NSObject` type.
public struct AnyNSObject: JXModule {    
    public let namespace: JXNamespace = .none
    
    public func define(symbol: String, namespace: JXNamespace, in context: JXContext) throws -> Bool {
        guard let cls = NSClassFromString(symbol), let nsobjectType = cls as? NSObject.Type else {
            return false
        }
        try context.registry.registerBridge(forObjectiveC: nsobjectType)
        return true
    }

    public func define(for instance: Any, in context: JXContext) throws -> Bool {
        guard let obj = instance as? NSObject else {
            return false
        }
        try context.registry.registerBridge(forObjectiveC: type(of: obj))
        return true
    }
}

#endif
