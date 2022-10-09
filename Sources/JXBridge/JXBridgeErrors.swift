/// Error encountered when bridging types to JavaScript.
public enum JXBridgeErrors: Error {
     /// Script supplied incorrect number of arguments to a function.
     /// (Type name, function name.)
    case invalidArgumentCount(String, String)

    /// Script supplied nil to an argument or value that requires non-nil.
    /// (Type name, member name, argument index.)
    case invalidNilArgument(String, String, Int)

    /// Script attempted to create an instance of a type without any bridged constructors.
    /// (Type name.)
    case noConstructors(String)

    /// Script attempted to set a read-only property.
    /// (Type name, property name.)
    case readOnlyProperty(String, String)

    /// Script attempted to invoke an unknown function name.
    /// (Type name, function name.)
    case unknownFunctionName(String, String)

    /// Script attempted to access an unknown property name.
    /// (Type name, property name.)
    case unknownPropertyName(String, String)

    /// Script attempted to access an unknown type.
    /// (Type name.)
    case unknownType(String)

    /// We do not support converting the given argument to the corresponding native type.
    /// (Type name, member name, argument index, value.)
    case cannotConvertFromScript(String, String, Int, Any)

    /// We do not support converting the function return or property value to a script value.
    /// (Type name, member name, value.)
    case cannotConvertToScript(String, String, Any)
}
