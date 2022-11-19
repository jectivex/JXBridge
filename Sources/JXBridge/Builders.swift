import JXKit

/// Throw an informative error if the user attempts to pass the wrong number of arguments to a function.
func validate(typeName: String, function: String, arguments: [Any?], count: Int) throws {
    if arguments.count != count {
        throw JXBridgeErrors.invalidArgumentCount(typeName, function)
    }
}

extension PropertyBridge {
    // \Type.var
    init<T, V>(name: String, keyPath: KeyPath<T, V>) {
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
        self = PropertyBridge(name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... }
    init<T, V>(name: String, getter getterFunc: @escaping (T) throws -> V, setter setterFunc: ((T, V) -> Void)?) {
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
        self = PropertyBridge(name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... }
    init<T, V>(name: String, getter getterFunc: @escaping (T) throws -> V, setter setterFunc: @escaping (T, V) -> T) {
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
        self = PropertyBridge(name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... }
    init<T, V>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> V, setter setterFunc: ((T.Type, V) -> Void)?) {
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
        self = PropertyBridge(name: name, getter: getter, setter: setter)
    }
    
    // { await $0.xxx )
    init<T, V>(name: String, getter getterFunc: @escaping (T) async throws -> V) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await getterFunc(target)
                    let retjx = try context.convey(ret)
                    try promise.resolveFunction.call(withArguments: [retjx])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return  JXValue(context: context, value: promise.promise)
        }
        self = PropertyBridge(name: name, getter: getter, setter: nil)
    }
    
    // { await $0.xxx )
    init<T, V>(name: String, classGetter getterFunc: @escaping (T.Type) async throws -> V) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T.Type
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await getterFunc(target)
                    let retjx = try context.convey(ret)
                    try promise.resolveFunction.call(withArguments: [retjx])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return  JXValue(context: context, value: promise.promise)
        }
        self = PropertyBridge(name: name, getter: getter, setter: nil)
    }
}

extension StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    init<V>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> V, setter setterFunc: ((V) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            return try context.convey(getterFunc())
        }
        let typeName = String(describing: type)
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let p0 = try value.convey(to: V.self)
                setterFunc(p0)
            }
        } else {
            setter = nil
        }
        self = StaticPropertyBridge(owningTypeName: typeName, name: name, getter: getter, setter: setter)
    }
    
    // { await Type.xxx )
    init<V>(name: String, type: Any.Type, getter getterFunc: @escaping () async throws -> V) {
        let getter: (JXContext) throws -> JXValue = { context in
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await getterFunc()
                    let retjx = try context.convey(ret)
                    try promise.resolveFunction.call(withArguments: [retjx])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return  JXValue(context: context, value: promise.promise)
        }
        self = StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: nil)
    }
}

extension ConstructorBridge {
    // Type.init
    init<T>(_ cons: @escaping () throws -> T) {
        self = ConstructorBridge(parameterCount: 0) { _, _ in
            return try cons()
        }
    }

    // Type.init(p0:)
    init<T, P0>(_ cons: @escaping (P0) throws -> T) {
        self = ConstructorBridge(parameterCount: 1) { args, context in
            let arg0 = try args[0].convey(to: P0.self)
            return try cons(arg0)
        }
    }
    
    // Type.init(p0:p1:)
    init<T, P0, P1>(_ cons: @escaping (P0, P1) throws -> T) {
        self = ConstructorBridge(parameterCount: 2) { args, context in
            let arg0 = try args[0].convey(to: P0.self)
            let arg1 = try args[1].convey(to: P1.self)
            return try cons(arg0, arg1)
        }
    }
    
    // Type.init(p0:p1:p2)
    init<T, P0, P1, P2>(_ cons: @escaping (P0, P1, P2) throws -> T) {
        self = ConstructorBridge(parameterCount: 2) { args, context in
            let arg0 = try args[0].convey(to: P0.self)
            let arg1 = try args[1].convey(to: P1.self)
            let arg2 = try args[2].convey(to: P2.self)
            return try cons(arg0, arg1, arg2)
        }
    }
}

extension FunctionBridge {
    // Type.xxx
    init<T, R>(name: String, function: @escaping (T) -> () throws -> R) {
        self = FunctionBridge(name: name) { (obj: T) throws -> R in
            let callFunc = function(obj)
            return try callFunc()
        }
    }
    
    // Type.xxx
    init<T, R>(name: String, function: @escaping (T) -> () async throws -> R) {
        self = FunctionBridge(name: name) { (obj: T) throws -> R in
            let callFunc = function(obj)
            return try await callFunc()
        }
    }
    
    // { $0.xxx() }
    init<T, R>(name: String, mutatingFunction: @escaping (inout T) throws -> R) {
        let typeName = String(describing: T.self)
        let bridgeFunction: (Any, [JXValue], JXContext) throws -> (Any, JXValue) = { obj, args, context in
            var target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let ret = try mutatingFunction(&target)
            let retjx = R.self == Void.self ? context.undefined() : try context.convey(ret)
            return (target, retjx)
        }
        self = FunctionBridge(name: name, function: bridgeFunction)
    }
    
    // { await $0.xxx() }
    init<T, R>(name: String, function: @escaping (T) async throws -> R) {
        let typeName = String(describing: T.self)
        let bridgeFunction: (Any, [JXValue], JXContext) throws -> (Any, JXValue) = { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(target)
                    let retjx = R.self == Void.self ? context.undefined() : try context.convey(ret)
                    try promise.resolveFunction.call(withArguments: [retjx])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
        self = FunctionBridge(name: name, function: bridgeFunction)
    }
    
    // { $0.xxx() }
    init<T, R>(name: String, classFunction: @escaping (T.Type) throws -> R) {
        let typeName = String(describing: T.self)
        let bridgeFunction: (Any, [JXValue], JXContext) throws -> (Any, JXValue) = { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let ret = try classFunction(target)
            let retjx = R.self == Void.self ? context.undefined() : try context.convey(ret)
            return (target, retjx)
        }
        self = FunctionBridge(name: name, function: bridgeFunction)
    }

    // Type.xxx(p0:)
    init<T, P0, R>(name: String, function: @escaping (T) -> (P0) throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }

    // { $0.xxx(p0: $1) }
    init<T, P0, R>(name: String, function: @escaping (T, P0) throws -> R) {
        let typeName = String(describing: T.self)
        let bridgeFunction: (Any, [JXValue], JXContext) throws -> (Any, JXValue) = { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let ret = try function(target, p0)
            let retjx = R.self == Void.self ? context.undefined() : try context.convey(ret)
            return (target, retjx)
        }
        self = FunctionBridge(name: name, function: bridgeFunction)
    }

    // { $0.xxx(p0: $1) }
    init<T, P0, R>(name: String, mutatingFunction: @escaping (inout T, P0) throws -> R) {
        let typeName = String(describing: T.self)
        let bridgeFunction: (Any, [JXValue], JXContext) throws -> (Any, JXValue) = { obj, args, context in
            var target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let ret = try mutatingFunction(&target, p0)
            let retjx = R.self == Void.self ? context.undefined() : try context.convey(ret)
            return (target, retjx)
        }
        self = FunctionBridge(name: name, function: bridgeFunction)
    }
    
    // { $0.xxx(p0: $1) }
    init<T, P0, R>(name: String, classFunction: @escaping (T.Type, P0) throws -> R) {
        let typeName = String(describing: T.self)
        let bridgeFunction: (Any, [JXValue], JXContext) throws -> (Any, JXValue) = { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let ret = try classFunction(target, p0)
            let retjx = R.self == Void.self ? context.undefined() : try context.convey(ret)
            return (target, retjx)
        }
        self = FunctionBridge(name: name, function: bridgeFunction)
    }
}

extension StaticFunctionBridge {
    // { Type.xxx() }
    init<R>(name: String, type: Any.Type, function: @escaping () throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let ret = try function()
            return R.self == Void.self ? context.undefined() : try context.convey(ret)
        }
    }

    // { Type.xxx(p0: $0) }
    init<P0, R>(name: String, type: Any.Type, function: @escaping (P0) throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let ret = try function(p0)
            return R.self == Void.self ? context.undefined() : try context.convey(ret)
        }
    }
}
