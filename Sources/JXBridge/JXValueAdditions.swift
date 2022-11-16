import JXKit

extension JXValue {
    /// Bind the bridged instance properties and functions of the given object to this value.
    ///
    /// - Warning: The given object is not retained.
    public func integrate(_ instance: Any) throws {
        guard let bridge = try context.registry.bridge(for: instance, autobridging: true) else {
            throw JXBridgeErrors.unknownType(String(describing: Swift.type(of: instance)))
        }
        
        // Use a weak ref to any object value
        var ref: Ref
        if Swift.type(of: instance) is AnyClass {
            ref = WeakRef(object: instance as AnyObject)
        } else {
            ref = StrongRef(instance: instance)
        }
        
        for propertyBridge in bridge.properties {
            let getter: (JXValue) throws -> JXValue = { this in
                return try propertyBridge.get(for: ref.instance, in: this.context)
            }
            let setter: ((JXValue, JXValue) throws -> Void)?
            if propertyBridge.setter != nil {
                setter = { this, value in
                    try ref.updateInstance(propertyBridge.set(for: ref.instance, value: value, in: this.context))
                }
            } else {
                setter = nil
            }
            let jxProperty = JXProperty(getter: getter, setter: setter)
            try defineProperty(context.string(propertyBridge.name), jxProperty)
        }
        
        for functionBridge in bridge.functions {
            let jxFunction = JXValue(newFunctionIn: context) { context, this, args in
                let (newInstance, ret) = try functionBridge.call(for: ref.instance, with: args, in: context)
                ref.updateInstance(newInstance)
                return ret
            }
            try setProperty(functionBridge.name, jxFunction)
        }
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
        return try deleteProperty(namespace.value)
    }
}

private protocol Ref {
    var instance: Any { get throws }
    mutating func updateInstance(_ instance: Any)
}

private struct StrongRef: Ref {
    var instance: Any
    
    mutating func updateInstance(_ instance: Any) {
        self.instance = instance
    }
}

private struct WeakRef: Ref {
    weak var object: AnyObject?
    
    var instance: Any {
        get throws {
            guard let object else {
                throw JXBridgeErrors.invalidInstance
            }
            return object
        }
    }
    
    mutating func updateInstance(_ instance: Any) {
        self.object = instance as AnyObject
    }
}