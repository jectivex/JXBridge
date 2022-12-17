import JXKit

extension JXError {
    static func contextDeallocated() -> JXError {
        return JXError(message: "The JXContext has been deallocated")
    }
    
    static func instanceDeallocated() -> JXError {
        return JXError(message: "The instance has been deallocated")
    }
    
    static func missingBridge(for typeName: String, namespace: String) -> JXError {
        return JXError(message: "No JXBridge registered for type '\(namespace).\(typeName)'")
    }
    
    static func resourceNotFound(_ resource: String) -> JXError {
        return JXError(message: "Unable to locate resource '\(resource)'")
    }
    
    static func unknownResourceRelativeTo(for resource: String) -> JXError {
        return JXError(message: "Unable to locate resource '\(resource)'. This appears to be a relative path, but it was not referenced from another resource with a known path. Prefix with '/' to use an absolute path")
    }
    
    static func unknownResourceRoot(for resource: String) -> JXError {
        return JXError(message: "Unable to locate resource '\(resource)'. Unknown resource root. Are you attempting to use 'require' from an 'eval' call without specifying a root URL?")
    }
}
