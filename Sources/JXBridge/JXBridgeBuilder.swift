#if canImport(ObjectiveC)
import Foundation
import ScriptBridgeObjC
#endif

// TODO: Expand builder constructors, funcs to handle additional arguments.
// TODO: Expand builder to handle async funcs.

/// Build the bridge for scripting a native type.
public class JXBridgeBuilder<T> {
    /// Supply the type to bridge.
    public init(_ type: T.Type) {
        inProgressBridge = JXBridge(T.self)
    }

    /// The type being bridged.
    public let type = T.self

    /// Retrieve the bridge that has been built.
    public var bridge: JXBridge {
        get {
            inProgressBridge.prepareLookupCaches()
            return inProgressBridge
        }
        set {
            inProgressBridge = newValue
        }
    }
    fileprivate var inProgressBridge: JXBridge

    /// Add bridged instance vars.
    public var `var`: JXBridgeBuilderVars<T> {
        return JXBridgeBuilderVars(builder: self)
    }

    /// Add bridged instance functions.
    public var `func`: JXBridgeBuilderFuncs<T> {
        return JXBridgeBuilderFuncs(builder: self)
    }

    /// Add bridged mutating functions to value types.
    public var `mutating`: JXBridgeBuilderMutating<T> {
        return JXBridgeBuilderMutating(builder: self)
    }

    /// Add bridged static members.
    public var `static`: JXBridgeBuilderStatics<T> {
        return JXBridgeBuilderStatics(builder: self)
    }

    /// Add bridged class members.
    public var `class`: JXBridgeBuilderClassMembers<T> {
        return JXBridgeBuilderClassMembers(builder: self)
    }

#if canImport(ObjectiveC)

    /// Convenience to add all ObjectiveC-visible properties and methods.
    /// - Parameters:
    ///   - filter: Return false to exclude the member with the given name.
    @discardableResult public func addObjectiveCPropertiesAndMethods(filter: (String) -> Bool = { _ in true }) -> JXBridgeBuilder<T> {
        guard let cls = type as? AnyClass else {
            return self
        }
        let objcBuilder = JXBridgeObjectiveCBuilder(cls, bridge: inProgressBridge)
        objcBuilder.addObjectiveCPropertiesAndMethods(filter: filter)
        inProgressBridge = objcBuilder.bridge
        return self
    }

#endif

    @discardableResult public func superclass(_ superclass: Any.Type) -> JXBridgeBuilder<T> {
        inProgressBridge.superclass = superclass
        return self
    }

    /// builder.constructor { Type.init }
    @discardableResult public func constructor(_ cons: @escaping () -> () throws -> T) -> JXBridgeBuilder<T> {
        return self.constructor(cons())
    }

    /// builder.constructor { Type() }
    @discardableResult public func constructor(_ cons: @escaping () throws -> T) -> JXBridgeBuilder<T> {
        let typeName = inProgressBridge.typeName
        let constructorBridge = ConstructorBridge(typeName: typeName, parameterCount: 0) { args, _ in
            try validate(typeName: typeName, function: "init", arguments: args, count: 0)
            return try cons()
        }
        return add(constructorBridge)
    }

    /// builder.constructor { Type.init(p0:) }
    @discardableResult public func constructor<P0>(_ cons: @escaping () -> (P0) throws -> T) -> JXBridgeBuilder<T> {
        return self.constructor(cons())
    }

    /// builder.constructor { Type(p0: $1) }
    @discardableResult public func constructor<P0>(_ cons: @escaping (P0) throws -> T) -> JXBridgeBuilder<T> {
        let typeName = inProgressBridge.typeName
        let constructorBridge = ConstructorBridge(typeName: typeName, parameterCount: 1) { args, registry in
            try validate(typeName: typeName, function: "init", arguments: args, count: 1)
            let arg0 = try Converter.convertFromScript(typeName: typeName, function: "init", argument: args[0], index: 0, to: P0.self, registry: registry)
            return try cons(arg0)
        }
        return add(constructorBridge)
    }

    private func add(_ constructorBridge: ConstructorBridge) -> JXBridgeBuilder<T> {
        inProgressBridge.constructors.append(constructorBridge)
        return self
    }
}

@dynamicMemberLookup
public struct JXBridgeBuilderVars<T> {
    var builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Var<T> {
        return Var(name: name, vars: self)
    }

    public struct Var<T> {
        let name: String
        let vars: JXBridgeBuilderVars<T>

        // builder.var.xxx { \.xxx }
        @discardableResult public func callAsFunction<V>(_ accessor: () -> KeyPath<T, V>) -> JXBridgeBuilder<T> {
            let keyPath = accessor()
            let typeName = _typeName
            let name = self.name
            let getter: (Any, JXBridgeRegistry) throws -> Any? = { obj, registry in
                let ret = (obj as! T)[keyPath: keyPath]
                return try Converter.convertToScript(typeName: typeName, function: name, value: ret, registry: registry)
            }
            let setter: ((Any, Any?, JXBridgeRegistry) throws -> Any)?
            if let writeableKeyPath = keyPath as? WritableKeyPath<T, V> {
                setter = { obj, value, registry in
                    var target = obj as! T
                    let p0 = try Converter.convertFromScript(typeName: typeName, function: name, argument: value, index: 0, to: V.self, registry: registry)
                    target[keyPath: writeableKeyPath] = p0
                    return target
                }
            } else {
                setter = nil
            }
            return _add(PropertyBridge(typeName: typeName, name: name, getter: getter, setter: setter))
        }

        // builder.var.xxx { $0.xxx }
        @discardableResult public func callAsFunction<V>(_ getter: @escaping (T) throws -> V) -> JXBridgeBuilder<T> {
            return self.callAsFunction(get: getter, set: nil)
        }

        // builder.var.xxx { $0.xxx ) setter: { ... }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T) throws -> V, set setterFunc: ((T, V) -> Void)?) -> JXBridgeBuilder<T> {
            let typeName = _typeName
            let name = self.name
            let getter: (Any, JXBridgeRegistry) throws -> Any? = { obj, registry in
                let target = obj as! T
                let ret = try getterFunc(target)
                return try Converter.convertToScript(typeName: typeName, function: name, value: ret, registry: registry)
            }
            let setter: ((Any, Any?, JXBridgeRegistry) throws -> Any)?
            if let setterFunc {
                setter = { obj, value, registry in
                    let target = obj as! T
                    let p0 = try Converter.convertFromScript(typeName: typeName, function: name, argument: value, index: 0, to: V.self, registry: registry)
                    setterFunc(target, p0)
                    return target
                }
            } else {
                setter = nil
            }
            return _add(PropertyBridge(typeName: typeName, name: name, getter: getter, setter: setter))
        }

        // builder.var.xxx { $0.xxx ) setter: { ... }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T) throws -> V, set setterFunc: @escaping (T, V) -> T) -> JXBridgeBuilder<T> {
            let typeName = _typeName
            let name = self.name
            let getter: (Any, JXBridgeRegistry) throws -> Any? = { obj, registry in
                let target = obj as! T
                let ret = try getterFunc(target)
                return try Converter.convertToScript(typeName: typeName, function: name, value: ret, registry: registry)
            }
            let setter: (Any, Any?, JXBridgeRegistry) throws -> Any = { obj, value, registry in
                let target = obj as! T
                let p0 = try Converter.convertFromScript(typeName: typeName, function: name, argument: value, index: 0, to: V.self, registry: registry)
                let ret = setterFunc(target, p0)
                return ret
            }
            return _add(PropertyBridge(typeName: typeName, name: name, getter: getter, setter: setter))
        }

        private var _typeName: String {
            return self.vars.builder.inProgressBridge.typeName
        }

        private func _add(_ propertyBridge: PropertyBridge) -> JXBridgeBuilder<T> {
            self.vars.builder.inProgressBridge.properties.append(propertyBridge)
            return self.vars.builder
        }
    }
}

@dynamicMemberLookup
public struct JXBridgeBuilderFuncs<T> {
    let builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Func<T> {
        return Func(name: name, funcs: self)
    }

    public struct Func<T> {
        let name: String
        let funcs: JXBridgeBuilderFuncs<T>

        // builder.func.xxx { Type.xxx }
        @discardableResult public func callAsFunction<R>(_ f: @escaping () -> (T) -> () throws -> R) -> JXBridgeBuilder<T> {
            let instanceFunc = f()
            return self.callAsFunction { (obj: T) throws -> R in
                let callFunc = instanceFunc(obj)
                return try callFunc()
            }
        }

        // builder.func.xxx { $0.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping (T) throws -> R) -> JXBridgeBuilder<T> {
            let typeName = _typeName
            let name = self.name
            let function: (Any, [Any?], JXBridgeRegistry) throws -> (Any, Any?) = { obj, args, registry in
                let target = obj as! T
                try validate(typeName: typeName, function: name, arguments: args, count: 0)
                let ret = try f(target)
                return (target, try Converter.convertToScript(typeName: typeName, function: name, value: ret, registry: registry))
            }
            return _add(FunctionBridge(typeName: typeName, name: name, function: function))
        }

        // builder.func.xxx { Type.xxx(p0:) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (T) -> (P0) throws -> R) -> JXBridgeBuilder<T> {
            let instanceFunc = f()
            return self.callAsFunction { (obj: T, p0: P0) throws -> R in
                let callFunc = instanceFunc(obj)
                return try callFunc(p0)
            }
        }

        // builder.func.xxx { $0.xxx(p0: $1) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T, P0) throws -> R) -> JXBridgeBuilder<T> {
            let typeName = _typeName
            let name = self.name
            let function: (Any, [Any?], JXBridgeRegistry) throws -> (Any, Any?) = { obj, args, registry in
                let target = obj as! T
                try validate(typeName: typeName, function: name, arguments: args, count: 1)
                let p0 = try Converter.convertFromScript(typeName: typeName, function: name, argument: args[0], index: 0, to: P0.self, registry: registry)
                let ret = try f(target, p0)
                return (target, try Converter.convertToScript(typeName: typeName, function: name, value: ret, registry: registry))
            }
            return _add(FunctionBridge(typeName: typeName, name: name, function: function))
        }

        private var _typeName: String {
            return self.funcs.builder.inProgressBridge.typeName
        }

        private func _add(_ functionBridge: FunctionBridge) -> JXBridgeBuilder<T> {
            self.funcs.builder.inProgressBridge.functions.append(functionBridge)
            return self.funcs.builder
        }
    }
}

public struct JXBridgeBuilderMutating<T> {
    init(builder: JXBridgeBuilder<T>) {
        self.func = JXBridgeBuilderMutatingFuncs(builder: builder)
    }

    public let `func`: JXBridgeBuilderMutatingFuncs<T>
}

@dynamicMemberLookup
public struct JXBridgeBuilderMutatingFuncs<T> {
    let builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Func<T> {
        return Func(name: name, funcs: self)
    }

    public struct Func<T> {
        let name: String
        let funcs: JXBridgeBuilderMutatingFuncs<T>

        // builder.mutating.func.xxx { $0.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping (inout T) throws -> R) -> JXBridgeBuilder<T> {
            let typeName = _typeName
            let name = self.name
            let function: (Any, [Any?], JXBridgeRegistry) throws -> (Any, Any?) = { obj, args, registry in
                var target = obj as! T
                try validate(typeName: typeName, function: name, arguments: args, count: 0)
                let ret = try f(&target)
                return (target, try Converter.convertToScript(typeName: typeName, function: name, value: ret, registry: registry))
            }
            return _add(FunctionBridge(typeName: typeName, name: name, function: function))
        }

        // builder.mutating.func.xxx { $0.xxx(p0: $1) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (inout T, P0) throws -> R) -> JXBridgeBuilder<T> {
            let typeName = _typeName
            let name = self.name
            let function: (Any, [Any?], JXBridgeRegistry) throws -> (Any, Any?) = { obj, args, registry in
                var target = obj as! T
                try validate(typeName: typeName, function: name, arguments: args, count: 1)
                let p0 = try Converter.convertFromScript(typeName: typeName, function: name, argument: args[0], index: 0, to: P0.self, registry: registry)
                let ret = try f(&target, p0)
                return (target, try Converter.convertToScript(typeName: typeName, function: name, value: ret, registry: registry))
            }
            return _add(FunctionBridge(typeName: typeName, name: name, function: function))
        }

        private var _typeName: String {
            return self.funcs.builder.inProgressBridge.typeName
        }

        private func _add(_ functionBridge: FunctionBridge) -> JXBridgeBuilder<T> {
            self.funcs.builder.inProgressBridge.functions.append(functionBridge)
            return self.funcs.builder
        }
    }
}

public struct JXBridgeBuilderStatics<T> {
    init(builder: JXBridgeBuilder<T>) {
        self.var = JXBridgeBuilderStaticVars(builder: builder)
        self.func = JXBridgeBuilderStaticFuncs(builder: builder)
    }

    public let `var`: JXBridgeBuilderStaticVars<T>
    public let `func`: JXBridgeBuilderStaticFuncs<T>
}

@dynamicMemberLookup
public struct JXBridgeBuilderStaticVars<T> {
    let builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Var<T> {
        return Var(name: name, vars: self)
    }

    public struct Var<T> {
        let name: String
        let vars: JXBridgeBuilderStaticVars<T>

        // builder.static.var.xxx { Type.xxx }
        @discardableResult public func callAsFunction<V>(_ getterFunc: @escaping () throws -> V) -> JXBridgeBuilder<T> {
            return self.callAsFunction(get: getterFunc, set: nil)
        }

        // builder.static.var.xxx { Type.xxx } setter: { ... }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping () throws -> V, set setterFunc: ((V) -> Void)?) -> JXBridgeBuilder<T> {
            let getter: (JXBridgeRegistry) throws -> Any? = { _ in
                return try getterFunc()
            }
            let typeName = _typeName
            let name = self.name
            let setter: ((Any?, JXBridgeRegistry) throws -> Void)?
            if let setterFunc {
                setter = { value, registry in
                    let p0 = try Converter.convertFromScript(typeName: typeName, function: name, argument: value, index: 0, to: V.self, registry: registry)
                    setterFunc(p0)
                }
            } else {
                setter = nil
            }
            return _add(StaticPropertyBridge(typeName: typeName, name: name, getter: getter, setter: setter))
        }

        private var _typeName: String {
            return self.vars.builder.inProgressBridge.typeName
        }

        private func _add(_ propertyBridge: StaticPropertyBridge) -> JXBridgeBuilder<T> {
            self.vars.builder.inProgressBridge.staticProperties.append(propertyBridge)
            return self.vars.builder
        }
    }
}

@dynamicMemberLookup
public struct JXBridgeBuilderStaticFuncs<T> {
    let builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Func {
        return Func(name: name, funcs: self)
    }

    public struct Func {
        let name: String
        let funcs: JXBridgeBuilderStaticFuncs

        // builder.static.func.xxx { Type.xxx }
        @discardableResult public func callAsFunction<R>(_ f: @escaping () -> () throws -> R) -> JXBridgeBuilder<T> {
            let staticFunc = f()
            return self.callAsFunction(staticFunc)
        }

        // builder.static.func.xxx { Type.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping () throws -> R) -> JXBridgeBuilder<T> {
            let typeName = _typeName
            let name = self.name
            let functionBridge = StaticFunctionBridge(typeName: typeName, name: name) { args, registry in
                try validate(typeName: typeName, function: name, arguments: args, count: 0)
                let ret = try f()
                return try Converter.convertToScript(typeName: typeName, function: name, value: ret, registry: registry)
            }
            return _add(functionBridge)
        }

        // builder.static.func.xxx { Type.xxx(p0:) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (P0) throws -> R) -> JXBridgeBuilder<T> {
            let staticFunc = f()
            return self.callAsFunction(staticFunc)
        }

        // builder.static.func.xxx { Type.xxx(p0: $0) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (P0) throws -> R) -> JXBridgeBuilder<T> {
            let typeName = _typeName
            let name = self.name
            let functionBridge = StaticFunctionBridge(typeName: typeName, name: name) { args, registry in
                try validate(typeName: typeName, function: name, arguments: args, count: 1)
                let p0 = try Converter.convertFromScript(typeName: typeName, function: name, argument: args[0], index: 0, to: P0.self, registry: registry)
                let ret = try f(p0)
                return try Converter.convertToScript(typeName: typeName, function: name, value: ret, registry: registry)
            }
            return _add(functionBridge)
        }

        private var _typeName: String {
            return self.funcs.builder.inProgressBridge.typeName
        }

        private func _add(_ functionBridge: StaticFunctionBridge) -> JXBridgeBuilder<T> {
            self.funcs.builder.inProgressBridge.staticFunctions.append(functionBridge)
            return self.funcs.builder
        }
    }
}

public struct JXBridgeBuilderClassMembers<T> {
    init(builder: JXBridgeBuilder<T>) {
        self.var = JXBridgeBuilderClassVars(builder: builder)
        self.func = JXBridgeBuilderClassFuncs(builder: builder)
    }

    public let `var`: JXBridgeBuilderClassVars<T>
    public let `func`: JXBridgeBuilderClassFuncs<T>
}

@dynamicMemberLookup
public struct JXBridgeBuilderClassVars<T> {
    let builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Var<T> {
        return Var(name: name, vars: self)
    }

    public struct Var<T> {
        let name: String
        let vars: JXBridgeBuilderClassVars<T>

        // builder.class.var.xxx { $0.xxx }
        @discardableResult public func callAsFunction<V>(_ getter: @escaping (T.Type) throws -> V) -> JXBridgeBuilder<T> {
            return self.callAsFunction(get: getter, set: nil)
        }

        // builder.class.var.xxx { $0.xxx ) setter: { ... }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T.Type) throws -> V, set setterFunc: ((T.Type, V) -> Void)?) -> JXBridgeBuilder<T> {
            let typeName = _typeName
            let name = self.name
            let getter: (Any, JXBridgeRegistry) throws -> Any? = { cls, registry in
                let target = cls as! T.Type
                let ret = try getterFunc(target)
                return try Converter.convertToScript(typeName: typeName, function: name, value: ret, registry: registry)
            }
            let setter: ((Any, Any?, JXBridgeRegistry) throws -> Any)?
            if let setterFunc {
                setter = { cls, value, registry in
                    let target = cls as! T.Type
                    let p0 = try Converter.convertFromScript(typeName: typeName, function: name, argument: value, index: 0, to: V.self, registry: registry)
                    setterFunc(target, p0)
                    return target
                }
            } else {
                setter = nil
            }
            return _add(PropertyBridge(typeName: typeName, name: name, getter: getter, setter: setter))
        }

        private var _typeName: String {
            return self.vars.builder.inProgressBridge.typeName
        }

        private func _add(_ propertyBridge: PropertyBridge) -> JXBridgeBuilder<T> {
            self.vars.builder.inProgressBridge.classProperties.append(propertyBridge)
            return self.vars.builder
        }
    }
}

@dynamicMemberLookup
public struct JXBridgeBuilderClassFuncs<T> {
    let builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Func {
        return Func(name: name, funcs: self)
    }

    public struct Func {
        let name: String
        let funcs: JXBridgeBuilderClassFuncs

        // builder.class.func.xxx { $0.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping (T.Type) throws -> R) -> JXBridgeBuilder<T> {
            let typeName = _typeName
            let name = self.name
            let function: (Any, [Any?], JXBridgeRegistry) throws -> (Any, Any?) = { obj, args, registry in
                let target = obj as! T.Type
                try validate(typeName: typeName, function: name, arguments: args, count: 0)
                let ret = try f(target)
                return (target, try Converter.convertToScript(typeName: typeName, function: name, value: ret, registry: registry))
            }
            return _add(FunctionBridge(typeName: typeName, name: name, function: function))
        }

        // builder.class.func.xxx { $0.xxx(p0: $1) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T.Type, P0) throws -> R) -> JXBridgeBuilder<T> {
            let typeName = _typeName
            let name = self.name
            let function: (Any, [Any?], JXBridgeRegistry) throws -> (Any, Any?) = { obj, args, registry in
                let target = obj as! T.Type
                try validate(typeName: typeName, function: name, arguments: args, count: 1)
                let p0 = try Converter.convertFromScript(typeName: typeName, function: name, argument: args[0], index: 0, to: P0.self, registry: registry)
                let ret = try f(target, p0)
                return (target, try Converter.convertToScript(typeName: typeName, function: name, value: ret, registry: registry))
            }
            return _add(FunctionBridge(typeName: typeName, name: name, function: function))
        }

        private var _typeName: String {
            return self.funcs.builder.inProgressBridge.typeName
        }

        private func _add(_ functionBridge: FunctionBridge) -> JXBridgeBuilder<T> {
            self.funcs.builder.inProgressBridge.classFunctions.append(functionBridge)
            return self.funcs.builder
        }
    }
}

private func validate(typeName: String, function: String, arguments: [Any?], count: Int) throws {
    if arguments.count != count {
        throw JXBridgeErrors.invalidArgumentCount(typeName, function)
    }
}
