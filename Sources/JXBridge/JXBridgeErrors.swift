/// Error encountered when bridging types to JavaScript.
public enum JXBridgeErrors: Error {
#if canImport(ObjectiveC)

    /// We do not support converting the given argument to the corresponding ObjectiveC type.
    /// (Type name, member name, value.)
    case cannotConvertToObjectiveC(String, String, Any)

    /// We do not support converting the ObjectiveC function return or property value to a JS value.
    /// (Type name, member name, value.)
    case cannotConvertFromObjectiveC(String, String, Any)
    
#endif

    /// An internal bridging error occurred.
    case internalError(String)

     /// Script supplied incorrect number of arguments to a function.
     /// (Type name, function name)
    case invalidArgumentCount(String, String)

    /// Expected a context but got an invalid value.
    /// (Message)
    case invalidContext(String)
    
    /// Expected an instance but got an invalid value.
    /// (Message)
    case invalidInstance(String)

    /// Script attempted to create an instance of a type without any bridged constructors.
    /// (Type name)
    case noConstructors(String)

    /// Script attempted to set a read-only property.
    /// (Type name, property name)
    case readOnlyProperty(String, String)
    
    /// Detected attempt to register the same type under multiple namespaces.
    /// (Type name, namespace)
    case namespaceViolation(String, String)

    /// Script attempted to access an unknown symbol.
    /// (Type/namespace name, symbol name)
    case unknownSymbol(String, String)
    
    /// Attempt to perform an unsupported operation.
    case unsupported(String)
}
