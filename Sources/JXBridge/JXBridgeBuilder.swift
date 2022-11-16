#if canImport(ObjectiveC)
import Foundation
#endif
import JXKit

// TODO: Expand builder constructors, funcs to handle additional arguments.
// TODO: Expand builder to handle async funcs.

/// Build the bridge for scripting a native type.
public class JXBridgeBuilder<T> {
    /// Supply the type to bridge.
    public convenience init(type: T.Type, as typeName: String? = nil, namespace: JXNamespace = .default) {
        self.init(bridge: JXBridge(type: T.self, as: typeName, namespace: namespace))
    }
    
    /// Supply an instance to reflect on to find bridging properties using our property wrappers.
    public convenience init(reflecting instance: T, as typeName: String? = nil, namespace: JXNamespace = .default) {
        self.init(bridge: JXBridge(type: T.self, as: typeName, namespace: namespace))
        reflect(instance)
    }

    /// Supply an in-progress bridge to add to.
    public init(bridge: JXBridge) {
        self.bridge = bridge
    }

    /// The bridge being created.
    public var bridge: JXBridge

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

    /// Set the mapped superclass.
    @discardableResult public func superclass(_ superclass: Any.Type?) -> JXBridgeBuilder<T> {
        bridge.superclass = superclass
        return self
    }

    // builder.constructor { Type.init }
    @discardableResult public func constructor(_ cons: @escaping () -> () throws -> T) -> JXBridgeBuilder<T> {
        return constructor(cons())
    }

    // builder.constructor { Type() }
    @discardableResult public func constructor(_ cons: @escaping () throws -> T) -> JXBridgeBuilder<T> {
        let constructorBridge = ConstructorBridge(parameterCount: 0) { _, _ in
            return try cons()
        }
        return add(constructorBridge)
    }

    // builder.constructor { Type.init(p0:) }
    @discardableResult public func constructor<P0>(_ cons: @escaping () -> (P0) throws -> T) -> JXBridgeBuilder<T> {
        return constructor(cons())
    }

    // builder.constructor { Type(p0: $1) }
    @discardableResult public func constructor<P0>(_ cons: @escaping (P0) throws -> T) -> JXBridgeBuilder<T> {
        let constructorBridge = ConstructorBridge(parameterCount: 1) { args, context in
            let arg0 = try args[0].convey(to: P0.self)
            return try cons(arg0)
        }
        return add(constructorBridge)
    }

    private func add(_ constructorBridge: ConstructorBridge) -> JXBridgeBuilder<T> {
        bridge.constructors.append(constructorBridge)
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
            let getter: (Any, JXContext) throws -> JXValue = { obj, context in
                let ret = (obj as! T)[keyPath: keyPath]
                return try context.convey(ret)
            }
            let setter: ((Any, JXValue, JXContext) throws -> Any)?
            if let writeableKeyPath = keyPath as? WritableKeyPath<T, V> {
                setter = { obj, value, context in
                    var target = obj as! T
                    let p0 = try value.convey(to: V.self)
                    target[keyPath: writeableKeyPath] = p0
                    return target
                }
            } else {
                setter = nil
            }
            return add(PropertyBridge(name: name, getter: getter, setter: setter))
        }

        // builder.var.xxx { $0.xxx }
        @discardableResult public func callAsFunction<V>(_ getter: @escaping (T) throws -> V) -> JXBridgeBuilder<T> {
            return callAsFunction(get: getter, set: nil)
        }

        // builder.var.xxx { $0.xxx ) setter: { ... }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T) throws -> V, set setterFunc: ((T, V) -> Void)?) -> JXBridgeBuilder<T> {
            let name = self.name
            let getter: (Any, JXContext) throws -> JXValue = { obj, context in
                let target = obj as! T
                let ret = try getterFunc(target)
                return try context.convey(ret)
            }
            let setter: ((Any, JXValue, JXContext) throws -> Any)?
            if let setterFunc {
                setter = { obj, value, context in
                    let target = obj as! T
                    let p0 = try value.convey(to: V.self)
                    setterFunc(target, p0)
                    return target
                }
            } else {
                setter = nil
            }
            return add(PropertyBridge(name: name, getter: getter, setter: setter))
        }

        // builder.var.xxx { $0.xxx ) setter: { ... }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T) throws -> V, set setterFunc: @escaping (T, V) -> T) -> JXBridgeBuilder<T> {
            let name = self.name
            let getter: (Any, JXContext) throws -> JXValue = { obj, context in
                let target = obj as! T
                let ret = try getterFunc(target)
                return try context.convey(ret)
            }
            let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
                let target = obj as! T
                let p0 = try value.convey(to: V.self)
                let ret = setterFunc(target, p0)
                return ret
            }
            return add(PropertyBridge(name: name, getter: getter, setter: setter))
        }

        private var typeName: String {
            return vars.builder.bridge.typeName
        }

        private func add(_ propertyBridge: PropertyBridge) -> JXBridgeBuilder<T> {
            vars.builder.bridge.properties.append(propertyBridge)
            return vars.builder
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
            return add(FunctionBridge(name: name, function: f()))
        }

        // builder.func.xxx { $0.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping (T) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }

        // builder.func.xxx { Type.xxx(p0:) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (T) -> (P0) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }

        // builder.func.xxx { $0.xxx(p0: $1) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T, P0) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }

        private func add(_ functionBridge: FunctionBridge) -> JXBridgeBuilder<T> {
            funcs.builder.bridge.functions.append(functionBridge)
            return funcs.builder
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
            let typeName = self.typeName
            let name = self.name
            let function: (Any, [JXValue], JXContext) throws -> (Any, JXValue) = { obj, args, context in
                var target = obj as! T
                try validate(typeName: typeName, function: name, arguments: args, count: 0)
                let ret = try f(&target)
                let retjx = R.self == Void.self ? context.undefined() : try context.convey(ret)
                return (target, retjx)
            }
            return add(FunctionBridge(name: name, function: function))
        }

        // builder.mutating.func.xxx { $0.xxx(p0: $1) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (inout T, P0) throws -> R) -> JXBridgeBuilder<T> {
            let typeName = self.typeName
            let name = self.name
            let function: (Any, [JXValue], JXContext) throws -> (Any, JXValue) = { obj, args, context in
                var target = obj as! T
                try validate(typeName: typeName, function: name, arguments: args, count: 1)
                let p0 = try args[0].convey(to: P0.self)
                let ret = try f(&target, p0)
                let retjx = R.self == Void.self ? context.undefined() : try context.convey(ret)
                return (target, retjx)
            }
            return add(FunctionBridge(name: name, function: function))
        }

        private var typeName: String {
            return funcs.builder.bridge.typeName
        }

        private func add(_ functionBridge: FunctionBridge) -> JXBridgeBuilder<T> {
            funcs.builder.bridge.functions.append(functionBridge)
            return funcs.builder
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
            return callAsFunction(get: getterFunc, set: nil)
        }

        // builder.static.var.xxx { Type.xxx } setter: { ... }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping () throws -> V, set setterFunc: ((V) -> Void)?) -> JXBridgeBuilder<T> {
            let getter: (JXContext) throws -> JXValue = { context in
                return try context.convey(getterFunc())
            }
            let typeName = self.typeName
            let name = self.name
            let setter: ((JXValue, JXContext) throws -> Void)?
            if let setterFunc {
                setter = { value, context in
                    let p0 = try value.convey(to: V.self)
                    setterFunc(p0)
                }
            } else {
                setter = nil
            }
            return add(StaticPropertyBridge(owningTypeName: typeName, name: name, getter: getter, setter: setter))
        }

        private var typeName: String {
            return vars.builder.bridge.typeName
        }

        private func add(_ propertyBridge: StaticPropertyBridge) -> JXBridgeBuilder<T> {
            vars.builder.bridge.staticProperties.append(propertyBridge)
            return vars.builder
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
            return callAsFunction(staticFunc)
        }

        // builder.static.func.xxx { Type.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping () throws -> R) -> JXBridgeBuilder<T> {
            let typeName = self.typeName
            let name = self.name
            let functionBridge = StaticFunctionBridge(name: name) { args, context in
                try validate(typeName: typeName, function: name, arguments: args, count: 0)
                let ret = try f()
                return R.self == Void.self ? context.undefined() : try context.convey(ret)
            }
            return add(functionBridge)
        }

        // builder.static.func.xxx { Type.xxx(p0:) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (P0) throws -> R) -> JXBridgeBuilder<T> {
            let staticFunc = f()
            return callAsFunction(staticFunc)
        }

        // builder.static.func.xxx { Type.xxx(p0: $0) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (P0) throws -> R) -> JXBridgeBuilder<T> {
            let typeName = self.typeName
            let name = self.name
            let functionBridge = StaticFunctionBridge(name: name) { args, context in
                try validate(typeName: typeName, function: name, arguments: args, count: 1)
                let p0 = try args[0].convey(to: P0.self)
                let ret = try f(p0)
                return R.self == Void.self ? context.undefined() : try context.convey(ret)
            }
            return add(functionBridge)
        }

        private var typeName: String {
            return funcs.builder.bridge.typeName
        }

        private func add(_ functionBridge: StaticFunctionBridge) -> JXBridgeBuilder<T> {
            funcs.builder.bridge.staticFunctions.append(functionBridge)
            return funcs.builder
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
            return callAsFunction(get: getter, set: nil)
        }

        // builder.class.var.xxx { $0.xxx ) setter: { ... }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T.Type) throws -> V, set setterFunc: ((T.Type, V) -> Void)?) -> JXBridgeBuilder<T> {
            let name = self.name
            let getter: (Any, JXContext) throws -> JXValue = { cls, context in
                let target = cls as! T.Type
                let ret = try getterFunc(target)
                return try context.convey(ret)
            }
            let setter: ((Any, JXValue, JXContext) throws -> Any)?
            if let setterFunc {
                setter = { cls, value, context in
                    let target = cls as! T.Type
                    let p0 = try value.convey(to: V.self)
                    setterFunc(target, p0)
                    return target
                }
            } else {
                setter = nil
            }
            return add(PropertyBridge(name: name, getter: getter, setter: setter))
        }

        private var typeName: String {
            return vars.builder.bridge.typeName
        }

        private func add(_ propertyBridge: PropertyBridge) -> JXBridgeBuilder<T> {
            vars.builder.bridge.classProperties.append(propertyBridge)
            return vars.builder
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
            let typeName = self.typeName
            let name = self.name
            let function: (Any, [JXValue], JXContext) throws -> (Any, JXValue) = { obj, args, context in
                let target = obj as! T.Type
                try validate(typeName: typeName, function: name, arguments: args, count: 0)
                let ret = try f(target)
                let retjx = R.self == Void.self ? context.undefined() : try context.convey(ret)
                return (target, retjx)
            }
            return add(FunctionBridge(name: name, function: function))
        }

        // builder.class.func.xxx { $0.xxx(p0: $1) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T.Type, P0) throws -> R) -> JXBridgeBuilder<T> {
            let typeName = self.typeName
            let name = self.name
            let function: (Any, [JXValue], JXContext) throws -> (Any, JXValue) = { obj, args, context in
                let target = obj as! T.Type
                try validate(typeName: typeName, function: name, arguments: args, count: 1)
                let p0 = try args[0].convey(to: P0.self)
                let ret = try f(target, p0)
                let retjx = R.self == Void.self ? context.undefined() : try context.convey(ret)
                return (target, retjx)
            }
            return add(FunctionBridge(name: name, function: function))
        }

        private var typeName: String {
            return funcs.builder.bridge.typeName
        }

        private func add(_ functionBridge: FunctionBridge) -> JXBridgeBuilder<T> {
            funcs.builder.bridge.classFunctions.append(functionBridge)
            return funcs.builder
        }
    }
}

extension JXBridgeBuilder {
    private func reflect(_ instance: Any) {
        let builder = MirrorBuilder(Mirror(reflecting: instance), bridge: bridge)
        builder.addReflectedMembers()
        bridge = builder.bridge
    }
}

#if canImport(ObjectiveC)

extension JXBridgeBuilder where T: NSObject {
    func addObjectiveCPropertiesAndMethods() {
        let builder = ObjectiveCBuilder(T.self, bridge: bridge)
        builder.addObjectiveCPropertiesAndMethods()
        bridge = builder.bridge
    }
}

#endif
