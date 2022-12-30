#if canImport(ObjectiveC)
import JXBridgeObjC
import JXKit

final class ObjectiveCBuilder {
    init(bridge: JXBridge) {
        self.bridge = bridge
    }

    var bridge: JXBridge

    func addObjectiveCPropertiesAndMethods(prefixes: [String] = []) {
        guard let cls = bridge.type as? AnyClass else {
            return
        }
        let reflector = JXObjectiveCReflector(with: cls, prefixes: prefixes)
        reflector.constructors.forEach { addConstructor(cls, $0) }
        reflector.properties.forEach { addProperty($0) }
        reflector.methods.forEach { addMethod($0) }
        reflector.classProperties.forEach { addClassProperty($0) }
        reflector.classMethods.forEach { addClassMethod($0) }
    }

    private func addConstructor(_ cls: AnyClass, _ method: JXObjectiveCMethod) {
        let constructorBridge = JXBridge.ConstructorBridge(owningTypeName: String(describing: bridge.type), parameterCount: method.parameterCount) { args, context in
            try validate(arguments: args, count: method.parameterCount)
            var convertedArgs: [AnyObject] = []
            for i in 0 ..< args.count {
                let convertedArg = try conveyToObjectiveC(args[i], toBoxed: method.parameterTypes[i])
                convertedArgs.append(convertedArg)
            }
            let obj = cls.alloc()
            return method.invoke(onTarget: obj, arguments: convertedArgs) ?? obj
        }
        bridge.constructors.append(constructorBridge)
    }

    private func addProperty(_ property: JXObjectiveCProperty) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let boxedRet = property.getter.invoke(onTarget: obj, arguments: [])
            return try conveyFromObjectiveC(boxedRet, into: context, fromBoxed: property.getter.returnType)
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let method = property.setter {
            setter = { obj, value, context in
                let p0 = try conveyToObjectiveC(value, toBoxed: method.parameterTypes[0])
                method.invoke(onTarget: obj, arguments: [p0])
                return obj
            }
        } else {
            setter = nil
        }
        bridge.properties.append(JXBridge.PropertyBridge(owningTypeName: String(describing: bridge.type), name: property.name, getter: getter, setter: setter))
    }

    private func addMethod(_ method: JXObjectiveCMethod) {
        let functionName = functionName(forSelectorName: method.name)
        let functionBridge = JXBridge.FunctionBridge(owningTypeName: String(describing: bridge.type), name: functionName, parameterCount: method.parameterCount) { obj, args, context in
            var convertedArgs: [AnyObject] = []
            for i in 0 ..< args.count {
                let convertedArg = try conveyToObjectiveC(args[i], toBoxed: method.parameterTypes[i])
                convertedArgs.append(convertedArg)
            }
            let boxedRet = method.invoke(onTarget: obj, arguments: convertedArgs)
            let retjx = try conveyFromObjectiveC(boxedRet, into: context, fromBoxed: method.returnType)
            return (obj, retjx)
        }
        bridge.functions.append(functionBridge)
    }

    private func addClassProperty(_ property: JXObjectiveCProperty) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target: AnyClass = obj as! AnyClass
            let boxedRet = property.getter.invoke(onTarget: target, arguments: [])
            return try conveyFromObjectiveC(boxedRet, into: context, fromBoxed: property.getter.returnType)
        }
        let setter: ((Any, JXValue, JXContext) throws -> Void)?
        if let method = property.setter {
            setter = { obj, value, context in
                let target: AnyClass = obj as! AnyClass
                let p0 = try conveyToObjectiveC(value, toBoxed: method.parameterTypes[0])
                method.invoke(onTarget: target, arguments: [p0])
            }
        } else {
            setter = nil
        }
        bridge.classProperties.append(JXBridge.PropertyBridge(owningTypeName: String(describing: bridge.type), name: property.name, getter: getter, setter: setter))
    }

    private func addClassMethod(_ method: JXObjectiveCMethod) {
        let functionName = functionName(forSelectorName: method.name)
        let functionBridge = JXBridge.FunctionBridge(owningTypeName: String(describing: bridge.type), name: functionName, parameterCount: method.parameterCount) { obj, args, context in
            var convertedArgs: [AnyObject] = []
            for i in 0 ..< args.count {
                let convertedArg = try conveyToObjectiveC(args[i], toBoxed: method.parameterTypes[i])
                convertedArgs.append(convertedArg)
            }
            let target: AnyClass = obj as! AnyClass
            let boxedRet = method.invoke(onTarget: target, arguments: convertedArgs)
            let retjx = try conveyFromObjectiveC(boxedRet, into: context, fromBoxed: method.returnType)
            return (target, retjx)
        }
        bridge.classFunctions.append(functionBridge)
    }
}

/// To create a function name from a selector we concatenate all the words, capitalizing words after `:`s. E.g. `doSomething:withArg:` becomes `doSomethingWithArg(_, _)`.
private func functionName(forSelectorName name: String) -> String {
    var scriptName = ""
    var capitalizeNext = false
    for char in name {
        if char == ":" {
            capitalizeNext = true
        } else if capitalizeNext {
            scriptName.append(char.uppercased())
        } else {
            scriptName.append(char)
        }
    }
    return scriptName
}

/// Convert from a value we got from a script to a boxed ObjectiveC `id` value to use as a selector argument via `JXObjectiveCReflector`.
private func conveyToObjectiveC(_ value: JXValue, toBoxed type: JXObjectiveCType) throws -> AnyObject {
    guard !value.isNull else {
        return JXObjectiveCNilPlaceholder as NSString
    }

    switch type {
    case .char:
        fallthrough
    case .unsignedChar:
        // Reflector expects a number
        let string = try value.string
        if !string.isEmpty {
            return NSNumber(value: string.utf8CString[0])
        }
        return NSNumber(value: 0)
    case .int:
        return try NSNumber(value: value.int)
    case .short:
        return try NSNumber(value: value.int32)
    case .long:
        fallthrough
    case .longLong:
        return try NSNumber(value: value.int64)
    case .unsignedInt:
        return try NSNumber(value: value.uint)
    case .unsignedShort:
        return try NSNumber(value: value.uint32)
    case .unsignedLong:
        fallthrough
    case .unsignedLongLong:
        return try NSNumber(value: value.uint64)
    case .float:
        return try NSNumber(value: value.float)
    case .double:
        return try NSNumber(value: value.double)
    case .void:
        throw JXError(message: "Cannot convey JavaScript value '\(value)' to ObjectiveC `void`")
    case .object:
        switch value.type {
        case .null:
            return JXObjectiveCNilPlaceholder as NSString
        case .undefined:
            return JXObjectiveCNilPlaceholder as NSString
        case .boolean:
            return NSNumber(value: value.bool)
        case .number:
            return try NSNumber(value: value.double)
        case .date:
            return try value.date as NSDate
        case .arrayBuffer:
            throw JXError(message: "Cannot convey JavaScript array buffer to ObjectiveC object")
        case .string:
            return try value.string as NSString
        case .array:
            let array = try value.array
            return try array.map { try conveyToObjectiveC($0, toBoxed: .object) } as NSArray
        case .object:
            if let spi = value.context.spi as? ContextSPI, let object = try spi.fromJX(value, to: NSObject.self) {
                return object
            }
            let dictionary = try value.dictionary
            return try dictionary.reduce(into: [:]) { result, entry in
                result[entry.key] = try conveyToObjectiveC(entry.value, toBoxed: .object)
            } as NSDictionary
        case .symbol:
            return try value.string as NSString
        case .promise:
            break
        case .error:
            break
        case .constructor:
            break
        case .function:
            break
        case .other:
            break
        }
    case .class:
        if let cls = try NSClassFromString(value.string) {
            return cls
        }
        return JXObjectiveCNilPlaceholder as NSString
    case .selector:
        // Reflector expects a string
        return try value.string as NSString
    case .unsupported:
        break
    @unknown default:
        break
    }
    throw JXError(message: "Cannot convey JavaScript value '\(value)' to ObjectiveC. The ObjectiveC type is not supported")
}

/// Convert a boxed ObjectiveC return value from `JXObjectiveCReflector` to a value that we can transfer to a script.
private func conveyFromObjectiveC(_ object: Any?, into context: JXContext, fromBoxed type: JXObjectiveCType) throws -> JXValue {
    guard let object else {
        return context.null()
    }
    if let nilPlaceholder = object as? String, nilPlaceholder == JXObjectiveCNilPlaceholder {
        return context.null()
    }

    switch type {
    case .char:
        fallthrough
    case  .unsignedChar:
        // Reflector returns a number
        if let number = object as? NSNumber, let string = String(utf8String: [CChar(number.intValue), 0]) {
            return context.string(string)
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
        if let number = object as? NSNumber {
            return context.number(number.doubleValue)
        }
    case .void:
        return context.undefined()
    case .object:
        return try context.convey(object)
    case .class:
        if let cls = object as? AnyClass {
            return context.string(NSStringFromClass(cls) as String)
        }
    case .selector:
        // Reflector returns a string
        if let string = object as? String {
            return context.string(string)
        }
    case .unsupported:
        fallthrough
    @unknown default:
        break
    }
    throw JXError(message: "Cannot convey ObjectiveC value '\(object)' to JavaScript. The ObjectiveC type is not supported")
}
#endif
