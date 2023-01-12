#if canImport(ObjectiveC)
import Foundation
import JXKit

/// Module that auto-registers any `NSObject` type.
public struct AnyNSObject: JXModule {    
    public static let namespace: JXNamespace = .none

    private let namespace: JXNamespace

    /// Supply the namespace to use for ObjectiveC types.
    ///
    /// - Note: Using `.none` will prevent us from being able to intercept calls to previously-unseed ObjectiveC types. Only types that have been seen - e.g. returned from a native function - will be supported.
    public init(namespace: JXNamespace) {
        self.namespace = namespace
    }
    
    public func define(symbol: String, namespace: JXNamespace, in context: JXContext) throws -> Bool {
        guard namespace == self.namespace, let cls = NSClassFromString(symbol), let nsobjectType = cls as? NSObject.Type else {
            return false
        }
        try context.registry.registerBridge(forObjectiveC: nsobjectType, namespace: namespace)
        return true
    }

    public func define(for instance: Any, in context: JXContext) throws -> Bool {
        guard let obj = instance as? NSObject else {
            return false
        }
        try context.registry.registerBridge(forObjectiveC: type(of: obj), namespace: namespace)
        return true
    }
}
#endif
