import JXKit

/// Throw an informative error if the user attempts to pass the wrong number of arguments to a function.
func validate(typeName: String, function: String, arguments: [Any?], count: Int) throws {
    if arguments.count != count {
        throw JXBridgeErrors.invalidArgumentCount(typeName, function)
    }
}

extension JXContext {
    fileprivate func conveyReturn<R>(_ ret: R) throws -> JXValue {
        return try R.self == Void.self ? undefined() : convey(ret)
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
    
    // get: { $0.xxx ) set: { ... } // struct
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
    
    // { await $0.xxx }
    init<T, V>(name: String, getter getterFunc: @escaping (T) async throws -> V) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.conveyReturn(ret)])
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
                    try promise.resolveFunction.call(withArguments: [context.conveyReturn(ret)])
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
                    try promise.resolveFunction.call(withArguments: [context.conveyReturn(ret)])
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
    
    // NOTE: Due to technical limitations, we do not support async mutable functions.
    
    // MARK: 0 parameters
    
    // Type.xxx
    init<T, R>(name: String, function: @escaping (T) -> () throws -> R) {
        self = FunctionBridge(name: name) { (obj: T) throws -> R in
            let callFunc = function(obj)
            return try callFunc()
        }
    }
    
    // Type.xxx async
    init<T, R>(name: String, function: @escaping (T) -> () async throws -> R) {
        self = FunctionBridge(name: name) { (obj: T) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc()
        }
    }
    
    // { $0.xxx() }
    init<T, R>(name: String, function: @escaping (T) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let ret = try function(target)
            return (target, try context.conveyReturn(ret))
        }
    }
    
    // { await $0.xxx() }
    init<T, R>(name: String, function: @escaping (T) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(target)
                    try promise.resolveFunction.call(withArguments: [context.conveyReturn(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
    
    // { $0.xxx() }
    init<T, R>(name: String, mutatingFunction: @escaping (inout T) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            var target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let ret = try mutatingFunction(&target)
            return (target, try context.conveyReturn(ret))
        }
    }
    
    // { $0.xxx() }
    init<T, R>(name: String, classFunction: @escaping (T.Type) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let ret = try classFunction(target)
            return (target, try context.conveyReturn(ret))
        }
    }
    
    // { await $0.xxx() }
    init<T, R>(name: String, classFunction: @escaping (T.Type) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await classFunction(target)
                    try promise.resolveFunction.call(withArguments: [context.conveyReturn(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
    
    // MARK: 1 parameter

    // Type.xxx(p0:)
    init<T, P0, R>(name: String, function: @escaping (T) -> (P0) throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // Type.xxx(p0:) async
    init<T, P0, R>(name: String, function: @escaping (T) -> (P0) async throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0)
        }
    }

    // { $0.xxx(p0: $1) }
    init<T, P0, R>(name: String, function: @escaping (T, P0) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let ret = try function(target, p0)
            return (target, try context.conveyReturn(ret))
        }
    }
    
    // { await $0.xxx(p0: $1) }
    init<T, P0, R>(name: String, function: @escaping (T, P0) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(target, p0)
                    try promise.resolveFunction.call(withArguments: [context.conveyReturn(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { $0.xxx(p0: $1) }
    init<T, P0, R>(name: String, mutatingFunction: @escaping (inout T, P0) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            var target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let ret = try mutatingFunction(&target, p0)
            return (target, try context.conveyReturn(ret))
        }
    }
    
    // { $0.xxx(p0: $1) }
    init<T, P0, R>(name: String, classFunction: @escaping (T.Type, P0) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let ret = try classFunction(target, p0)
            return (target, try context.conveyReturn(ret))
        }
    }
    
    // { await $0.xxx(p0: $1) }
    init<T, P0, R>(name: String, classFunction: @escaping (T.Type, P0) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await classFunction(target, p0)
                    try promise.resolveFunction.call(withArguments: [context.conveyReturn(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
    
    // MARK: 2 parameters

    // Type.xxx(p0:p1:)
    init<T, P0, P1, R>(name: String, function: @escaping (T) -> (P0, P1) throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // Type.xxx(p0:p1:) async
    init<T, P0, P1, R>(name: String, function: @escaping (T) -> (P0, P1) async throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1)
        }
    }

    // { $0.xxx(p0: $1, p1: $2) }
    init<T, P0, P1, R>(name: String, function: @escaping (T, P0, P1) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 2)
            let p0 = try args[0].convey(to: P0.self)
            let p1 = try args[1].convey(to: P1.self)
            let ret = try function(target, p0, p1)
            return (target, try context.conveyReturn(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2) }
    init<T, P0, P1, R>(name: String, function: @escaping (T, P0, P1) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 2)
            let p0 = try args[0].convey(to: P0.self)
            let p1 = try args[1].convey(to: P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(target, p0, p1)
                    try promise.resolveFunction.call(withArguments: [context.conveyReturn(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { $0.xxx(p0: $1, p1: $2) }
    init<T, P0, P1, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            var target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 2)
            let p0 = try args[0].convey(to: P0.self)
            let p1 = try args[1].convey(to: P1.self)
            let ret = try mutatingFunction(&target, p0, p1)
            return (target, try context.conveyReturn(ret))
        }
    }
    
    // { $0.xxx(p0: $1, p1: $2) }
    init<T, P0, P1, R>(name: String, classFunction: @escaping (T.Type, P0, P1) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 2)
            let p0 = try args[0].convey(to: P0.self)
            let p1 = try args[1].convey(to: P1.self)
            let ret = try classFunction(target, p0, p1)
            return (target, try context.conveyReturn(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2) }
    init<T, P0, P1, R>(name: String, classFunction: @escaping (T.Type, P0, P1) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 2)
            let p0 = try args[0].convey(to: P0.self)
            let p1 = try args[1].convey(to: P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await classFunction(target, p0, p1)
                    try promise.resolveFunction.call(withArguments: [context.conveyReturn(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}

extension StaticFunctionBridge {
    // { Type.xxx() }
    init<R>(name: String, type: Any.Type, function: @escaping () throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let ret = try function()
            return try context.conveyReturn(ret)
        }
    }
    
    // { await Type.xxx() }
    init<R>(name: String, type: Any.Type, function: @escaping () async throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function()
                    try promise.resolveFunction.call(withArguments: [context.conveyReturn(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }

    // { Type.xxx(p0: $0) }
    init<P0, R>(name: String, type: Any.Type, function: @escaping (P0) throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let ret = try function(p0)
            return try context.conveyReturn(ret)
        }
    }
    
    // { await Type.xxx(p0: $0) }
    init<P0, R>(name: String, type: Any.Type, function: @escaping (P0) async throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(p0)
                    try promise.resolveFunction.call(withArguments: [context.conveyReturn(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
    
    // { Type.xxx(p0: $0, p1: $1) }
    init<P0, P1, R>(name: String, type: Any.Type, function: @escaping (P0, P1) throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let p1 = try args[1].convey(to: P1.self)
            let ret = try function(p0, p1)
            return try context.conveyReturn(ret)
        }
    }
    
    // { await Type.xxx(p0: $1) }
    init<P0, P1, R>(name: String, type: Any.Type, function: @escaping (P0, P1) async throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 2)
            let p0 = try args[0].convey(to: P0.self)
            let p1 = try args[1].convey(to: P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(p0, p1)
                    try promise.resolveFunction.call(withArguments: [context.conveyReturn(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}
