import JXKit

extension JXValue {
    /// Bind the bridged instance properties and functions of the given object to this value.
    ///
    /// - Warning: The given object is not retained.
    public func integrate(_ instance: Any) throws {
        //~~~
    }
    
    /// Whether a property exists matching the value of the given namespace.
    public func hasNamespace(_ namespace: JXNamespace) -> Bool {
        return hasProperty(namespace.value)
    }
    
    /// The property value representing the given namespace.
    public subscript(namespace: JXNamespace) -> JXValue {
        get throws {
            return try self[namespace.value]
        }
    }
    
    /// Add the given namespace to this value.
    @discardableResult public func addNamespace(_ namespace: JXNamespace) throws -> JXValue {
        let existing = try self[namespace]
        guard existing.isNullOrUndefined else {
            return existing
        }
        let value = try context.eval(JSCodeGenerator.newNamespaceJSProxy(namespace))
        try self.setProperty(namespace.value, value)
        return value
    }
    
    /// Delete the property with the given namespace's value.
    @discardableResult public func deleteNamespace(_ namespace: JXNamespace) throws -> Bool {
        return try removeProperty(namespace.value)
    }
}
