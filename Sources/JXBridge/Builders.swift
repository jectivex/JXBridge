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
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
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
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
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
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
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
            let p = try conveyParameters(args, P0.self)
            return try cons(p)
        }
    }
    
    // Type.init(p0:p1:)
    init<T, P0, P1>(_ cons: @escaping (P0, P1) throws -> T) {
        self = ConstructorBridge(parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self)
            return try cons(p.0, p.1)
        }
    }
    
    // Type.init(p0:p1:p2:)
    init<T, P0, P1, P2>(_ cons: @escaping (P0, P1, P2) throws -> T) {
        self = ConstructorBridge(parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            return try cons(p.0, p.1, p.2)
        }
    }
    
    // Type.init(p0:p1:p2:p3:)
    init<T, P0, P1, P2, P3>(_ cons: @escaping (P0, P1, P2, P3) throws -> T) {
        self = ConstructorBridge(parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            return try cons(p.0, p.1, p.2, p.3)
        }
    }
    
    // Type.init(p0:p1:p2:p3:p4:)
    init<T, P0, P1, P2, P3, P4>(_ cons: @escaping (P0, P1, P2, P3, P4) throws -> T) {
        self = ConstructorBridge(parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            return try cons(p.0, p.1, p.2, p.3, p.4)
        }
    }
    
    // Type.init(p0:p1:p2:p3:p4:p5:)
    init<T, P0, P1, P2, P3, P4, P5>(_ cons: @escaping (P0, P1, P2, P3, P4, P5) throws -> T) {
        self = ConstructorBridge(parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5)
        }
    }
    
    // Type.init(p0:p1:p2:p3:p4:p5:p6:)
    init<T, P0, P1, P2, P3, P4, P5, P6>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> T) {
        self = ConstructorBridge(parameterCount: 7) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
        }
    }
    
    // Type.init(p0:p1:p2:p3:p4:p5:p6:p7:)
    init<T, P0, P1, P2, P3, P4, P5, P6, P7>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> T) {
        self = ConstructorBridge(parameterCount: 8) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
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
            return (target, try context.convey(ret))
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
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
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
            return (target, try context.convey(ret))
        }
    }
    
    // { $0.xxx() }
    init<T, R>(name: String, classFunction: @escaping (T.Type) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let ret = try classFunction(target)
            return (target, try context.convey(ret))
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
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
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
            let p = try conveyParameters(args, P0.self)
            let ret = try function(target, p)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1) }
    init<T, P0, R>(name: String, function: @escaping (T, P0) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(target, p)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
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
            let p = try conveyParameters(args, P0.self)
            let ret = try mutatingFunction(&target, p)
            return (target, try context.convey(ret))
        }
    }
    
    // { $0.xxx(p0: $1) }
    init<T, P0, R>(name: String, classFunction: @escaping (T.Type, P0) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let ret = try classFunction(target, p)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1) }
    init<T, P0, R>(name: String, classFunction: @escaping (T.Type, P0) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await classFunction(target, p)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
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
            let p = try conveyParameters(args, P0.self, P1.self)
            let ret = try function(target, p.0, p.1)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2) }
    init<T, P0, P1, R>(name: String, function: @escaping (T, P0, P1) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(target, p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
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
            let p = try conveyParameters(args, P0.self, P1.self)
            let ret = try mutatingFunction(&target, p.0, p.1)
            return (target, try context.convey(ret))
        }
    }
    
    // { $0.xxx(p0: $1, p1: $2) }
    init<T, P0, P1, R>(name: String, classFunction: @escaping (T.Type, P0, P1) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let ret = try classFunction(target, p.0, p.1)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2) }
    init<T, P0, P1, R>(name: String, classFunction: @escaping (T.Type, P0, P1) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await classFunction(target, p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
    
    // MARK: 3 parameters
    
    // Type.xxx(p0:p1:p2:)
    init<T, P0, P1, P2, R>(name: String, function: @escaping (T) -> (P0, P1, P2) throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // Type.xxx(p0:p1:p2:) async
    init<T, P0, P1, P2, R>(name: String, function: @escaping (T) -> (P0, P1, P2) async throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2)
        }
    }

    // { $0.xxx(p0: $1, p1: $2, p2: $3) }
    init<T, P0, P1, P2, R>(name: String, function: @escaping (T, P0, P1, P2) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let ret = try function(target, p.0, p.1, p.2)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2, p2: $3) }
    init<T, P0, P1, P2, R>(name: String, function: @escaping (T, P0, P1, P2) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(target, p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { $0.xxx(p0: $1, p1: $2, p2: $3) }
    init<T, P0, P1, P2, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            var target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let ret = try mutatingFunction(&target, p.0, p.1, p.2)
            return (target, try context.convey(ret))
        }
    }
    
    // { $0.xxx(p0: $1, p1: $2, p2: $3) }
    init<T, P0, P1, P2, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let ret = try classFunction(target, p.0, p.1, p.2)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2, p2: $3) }
    init<T, P0, P1, P2, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await classFunction(target, p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
    
    // MARK: 4 parameters
    
    // Type.xxx(p0:p1:p2:p3:)
    init<T, P0, P1, P2, P3, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3) throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // Type.xxx(p0:p1:p2:p3:) async
    init<T, P0, P1, P2, P3, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3) async throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3)
        }
    }

    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4) }
    init<T, P0, P1, P2, P3, R>(name: String, function: @escaping (T, P0, P1, P2, P3) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let ret = try function(target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4) }
    init<T, P0, P1, P2, P3, R>(name: String, function: @escaping (T, P0, P1, P2, P3) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(target, p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4) }
    init<T, P0, P1, P2, P3, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            var target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let ret = try mutatingFunction(&target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(ret))
        }
    }
    
    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4) }
    init<T, P0, P1, P2, P3, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let ret = try classFunction(target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4) }
    init<T, P0, P1, P2, P3, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await classFunction(target, p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
    
    // MARK: 5 parameters
    
    // Type.xxx(p0:p1:p2:p3:p4:)
    init<T, P0, P1, P2, P3, P4, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // Type.xxx(p0:p1:p2:p3:p4:) async
    init<T, P0, P1, P2, P3, P4, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4)
        }
    }

    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5) }
    init<T, P0, P1, P2, P3, P4, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let ret = try function(target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5) }
    init<T, P0, P1, P2, P3, P4, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(target, p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5) }
    init<T, P0, P1, P2, P3, P4, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            var target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let ret = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(ret))
        }
    }
    
    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5) }
    init<T, P0, P1, P2, P3, P4, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let ret = try classFunction(target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5) }
    init<T, P0, P1, P2, P3, P4, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await classFunction(target, p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
    
    // MARK: 6 parameters
    
    // Type.xxx(p0:p1:p2:p3:p4:p5:)
    init<T, P0, P1, P2, P3, P4, P5, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // Type.xxx(p0:p1:p2:p3:p4:p5:) async
    init<T, P0, P1, P2, P3, P4, P5, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5)
        }
    }

    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6) }
    init<T, P0, P1, P2, P3, P4, P5, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let ret = try function(target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6) }
    init<T, P0, P1, P2, P3, P4, P5, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6) }
    init<T, P0, P1, P2, P3, P4, P5, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            var target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let ret = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(ret))
        }
    }
    
    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6) }
    init<T, P0, P1, P2, P3, P4, P5, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let ret = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6) }
    init<T, P0, P1, P2, P3, P4, P5, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
    
    // MARK: 7 parameters
    
    // Type.xxx(p0:p1:p2:p3:p4:p5:p6:)
    init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // Type.xxx(p0:p1:p2:p3:p4:p5:p6:) async
    init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }

    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7) }
    init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let ret = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7) }
    init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7) }
    init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            var target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let ret = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(ret))
        }
    }
    
    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7) }
    init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let ret = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7) }
    init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
    
    // MARK: 8 parameters
    
    // Type.xxx(p0:p1:p2:p3:p4:p5:p6:p7:)
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // Type.xxx(p0:p1:p2:p3:p4:p5:p6:p7:) async
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }

    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7, p7: $8) }
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let ret = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7, p7: $8) }
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7, p7: $8) }
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            var target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let ret = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(ret))
        }
    }
    
    // { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7, p7: $8) }
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let ret = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(ret))
        }
    }
    
    // { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7, p7: $8) }
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        let typeName = String(describing: T.self)
        self = FunctionBridge(name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(typeName: typeName, function: name, arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
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
    
    // MARK: 0 paramters
    
    // { Type.xxx() }
    init<R>(name: String, type: Any.Type, function: @escaping () throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let ret = try function()
            return try context.convey(ret)
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
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
    
    // MARK: 1 parameter

    // { Type.xxx(p0: $0) }
    init<P0, R>(name: String, type: Any.Type, function: @escaping (P0) throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let ret = try function(p)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0) }
    init<P0, R>(name: String, type: Any.Type, function: @escaping (P0) async throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(p)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
    
    // MARK: 2 parameters
    
    // { Type.xxx(p0: $0, p1: $1) }
    init<P0, P1, R>(name: String, type: Any.Type, function: @escaping (P0, P1) throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let ret = try function(p.0, p.1)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1) }
    init<P0, P1, R>(name: String, type: Any.Type, function: @escaping (P0, P1) async throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
    
    // MARK: 3 parameters
    
    // { Type.xxx(p0: $0, p1: $1, p2: $2) }
    init<P0, P1, P2, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let ret = try function(p.0, p.1, p.2)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1, p2: $2) }
    init<P0, P1, P2, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) async throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
    
    // MARK: 4 parameters
    
    // { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3) }
    init<P0, P1, P2, P3, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let ret = try function(p.0, p.1, p.2, p.3)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3) }
    init<P0, P1, P2, P3, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) async throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
    
    // MARK: 5 parameters
    
    // { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4) }
    init<P0, P1, P2, P3, P4, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let ret = try function(p.0, p.1, p.2, p.3, p.4)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4) }
    init<P0, P1, P2, P3, P4, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) async throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
    
    // MARK: 6 parameters
    
    // { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5) }
    init<P0, P1, P2, P3, P4, P5, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let ret = try function(p.0, p.1, p.2, p.3, p.4, p.5)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5) }
    init<P0, P1, P2, P3, P4, P5, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) async throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
    
    // MARK: 7 parameters
    
    // { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5, p6: $6) }
    init<P0, P1, P2, P3, P4, P5, P6, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let ret = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5, p6: $6) }
    init<P0, P1, P2, P3, P4, P5, P6, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
    
    // MARK: 8 parameters
    
    // { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5, p6: $6, p7: $7) }
    init<P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let ret = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5, p6: $6, p7: $7) }
    init<P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        let typeName = String(describing: type)
        self = StaticFunctionBridge(name: name) { args, context in
            try validate(typeName: typeName, function: name, arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let ret = try await function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
                    try promise.resolveFunction.call(withArguments: [context.convey(ret)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}

func conveyParameters<P0>(_ args: [JXValue], _ p0: P0.Type) throws -> (P0) {
    return try (args[0].convey(to: p0))
}

func conveyParameters<P0, P1>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type) throws -> (P0, P1) {
    return try (args[0].convey(to: p0),
                args[1].convey(to: p1))
}

func conveyParameters<P0, P1, P2>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type, _ p2: P2.Type) throws -> (P0, P1, P2) {
    return try (args[0].convey(to: p0),
                args[1].convey(to: p1),
                args[2].convey(to: p2))
}

func conveyParameters<P0, P1, P2, P3>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type, _ p2: P2.Type, _ p3: P3.Type) throws -> (P0, P1, P2, P3) {
    return try (args[0].convey(to: p0),
                args[1].convey(to: p1),
                args[2].convey(to: p2),
                args[3].convey(to: p3))
}

func conveyParameters<P0, P1, P2, P3, P4>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type, _ p2: P2.Type, _ p3: P3.Type, _ p4: P4.Type) throws -> (P0, P1, P2, P3, P4) {
    return try (args[0].convey(to: p0),
                args[1].convey(to: p1),
                args[2].convey(to: p2),
                args[3].convey(to: p3),
                args[4].convey(to: p4))
}

func conveyParameters<P0, P1, P2, P3, P4, P5>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type, _ p2: P2.Type, _ p3: P3.Type, _ p4: P4.Type, _ p5: P5.Type) throws -> (P0, P1, P2, P3, P4, P5) {
    return try (args[0].convey(to: p0),
                args[1].convey(to: p1),
                args[2].convey(to: p2),
                args[3].convey(to: p3),
                args[4].convey(to: p4),
                args[5].convey(to: p5))
}

func conveyParameters<P0, P1, P2, P3, P4, P5, P6>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type, _ p2: P2.Type, _ p3: P3.Type, _ p4: P4.Type, _ p5: P5.Type, _ p6: P6.Type) throws -> (P0, P1, P2, P3, P4, P5, P6) {
    return try (args[0].convey(to: p0),
                args[1].convey(to: p1),
                args[2].convey(to: p2),
                args[3].convey(to: p3),
                args[4].convey(to: p4),
                args[5].convey(to: p5),
                args[6].convey(to: p6))
}

func conveyParameters<P0, P1, P2, P3, P4, P5, P6, P7>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type, _ p2: P2.Type, _ p3: P3.Type, _ p4: P4.Type, _ p5: P5.Type, _ p6: P6.Type, _ p7: P7.Type) throws -> (P0, P1, P2, P3, P4, P5, P6, P7) {
    return try (args[0].convey(to: p0),
                args[1].convey(to: p1),
                args[2].convey(to: p2),
                args[3].convey(to: p3),
                args[4].convey(to: p4),
                args[5].convey(to: p5),
                args[6].convey(to: p6),
                args[7].convey(to: p7))
}
