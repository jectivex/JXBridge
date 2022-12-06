import JXKit

/// Throw an  error if the user attempts to pass the wrong number of arguments to a function.
func validate(arguments: [Any?], count: Int) throws {
    if arguments.count != count {
        throw JXError(message: "Expected \(count) arguments. Received \(arguments.count)")
    }
}

/*ARITY:PROPERTY
extension PropertyBridge {
    // \Type.var
    init<T, ${VALUE_TYPES}>(name: String, keyPath: KeyPath<T, ${VALUE}>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(${VALUE_CONVEY})
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, ${VALUE}> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: ${VALUE_CONVEY_TYPE})
                target[keyPath: writeableKeyPath] = ${VALUE_FROMCONVEYED}
                return target
            }
        } else {
            setter = nil
        }
        self = PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    init<T, ${VALUE_TYPES}>(name: String, getter getterFunc: @escaping (T) throws -> ${VALUE}, setter setterFunc: ((T, ${VALUE}) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(${VALUE_CONVEY})
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: ${VALUE_CONVEY_TYPE})
                setterFunc(target, ${VALUE_FROMCONVEYED})
                return target
            }
        } else {
            setter = nil
        }
        self = PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    init<T, ${VALUE_TYPES}>(name: String, getter getterFunc: @escaping (T) throws -> ${VALUE}, setter setterFunc: @escaping (T, ${VALUE}) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(${VALUE_CONVEY})
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: ${VALUE_CONVEY_TYPE})
            let ret = setterFunc(target, ${VALUE_FROMCONVEYED})
            return ret
        }
        self = PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    init<T, ${VALUE_TYPES}>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> ${VALUE}, setter setterFunc: ((T.Type, ${VALUE}) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(${VALUE_CONVEY})
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: ${VALUE_CONVEY_TYPE})
                setterFunc(target, ${VALUE_FROMCONVEYED})
                return target
            }
        } else {
            setter = nil
        }
        self = PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}
ARITY*/

/*ARITY:ASYNC_PROPERTY
extension PropertyBridge {
    // { await $0.xxx }
    init<T, ${VALUE_TYPES}>(name: String, getter getterFunc: @escaping (T) async throws -> ${VALUE}) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(${VALUE_CONVEY})])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: nil)
    }
    
    // { await $0.xxx )
    init<T, ${VALUE_TYPES}>(name: String, classGetter getterFunc: @escaping (T.Type) async throws -> ${VALUE}) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T.Type
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(${VALUE_CONVEY})])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: nil)
    }
}
ARITY*/

/*ARITY:PROPERTY
extension StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    init<${VALUE_TYPES}>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> ${VALUE}, setter setterFunc: ((${VALUE}) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(${VALUE_CONVEY})
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: ${VALUE_CONVEY_TYPE})
                setterFunc(${VALUE_FROMCONVEYED})
            }
        } else {
            setter = nil
        }
        self = StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}
ARITY*/

/*ARITY:ASYNC_PROPERTY
extension StaticPropertyBridge {
    // { await Type.xxx )
    init<${VALUE_TYPES}>(name: String, type: Any.Type, getter getterFunc: @escaping () async throws -> ${VALUE}) {
        let getter: (JXContext) throws -> JXValue = { context in
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc()
                    try promise.resolveFunction.call(withArguments: [context.convey(${VALUE_CONVEY})])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: nil)
    }
}
ARITY*/

extension ConstructorBridge {
    // Type.init
    init<T>(_ cons: @escaping () throws -> T) {
        self = ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 0) { _, _ in
            return try cons()
        }
    }

    // Type.init(p0:)
    init<T, P0>(_ cons: @escaping (P0) throws -> T) {
        self = ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 1) { args, context in
            let p = try conveyParameters(args, P0.self)
            return try cons(p)
        }
    }
    
    // Type.init(p0:p1:)
    init<T, P0, P1>(_ cons: @escaping (P0, P1) throws -> T) {
        self = ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self)
            return try cons(p.0, p.1)
        }
    }
    
    // Type.init(p0:p1:p2:)
    init<T, P0, P1, P2>(_ cons: @escaping (P0, P1, P2) throws -> T) {
        self = ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            return try cons(p.0, p.1, p.2)
        }
    }
    
    // Type.init(p0:p1:p2:p3:)
    init<T, P0, P1, P2, P3>(_ cons: @escaping (P0, P1, P2, P3) throws -> T) {
        self = ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            return try cons(p.0, p.1, p.2, p.3)
        }
    }
    
    // Type.init(p0:p1:p2:p3:p4:)
    init<T, P0, P1, P2, P3, P4>(_ cons: @escaping (P0, P1, P2, P3, P4) throws -> T) {
        self = ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            return try cons(p.0, p.1, p.2, p.3, p.4)
        }
    }
    
    // Type.init(p0:p1:p2:p3:p4:p5:)
    init<T, P0, P1, P2, P3, P4, P5>(_ cons: @escaping (P0, P1, P2, P3, P4, P5) throws -> T) {
        self = ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5)
        }
    }
    
    // Type.init(p0:p1:p2:p3:p4:p5:p6:)
    init<T, P0, P1, P2, P3, P4, P5, P6>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> T) {
        self = ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 7) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
        }
    }
    
    // Type.init(p0:p1:p2:p3:p4:p5:p6:p7:)
    init<T, P0, P1, P2, P3, P4, P5, P6, P7>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> T) {
        self = ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 8) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
        }
    }
}

/*ARITY:FUNCTION
extension FunctionBridge {
    // Type.xxx(p0:...)
    init<T, ${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(name: String, function: @escaping (T) -> (${PARAM_LIST}) throws -> ${RETURN}) {
        self = FunctionBridge(name: name) { (obj: T${PARAM_COMMA}${PARAM_LABELED_LIST}) throws -> ${RETURN} in
            let callFunc = function(obj)
            return try callFunc(${PARAM_LABEL_LIST})
        }
    }
    
    // { $0.xxx(p0: $1...) }
    init<T, ${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(name: String, function: @escaping (T${PARAM_COMMA}${PARAM_LIST}) throws -> ${RETURN}) {
        self = FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: ${PARAM_COUNT})
            let ${PARAM_TUPLE} = try conveyParameters(args${PARAM_COMMA}${PARAM_CONVEY_TYPE_LIST})
            let r = try function(target${PARAM_COMMA}${PARAM_TUPLE_LIST})
            return (target, try context.convey(${RETURN_CONVEY}))
        }
    }

    // { $0.xxx(p0: $1...) }
    init<T, ${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(name: String, mutatingFunction: @escaping (inout T${PARAM_COMMA}${PARAM_LIST}) throws -> ${RETURN}) {
        self = FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: ${PARAM_COUNT})
            let ${PARAM_TUPLE} = try conveyParameters(args${PARAM_COMMA}${PARAM_CONVEY_TYPE_LIST})
            let r = try mutatingFunction(&target${PARAM_COMMA}${PARAM_TUPLE_LIST})
            return (target, try context.convey(${RETURN_CONVEY}))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    init<T, ${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(name: String, classFunction: @escaping (T.Type${PARAM_COMMA}${PARAM_LIST}) throws -> ${RETURN}) {
        self = FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: ${PARAM_COUNT})
            let ${PARAM_TUPLE} = try conveyParameters(args${PARAM_COMMA}${PARAM_CONVEY_TYPE_LIST})
            let r = try classFunction(target${PARAM_COMMA}${PARAM_TUPLE_LIST})
            return (target, try context.convey(${RETURN_CONVEY}))
        }
    }
}
ARITY*/

/*ARITY:ASYNC_FUNCTION
extension FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, ${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(name: String, function: @escaping (T) -> (${PARAM_LIST}) async throws -> ${RETURN}) {
        self = FunctionBridge(name: name) { (obj: T${PARAM_COMMA}${PARAM_LABELED_LIST}) async throws -> ${RETURN} in
            let callFunc = function(obj)
            return try await callFunc(${PARAM_LABEL_LIST})
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, ${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(name: String, function: @escaping (T${PARAM_COMMA}${PARAM_LIST}) async throws -> ${RETURN}) {
        self = FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: ${PARAM_COUNT})
            let ${PARAM_TUPLE} = try conveyParameters(args${PARAM_COMMA}${PARAM_CONVEY_TYPE_LIST})
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target${PARAM_COMMA}${PARAM_TUPLE_LIST})
                    try promise.resolveFunction.call(withArguments: [context.convey(${RETURN_CONVEY})])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, ${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(name: String, classFunction: @escaping (T.Type${PARAM_COMMA}${PARAM_LIST}) async throws -> ${RETURN}) {
        self = FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: ${PARAM_COUNT})
            let ${PARAM_TUPLE} = try conveyParameters(args${PARAM_COMMA}${PARAM_CONVEY_TYPE_LIST})
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target${PARAM_COMMA}${PARAM_TUPLE_LIST})
                    try promise.resolveFunction.call(withArguments: [context.convey(${RETURN_CONVEY})])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}
ARITY*/

extension StaticFunctionBridge {
    
    // MARK: 0 paramters
    
    // { Type.xxx() }
    init<R>(name: String, type: Any.Type, function: @escaping () throws -> R) {
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 0)
            let ret = try function()
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx() }
    init<R>(name: String, type: Any.Type, function: @escaping () async throws -> R) {
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 0)
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
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let ret = try function(p)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0) }
    init<P0, R>(name: String, type: Any.Type, function: @escaping (P0) async throws -> R) {
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 1)
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
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let ret = try function(p.0, p.1)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1) }
    init<P0, P1, R>(name: String, type: Any.Type, function: @escaping (P0, P1) async throws -> R) {
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 2)
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
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let ret = try function(p.0, p.1, p.2)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1, p2: $2) }
    init<P0, P1, P2, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) async throws -> R) {
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 3)
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
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let ret = try function(p.0, p.1, p.2, p.3)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3) }
    init<P0, P1, P2, P3, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) async throws -> R) {
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 4)
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
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let ret = try function(p.0, p.1, p.2, p.3, p.4)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4) }
    init<P0, P1, P2, P3, P4, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) async throws -> R) {
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 5)
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
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let ret = try function(p.0, p.1, p.2, p.3, p.4, p.5)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5) }
    init<P0, P1, P2, P3, P4, P5, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) async throws -> R) {
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 6)
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
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let ret = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5, p6: $6) }
    init<P0, P1, P2, P3, P4, P5, P6, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
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
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let ret = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return try context.convey(ret)
        }
    }
    
    // { await Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5, p6: $6, p7: $7) }
    init<P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
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

func conveyParameters(_ args: [JXValue]) throws -> () {
    return ()
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
