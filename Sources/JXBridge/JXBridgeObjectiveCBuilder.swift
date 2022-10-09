#if canImport(ObjectiveC)

import JXBridgeObjC

extension JXBridge {
    /// Convenience init to create a bridge for any ObjectiveC class without using a `JXBridgeBuilder`.
    /// - Parameters:
    ///   - filter Return `false` to exclude a property or selector name from the resulting bridge.
    public init(objectiveCClass cls: AnyClass, with typeName: String? = nil, filter: (String) -> Bool = { _ in true }) {
        var bridge = JXBridge(cls)
        if let typeName {
            bridge.typeName = typeName
        }
        let builder = JXBridgeObjectiveCBuilder(cls, bridge: bridge)
        builder.addObjectiveCPropertiesAndMethods(filter: filter)
        builder.bridge.prepareLookupCaches()
        self = bridge
    }
}

class JXBridgeObjectiveCBuilder {
    init(_ cls: AnyClass, bridge: JXBridge) {
        self.class = cls
        self.bridge = bridge
    }

    let `class`: AnyClass
    var bridge: JXBridge

    func addObjectiveCPropertiesAndMethods(filter: (String) -> Bool) {
        let reflector = JXObjectiveCReflector(with: self.class)
        reflector.constructors.filter { filter($0.name) }.forEach { addConstructor($0) }
        reflector.properties.filter { filter($0.name) }.forEach { add($0) }
        reflector.methods.filter { filter($0.name) }.forEach { add($0) }
        reflector.classProperties.filter { filter($0.name) }.forEach { addClass($0) }
        reflector.classMethods.filter { filter($0.name) }.forEach { addClass($0) }
    }

    private func addConstructor(_ method: JXObjectiveCMethod) {
        let typeName = bridge.typeName
        let constructorBridge = ConstructorBridge(typeName: typeName, parameterCount: method.parameterCount) { args, registry in
            try validate(typeName: typeName, function: "init", arguments: args, count: method.parameterCount)
            var convertedArgs: [AnyObject] = []
            for i in 0 ..< args.count {
                let convertedArg = try Converter.convertObjectiveCFromScript(typeName: typeName, function: "init", argument: args[i], index: i, toBoxed: method.parameterTypes[i], registry: registry)
                convertedArgs.append(convertedArg)
            }
            let obj = self.class.alloc()
            let boxedRet = method.invoke(onTarget: obj, arguments: convertedArgs)
            return (obj, try Converter.convertBoxedObjectiveCToScript(typeName: typeName, function: "init", value: boxedRet, type: method.returnType, registry: registry))
        }
        self.bridge.constructors.append(constructorBridge)
    }

    private func add(_ property: JXObjectiveCProperty) {
        let typeName = self.bridge.typeName
        let name = property.name
        let getter: (Any, JXBridgeRegistry) throws -> Any? = { obj, registry in
            let boxedRet = property.getter.invoke(onTarget: obj, arguments: [])
            return try Converter.convertBoxedObjectiveCToScript(typeName: typeName, function: name, value: boxedRet, type: property.getter.returnType, registry: registry)
        }
        let setter: ((Any, Any?, JXBridgeRegistry) throws -> Any)?
        if let method = property.setter {
            setter = { obj, value, registry in
                let p0 = try Converter.convertObjectiveCFromScript(typeName: typeName, function: name, argument: value, index: 0, toBoxed: method.parameterTypes[0], registry: registry)
                method.invoke(onTarget: obj, arguments: [p0])
                return obj
            }
        } else {
            setter = nil
        }
        self.bridge.properties.append(PropertyBridge(typeName: typeName, name: name, getter: getter, setter: setter))
    }

    private func add(_ method: JXObjectiveCMethod) {
        let typeName = self.bridge.typeName
        let functionName = _functionName(forSelectorName: method.name)
        let functionBridge = FunctionBridge(typeName: typeName, name: functionName) { obj, args, registry in
            try validate(typeName: typeName, function: functionName, arguments: args, count: method.parameterCount)
            var convertedArgs: [AnyObject] = []
            for i in 0 ..< args.count {
                let convertedArg = try Converter.convertObjectiveCFromScript(typeName: typeName, function: functionName, argument: args[i], index: i, toBoxed: method.parameterTypes[i], registry: registry)
                convertedArgs.append(convertedArg)
            }
            let boxedRet = method.invoke(onTarget: obj, arguments: convertedArgs)
            return (obj, try Converter.convertBoxedObjectiveCToScript(typeName: typeName, function: functionName, value: boxedRet, type: method.returnType, registry: registry))
        }
        self.bridge.functions.append(functionBridge)
    }

    private func addClass(_ property: JXObjectiveCProperty) {
        let typeName = self.bridge.typeName
        let name = property.name
        let getter: (Any, JXBridgeRegistry) throws -> Any? = { obj, registry in
            let target: AnyClass = obj as! AnyClass
            let boxedRet = property.getter.invoke(onTarget: target, arguments: [])
            return try Converter.convertBoxedObjectiveCToScript(typeName: typeName, function: name, value: boxedRet, type: property.getter.returnType, registry: registry)
        }
        let setter: ((Any, Any?, JXBridgeRegistry) throws -> Void)?
        if let method = property.setter {
            setter = { obj, value, registry in
                let target: AnyClass = obj as! AnyClass
                let p0 = try Converter.convertObjectiveCFromScript(typeName: typeName, function: name, argument: value, index: 0, toBoxed: method.parameterTypes[0], registry: registry)
                method.invoke(onTarget: target, arguments: [p0])
            }
        } else {
            setter = nil
        }
        self.bridge.classProperties.append(PropertyBridge(typeName: typeName, name: name, getter: getter, setter: setter))
    }

    private func addClass(_ method: JXObjectiveCMethod) {
        let typeName = self.bridge.typeName
        let functionName = _functionName(forSelectorName: method.name)
        let functionBridge = FunctionBridge(typeName: typeName, name: functionName) { obj, args, registry in
            try validate(typeName: typeName, function: functionName, arguments: args, count: method.parameterCount)
            var convertedArgs: [AnyObject] = []
            for i in 0 ..< args.count {
                let convertedArg = try Converter.convertObjectiveCFromScript(typeName: typeName, function: functionName, argument: args[i], index: i, toBoxed: method.parameterTypes[i], registry: registry)
                convertedArgs.append(convertedArg)
            }
            let target: AnyClass = obj as! AnyClass
            let boxedRet = method.invoke(onTarget: target, arguments: convertedArgs)
            return (target, try Converter.convertBoxedObjectiveCToScript(typeName: typeName, function: functionName, value: boxedRet, type: method.returnType, registry: registry))
        }
        self.bridge.classFunctions.append(functionBridge)
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

private func validate(typeName: String, function: String, arguments: [Any?], count: Int) throws {
    if arguments.count != count {
        throw JXBridgeErrors.invalidArgumentCount(typeName, function)
    }
}

/// Convert from a value we got from a script to a boxed ObjectiveC `id` value to use as a selector argument via `JXObjectiveCReflector`.
private func convertObjectiveCFromScript(typeName: String, function: String, argument: Any?, index: Int, toBoxed type: JXObjectiveCType, registry: JXBridgeRegistry) throws -> AnyObject {
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
        throw JXBridgeErrors.cannotConvertFromScript(typeName, function, index, ())
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
        if let nsobject = value as? NSObject, registry.hasBridge(for: Swift.type(of: nsobject)) {
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
    throw JXBridgeErrors.cannotConvertFromScript(typeName, function, index, value)
}

/// Convert a boxed ObjectiveC return value from `JXObjectiveCReflector` to a value that we can transfer to a script.
private func convertBoxedObjectiveCToScript(typeName: String, function: String, value: Any?, type: JXObjectiveCType, registry: JXBridgeRegistry) throws -> Any? {
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
        if let nsobject = value as? NSObject, registry.hasBridge(for: type(of: nsobject)) {
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
    throw JXBridgeErrors.cannotConvertToScript(typeName, function, value)
}

#endif
