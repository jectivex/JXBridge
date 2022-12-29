import JXKit

extension JXError {    
    static func instanceDeallocated() -> JXError {
        return JXError(message: "The instance has been deallocated")
    }
    
    static func missingBridge(for typeName: String, namespace: String) -> JXError {
        return JXError(message: "No JXBridge registered for type '\(namespace).\(typeName)'")
    }
}
