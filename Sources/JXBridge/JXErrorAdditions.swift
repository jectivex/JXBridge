import JXKit

extension JXError {    
    static func missingBridge(for typeName: String, namespace: String) -> JXError {
        return JXError(message: "No JXBridge registered for type '\(namespace).\(typeName)'")
    }
    
    static func contextDeallocated() -> JXError {
        return JXError(message: "The JXContext has been deallocated")
    }
    
    static func instanceDeallocated() -> JXError {
        return JXError(message: "The instance has been deallocated")
    }
}
