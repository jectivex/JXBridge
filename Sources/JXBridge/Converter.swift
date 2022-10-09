//
//  Converter.swift
//  
//  Created by Abe White on 8/16/22.
//

#if canImport(ObjectiveC)
import ScriptBridgeObjC
#endif

/**
 Helper to convert between native and script values.
 */
struct Converter {
    // NOTE: We currently support deconstructing optionals, arrays, dictionaries,
    // optional arrays, and optional dictionaries.

    static func convertNumberFromScript<T>(_ value: Any, to type: T.Type) -> T? {
        if let auto = value as? T {
            return auto
        }
        if type == Int.self {
            if let int64 = value as? Int64 {
                return Int(int64) as? T
            }
            if let double = value as? Double {
                return Int(double) as? T
            }
            if let float = value as? Float {
                return Int(float) as? T
            }
#if canImport(CoreGraphics)
            if let cgFloat = value as? CGFloat {
                return Int(cgFloat) as? T
            }
#endif
        }
        if type == Int64.self {
            if let int = value as? Int {
                return Int64(int) as? T
            }
            if let double = value as? Double {
                return Int64(double) as? T
            }
            if let float = value as? Float {
                return Int64(float) as? T
            }
#if canImport(CoreGraphics)
            if let cgFloat = value as? CGFloat {
                return Int64(cgFloat) as? T
            }
#endif
        }
        if type == Double.self {
            if let int = value as? Int {
                return Double(int) as? T
            }
            if let int64 = value as? Int64 {
                return Double(int64) as? T
            }
            if let float = value as? Float {
                return Double(float) as? T
            }
#if canImport(CoreGraphics)
            if let cgFloat = value as? CGFloat {
                return Double(cgFloat) as? T
            }
#endif
        }
        if type == Float.self {
            if let double = value as? Double {
                return Float(double) as? T
            }
            if let int = value as? Int {
                return Float(int) as? T
            }
            if let int64 = value as? Int64 {
                return Float(int64) as? T
            }
#if canImport(CoreGraphics)
            if let cgFloat = value as? CGFloat {
                return Float(cgFloat) as? T
            }
#endif
        }
#if canImport(CoreGraphics)
        if type == CGFloat.self {
            if let double = value as? Double {
                return CGFloat(double) as? T
            }
            if let float = value as? Float {
                return CGFloat(float) as? T
            }
            if let int = value as? Int {
                return CGFloat(int) as? T
            }
            if let int64 = value as? Int64 {
                return CGFloat(int64) as? T
            }
        }
#endif
        return nil
    }

    /**
     Convert a script value to use as a native function argument or property
     setter.
     */
    static func convertFromScript<T>(typeName: String, function: String, argument: Any?, index: Int, to type: T.Type, registry: JXBridgeRegistry) throws -> T {
        guard let value = argument else {
            throw JXBridgeErrors.invalidNilArgument(typeName, function, index)
        }
        // This should cover custom bridged types as well as most conversions
        if let auto = value as? T {
            return auto
        }
        if let number = self.convertNumberFromScript(value, to: type) {
            return number
        }
        // Check for custom conversions, finally falling back to Decodable
        if let convertibleType = type as? ScriptConvertible.Type {
            if let converted = convertibleType.fromScript(value) as? T {
                return converted
            }
            throw JXBridgeErrors.unsupportedConvertFromScript(typeName, function, index, value)
        }
#if canImport(ObjectiveC)
        if let convertibleType = type as? JXScriptConvertible.Type {
            if let converted = convertibleType.fromScript(value) as? T {
                return converted
            }
            throw JXBridgeErrors.unsupportedConvertFromScript(typeName, function, index, value)
        }
#endif
        if let decodableType = type as? Decodable.Type {
            do {
                if let converted = try decodableType.sb_fromScript(value) as? T {
                    return converted
                }
            } catch {
            }
            throw JXBridgeErrors.unsupportedConvertFromScript(typeName, function, index, value)
        }
        throw JXBridgeErrors.unsupportedConvertFromScript(typeName, function, index, value)
    }

    /**
     Convert a script value to use as a native optional function argument or
     property setter.
     */
    static func convertFromScript<T>(typeName: String, function: String, argument: Any?, index: Int, to type: Optional<T>.Type, registry: JXBridgeRegistry) throws -> T? {
        guard argument != nil else {
            return nil
        }
        return try self.convertFromScript(typeName: typeName, function: function, argument: argument, index: index, to: T.self, registry: registry)
    }

    /**
     Convert a script value to use as a native array function argument or
     property setter.
     */
    static func convertFromScript<T>(typeName: String, function: String, argument: Any?, index: Int, to type: [T].Type, registry: JXBridgeRegistry) throws -> [T] {
        guard let value = argument else {
            throw JXBridgeErrors.invalidNilArgument(typeName, function, index)
        }
        if let auto = value as? [T] {
            return auto
        }
        guard let array = value as? [Any] else {
            throw JXBridgeErrors.unsupportedConvertFromScript(typeName, function, index, value)
        }
        return try array.map { element in
            return try self.convertFromScript(typeName: typeName, function: function, argument: element, index: index, to: T.self, registry: registry)
        }
    }

    /**
     Convert a script value to use as an optional native array function
     argument or property setter.
     */
    static func convertFromScript<T>(typeName: String, function: String, argument: Any?, index: Int, to type: Optional<[T]>.Type, registry: JXBridgeRegistry) throws -> [T]? {
        guard argument != nil else {
            return nil
        }
        return try self.convertFromScript(typeName: typeName, function: function, argument: argument, index: index, to: [T].self, registry: registry)
    }

    /**
     Convert a script value to use as a native dictionary function argument or
     property setter.
     */
    static func convertFromScript<T, U>(typeName: String, function: String, argument: Any?, index: Int, to type: [T: U].Type, registry: JXBridgeRegistry) throws -> [T: U] {
        guard let value = argument else {
            throw JXBridgeErrors.invalidNilArgument(typeName, function, index)
        }
        if let auto = value as? [T: U] {
            return auto
        }
        guard let dictionary = value as? [AnyHashable: Any] else {
            throw JXBridgeErrors.unsupportedConvertFromScript(typeName, function, index, value)
        }
        return try dictionary.reduce(into: [T: U]()) { result, entry in
            let convertedKey = try self.convertFromScript(typeName: typeName, function: function, argument: entry.key, index: index, to: T.self, registry: registry)
            let convertedValue = try self.convertFromScript(typeName: typeName, function: function, argument: entry.value, index: index, to: U.self, registry: registry)
            result[convertedKey] = convertedValue
        }
    }

    /**
     Convert a script value to use as an optional native dictionary function
     argument or property setter.
     */
    static func convertFromScript<T, U>(typeName: String, function: String, argument: Any?, index: Int, to type: Optional<[T: U]>.Type, registry: JXBridgeRegistry) throws -> [T: U]? {
        guard argument != nil else {
            return nil
        }
        return try self.convertFromScript(typeName: typeName, function: function, argument: argument, index: index, to: [T: U].self, registry: registry)
    }

    /**
     Convert a native return or property value to a script value.
     */
    static func convertToScript<T>(typeName: String, function: String, value: T?, registry: JXBridgeRegistry) throws -> Any? {
        guard let value else {
            return nil
        }
        if let string = value as? String {
            return string
        }
        if let bool = value as? Bool {
            return bool
        }
        if let int = value as? Int {
            return int
        }
        if let double = value as? Double {
            return double
        }
        if let int64 = value as? Int64 {
            return int64
        }
        if let float = value as? Float {
            return float
        }
#if canImport(ObjectiveC)
        if let number = value as? NSNumber {
            return number
        }
#endif
        if let date = value as? Date {
            return date
        }
        // First check if the value has a custom conversion, then check the
        // registry (which may cause auto-registration of an ObjectiveC type),
        // then fall back to Encodable
        if let convertible = value as? ScriptConvertible {
            if let converted = convertible.toScript {
                return converted
            }
            throw JXBridgeErrors.unsupportedConvertToScript(typeName, function, value)
        }
#if canImport(ObjectiveC)
        if let convertible = value as? JXScriptConvertible {
            if let converted = convertible.toScript {
                return converted
            }
            throw JXBridgeErrors.unsupportedConvertToScript(typeName, function, value)
        }
#endif
        if registry.hasJXBridge(for: T.self) {
            return value
        }
        if let encodable = value as? Encodable {
            do {
                return try encodable.sb_toScript
            } catch {
                throw JXBridgeErrors.unsupportedConvertToScript(typeName, function, value)
            }
        }
        throw JXBridgeErrors.unsupportedConvertToScript(typeName, function, value)
    }

    /**
     Convert an array native return or property value to a script value.
     */
    static func convertToScript<T>(typeName: String, function: String, value: [T]?, registry: JXBridgeRegistry) throws -> Any? {
        return try value?.map { element in
            return try self.convertToScript(typeName: typeName, function: function, value: element, registry: registry)!
        }
    }

    /**
     Convert a dictionary native return or property value to a script value.
     */
    static func convertToScript<T, U>(typeName: String, function: String, value: [T: U]?, registry: JXBridgeRegistry) throws -> Any? {
        return try value?.reduce(into: [AnyHashable: Any]()) { result, entry in
            guard let convertedKey = try self.convertToScript(typeName: typeName, function: function, value: entry.key, registry: registry) as? AnyHashable else {
                throw JXBridgeErrors.unsupportedConvertToScript(typeName, function, entry.key)
            }
            let convertedValue = try self.convertToScript(typeName: typeName, function: function, value: entry.value, registry: registry)
            result[convertedKey] = convertedValue
        }
    }

#if canImport(ObjectiveC)

    /**
     Convert from a script value to a boxed ObjectiveC `id` value to use as
     a selector argument via `JXObjectiveCReflector`.
     */
    static func convertObjectiveCFromScript(typeName: String, function: String, argument: Any?, index: Int, toBoxed type: JXObjectiveCType, registry: JXBridgeRegistry) throws -> AnyObject {
        guard let value = argument else {
            return JXObjectiveCNilPlaceholder as NSString
        }

        switch type {
        case .char:
            fallthrough
        case .unsignedChar:
            // Reflector expects a number
            if let string = value as? String, string.count > 0 {
                return NSNumber(value: string.utf8CString[0])
            }
            if let number = value as? NSNumber {
                return number
            }
        case .int:
            fallthrough
        case .short:
            fallthrough
        case .long:
            fallthrough
        case .longLong:
            fallthrough
        case .unsignedInt:
            fallthrough
        case .unsignedShort:
            fallthrough
        case .unsignedLong:
            fallthrough
        case .unsignedLongLong:
            fallthrough
        case .float:
            fallthrough
        case .double:
            if let number = value as? NSNumber {
                return number
            }
        case .void:
            throw JXBridgeErrors.unsupportedConvertFromScript(typeName, function, index, ())
        case .object:
            if let string = value as? NSString {
                return string
            }
            if let number = value as? NSNumber {
                return number
            }
            if let date = value as? NSDate {
                return date
            }
            if let nsobject = value as? NSObject, registry.hasJXBridge(for: Swift.type(of: nsobject)) {
                return nsobject
            }
        case .class:
            if let string = value as? String, let cls = NSClassFromString(string) {
                return cls
            }
        case .selector:
            // Reflector expects a string
            if let string = value as? NSString {
                return string
            }
        case .unsupported:
            break
        @unknown default:
            break
        }
        throw JXBridgeErrors.unsupportedConvertFromScript(typeName, function, index, value)
    }

    /**
     Convert a boxed ObjectiveC return value from `JXObjectiveCReflector` to a
     script value.
     */
    static func convertBoxedObjectiveCToScript(typeName: String, function: String, value: Any?, type: JXObjectiveCType, registry: JXBridgeRegistry) throws -> Any? {
        guard let value else {
            return nil
        }
        if let nilPlaceholder = value as? String, nilPlaceholder == JXObjectiveCNilPlaceholder {
            return nil
        }

        switch type {
        case .char:
            fallthrough
        case  .unsignedChar:
            // Reflector returns a number
            if let number = value as? NSNumber, let string = String(utf8String: [CChar(number.intValue), 0]) {
                return string
            }
        case .int:
            fallthrough
        case .short:
            fallthrough
        case .long:
            fallthrough
        case .longLong:
            fallthrough
        case .unsignedInt:
            fallthrough
        case .unsignedShort:
            fallthrough
        case .unsignedLong:
            fallthrough
        case .unsignedLongLong:
            fallthrough
        case .float:
            fallthrough
        case .double:
            if let number = value as? NSNumber {
                return number
            }
        case .void:
            return nil
        case .object:
            if let string = value as? String {
                return string
            }
            if let number = value as? NSNumber {
                return number
            }
            if let date = value as? Date {
                return date
            }
            if let nsobject = value as? NSObject, registry.hasJXBridge(for: Swift.type(of: nsobject)) {
                return nsobject
            }
        case .class:
            if let cls = value as? AnyClass {
                return NSStringFromClass(cls)
            }
        case .selector:
            // Reflector returns a string
            if let string = value as? String {
                return string
            }
        case .unsupported:
            fallthrough
        @unknown default:
            break
        }
        throw JXBridgeErrors.unsupportedConvertToScript(typeName, function, value)
    }
    
#endif
}
