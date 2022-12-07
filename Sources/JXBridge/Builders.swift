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

/*ARITY:FUNCTION
extension ConstructorBridge {
    // Type.init(p0:...)
    init<T${PARAM_COMMA}${PARAM_TYPES_LIST}>(_ cons: @escaping (${PARAM_LIST}) throws -> T) {
        self = ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: ${PARAM_COUNT}) { args, context in
            let ${PARAM_TUPLE} = try conveyParameters(args${PARAM_COMMA}${PARAM_CONVEY_TYPE_LIST})
            return try cons(${PARAM_TUPLE_LIST})
        }
    }
}
ARITY*/

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

/*ARITY:FUNCTION
extension StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(name: String, type: Any.Type, function: @escaping (${PARAM_LIST}) throws -> ${RETURN}) {
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: ${PARAM_COUNT})
            let ${PARAM_TUPLE} = try conveyParameters(args${PARAM_COMMA}${PARAM_CONVEY_TYPE_LIST})
            let r = try function(${PARAM_TUPLE_LIST})
            return try context.convey(${RETURN_CONVEY})
        }
    }
}
ARITY*/

/*ARITY:ASYNC_FUNCTION
extension StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(name: String, type: Any.Type, function: @escaping (${PARAM_LIST}) async throws -> ${RETURN}) {
        self = StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: ${PARAM_COUNT})
            let ${PARAM_TUPLE} = try conveyParameters(args${PARAM_COMMA}${PARAM_CONVEY_TYPE_LIST})
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(${PARAM_TUPLE_LIST})
                    try promise.resolveFunction.call(withArguments: [context.convey(${RETURN_CONVEY})])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}
ARITY*/

/*ARITY:PARAM_SUPPORT
func conveyParameters${PARAM_TYPES_DEC}(_ args: [JXValue]${PARAM_COMMA}${PARAM_ARGS_LIST}) throws -> (${PARAM_LIST}) {
    return ${PARAM_TRY}(${PARAM_ARGS_CONVEY_LIST})
}
ARITY*/
