// THIS FILE IS AUTO GENERATED FROM Builders.swift. DO NOT EDIT
//
//		swift package plugin generate-arity Builders.swift
//			-maximumFunctionParameters 6
//			-maximumTupleArity 2
//			-optionalTuples 0
//			-propertyTuples 0
//			-returnTuples 1
//			-returnTuplesWhenTrailingClosures 0
//			-maximumJXTupleArity 6
//			-maximumClosureParameters 1
//			-maximumThrowingClosureParameters -1
//			-optionalClosures 1
//			-propertyClosures 0
//			-trailingClosures 1
//			-asyncMemberClosures 0
//			-maximumJXClosureParameters 6
//			-beyondDefaults 0

import JXKit

// PROPERTY

extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, V>(name: String, keyPath: KeyPath<T, V>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(v)
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, V> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: V.self)
                target[keyPath: writeableKeyPath] = v
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, V>(name: String, getter getterFunc: @escaping (T) throws -> V, setter setterFunc: ((T, V) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(v)
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: V.self)
                setterFunc(target, v)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, V>(name: String, getter getterFunc: @escaping (T) throws -> V, setter setterFunc: @escaping (T, V) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(v)
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: V.self)
            let ret = setterFunc(target, v)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, V>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> V, setter setterFunc: ((T.Type, V) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(v)
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: V.self)
                setterFunc(target, v)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    public init<V>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> V, setter setterFunc: ((V) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(v)
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: V.self)
                setterFunc(v)
            }
        } else {
            setter = nil
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}

// ASYNC_PROPERTY

extension JXBridge.PropertyBridge {
    // { await $0.xxx }
    public init<T, V>(name: String, getter getterFunc: @escaping (T) async throws -> V) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(v)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: nil)
    }
    
    // { await $0.xxx )
    public init<T, V>(name: String, classGetter getterFunc: @escaping (T.Type) async throws -> V) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T.Type
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(v)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: nil)
    }
}


extension JXBridge.StaticPropertyBridge {
    // { await Type.xxx )
    public init<V>(name: String, type: Any.Type, getter getterFunc: @escaping () async throws -> V) {
        let getter: (JXContext) throws -> JXValue = { context in
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc()
                    try promise.resolveFunction.call(withArguments: [context.convey(v)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: nil)
    }
}

// INIT

extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T>(_ cons: @escaping () throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 0) { args, context in
            let _ = try conveyParameters(args)
            return try cons()
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0>(_ cons: @escaping (P0) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 1) { args, context in
            let p = try conveyParameters(args, P0.self)
            return try cons(p)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, CR>(_ cons: @escaping ((() -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 1) { args, context in
            let p = try conveyParameters(args, JXClosure.Arity0<CR>.self)
            return try cons(p.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, CR>(_ cons: @escaping ((() -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 1) { args, context in
            let p = try conveyParameters(args, Optional<JXClosure.Arity0<CR>>.self)
            return try cons(p?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, C0, CR>(_ cons: @escaping (((C0) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 1) { args, context in
            let p = try conveyParameters(args, JXClosure.Arity1<C0, CR>.self)
            return try cons(p.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, C0, CR>(_ cons: @escaping (((C0) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 1) { args, context in
            let p = try conveyParameters(args, Optional<JXClosure.Arity1<C0, CR>>.self)
            return try cons(p?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1>(_ cons: @escaping (P0, P1) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self)
            return try cons(p.0, p.1)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, CR>(_ cons: @escaping (P0, (() -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, JXClosure.Arity0<CR>.self)
            return try cons(p.0, p.1.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, CR>(_ cons: @escaping (P0, (() -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity0<CR>>.self)
            return try cons(p.0, p.1?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, C0, CR>(_ cons: @escaping (P0, ((C0) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, JXClosure.Arity1<C0, CR>.self)
            return try cons(p.0, p.1.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, C0, CR>(_ cons: @escaping (P0, ((C0) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            return try cons(p.0, p.1?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2>(_ cons: @escaping (P0, P1, P2) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            return try cons(p.0, p.1, p.2)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, CR>(_ cons: @escaping (P0, P1, (() -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity0<CR>.self)
            return try cons(p.0, p.1, p.2.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, CR>(_ cons: @escaping (P0, P1, (() -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity0<CR>>.self)
            return try cons(p.0, p.1, p.2?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, C0, CR>(_ cons: @escaping (P0, P1, ((C0) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity1<C0, CR>.self)
            return try cons(p.0, p.1, p.2.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, C0, CR>(_ cons: @escaping (P0, P1, ((C0) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            return try cons(p.0, p.1, p.2?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3>(_ cons: @escaping (P0, P1, P2, P3) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            return try cons(p.0, p.1, p.2, p.3)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, CR>(_ cons: @escaping (P0, P1, P2, (() -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity0<CR>.self)
            return try cons(p.0, p.1, p.2, p.3.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, CR>(_ cons: @escaping (P0, P1, P2, (() -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity0<CR>>.self)
            return try cons(p.0, p.1, p.2, p.3?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, C0, CR>(_ cons: @escaping (P0, P1, P2, ((C0) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity1<C0, CR>.self)
            return try cons(p.0, p.1, p.2, p.3.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, C0, CR>(_ cons: @escaping (P0, P1, P2, ((C0) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4>(_ cons: @escaping (P0, P1, P2, P3, P4) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            return try cons(p.0, p.1, p.2, p.3, p.4)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, CR>(_ cons: @escaping (P0, P1, P2, P3, (() -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity0<CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, CR>(_ cons: @escaping (P0, P1, P2, P3, (() -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity0<CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, ((C0) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity1<C0, CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, ((C0) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5>(_ cons: @escaping (P0, P1, P2, P3, P4, P5) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, (() -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity0<CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, (() -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity0<CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity1<C0, CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5?.closure)
        }
    }
}

// FUNCTION

extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, R>(name: String, function: @escaping (T) -> () throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T) throws -> R in
            let callFunc = function(obj)
            return try callFunc()
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, R>(name: String, function: @escaping (T) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 0) { obj, args, context in
            let target = obj as! T
            let _ = try conveyParameters(args)
            let r = try function(target)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, R>(name: String, mutatingFunction: @escaping (inout T) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 0) { obj, args, context in
            var target = obj as! T
            let _ = try conveyParameters(args)
            let r = try mutatingFunction(&target)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, R>(name: String, classFunction: @escaping (T.Type) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 0) { obj, args, context in
            let target = obj as! T.Type
            let _ = try conveyParameters(args)
            let r = try classFunction(target)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, U0, U1>(name: String, function: @escaping (T) -> () throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T) throws -> (U0, U1) in
            let callFunc = function(obj)
            return try callFunc()
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, U0, U1>(name: String, function: @escaping (T) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 0) { obj, args, context in
            let target = obj as! T
            let _ = try conveyParameters(args)
            let r = try function(target)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, U0, U1>(name: String, mutatingFunction: @escaping (inout T) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 0) { obj, args, context in
            var target = obj as! T
            let _ = try conveyParameters(args)
            let r = try mutatingFunction(&target)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, U0, U1>(name: String, classFunction: @escaping (T.Type) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 0) { obj, args, context in
            let target = obj as! T.Type
            let _ = try conveyParameters(args)
            let r = try classFunction(target)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, R>(name: String, function: @escaping (T) -> (P0) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, R>(name: String, function: @escaping (T, P0) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self)
            let r = try function(target, p)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, R>(name: String, mutatingFunction: @escaping (inout T, P0) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self)
            let r = try mutatingFunction(&target, p)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, R>(name: String, classFunction: @escaping (T.Type, P0) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self)
            let r = try classFunction(target, p)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, U0, U1>(name: String, function: @escaping (T) -> (P0) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0) throws -> (U0, U1) in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, U0, U1>(name: String, function: @escaping (T, P0) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self)
            let r = try function(target, p)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self)
            let r = try mutatingFunction(&target, p)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, U0, U1>(name: String, classFunction: @escaping (T.Type, P0) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self)
            let r = try classFunction(target, p)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, CR, R>(name: String, function: @escaping (T) -> ((() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: (() -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, CR, R>(name: String, function: @escaping (T, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, JXClosure.Arity0<CR>.self)
            let r = try function(target, p.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, CR, R>(name: String, mutatingFunction: @escaping (inout T, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, JXClosure.Arity0<CR>.self)
            let r = try mutatingFunction(&target, p.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, CR, R>(name: String, classFunction: @escaping (T.Type, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, JXClosure.Arity0<CR>.self)
            let r = try classFunction(target, p.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, CR, R>(name: String, function: @escaping (T) -> ((() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: (() -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, CR, R>(name: String, function: @escaping (T, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(target, p?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, CR, R>(name: String, mutatingFunction: @escaping (inout T, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, Optional<JXClosure.Arity0<CR>>.self)
            let r = try mutatingFunction(&target, p?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, CR, R>(name: String, classFunction: @escaping (T.Type, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, Optional<JXClosure.Arity0<CR>>.self)
            let r = try classFunction(target, p?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, C0, CR, R>(name: String, function: @escaping (T) -> (((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: ((C0) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, C0, CR, R>(name: String, function: @escaping (T, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, JXClosure.Arity1<C0, CR>.self)
            let r = try function(target, p.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, JXClosure.Arity1<C0, CR>.self)
            let r = try mutatingFunction(&target, p.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, C0, CR, R>(name: String, classFunction: @escaping (T.Type, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, JXClosure.Arity1<C0, CR>.self)
            let r = try classFunction(target, p.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, C0, CR, R>(name: String, function: @escaping (T) -> (((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: ((C0) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, C0, CR, R>(name: String, function: @escaping (T, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(target, p?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try mutatingFunction(&target, p?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, C0, CR, R>(name: String, classFunction: @escaping (T.Type, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try classFunction(target, p?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, R>(name: String, function: @escaping (T) -> (P0, P1) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, R>(name: String, function: @escaping (T, P0, P1) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try function(target, p.0, p.1)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try mutatingFunction(&target, p.0, p.1)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, R>(name: String, classFunction: @escaping (T.Type, P0, P1) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try classFunction(target, p.0, p.1)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, U0, U1>(name: String, function: @escaping (T) -> (P0, P1) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1) throws -> (U0, U1) in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, U0, U1>(name: String, function: @escaping (T, P0, P1) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try function(target, p.0, p.1)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try mutatingFunction(&target, p.0, p.1)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try classFunction(target, p.0, p.1)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, CR, R>(name: String, function: @escaping (T) -> (P0, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: (() -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, CR, R>(name: String, function: @escaping (T, P0, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, JXClosure.Arity0<CR>.self)
            let r = try function(target, p.0, p.1.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, JXClosure.Arity0<CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, JXClosure.Arity0<CR>.self)
            let r = try classFunction(target, p.0, p.1.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, CR, R>(name: String, function: @escaping (T) -> (P0, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: (() -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, CR, R>(name: String, function: @escaping (T, P0, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(target, p.0, p.1?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try classFunction(target, p.0, p.1?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, C0, CR, R>(name: String, function: @escaping (T) -> (P0, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: ((C0) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, CR, R>(name: String, function: @escaping (T, P0, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(target, p.0, p.1.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, JXClosure.Arity1<C0, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, JXClosure.Arity1<C0, CR>.self)
            let r = try classFunction(target, p.0, p.1.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, C0, CR, R>(name: String, function: @escaping (T) -> (P0, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: ((C0) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, CR, R>(name: String, function: @escaping (T, P0, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(target, p.0, p.1?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try classFunction(target, p.0, p.1?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, R>(name: String, function: @escaping (T) -> (P0, P1, P2) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, R>(name: String, function: @escaping (T, P0, P1, P2) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try function(target, p.0, p.1, p.2)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try classFunction(target, p.0, p.1, p.2)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2) throws -> (U0, U1) in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, U0, U1>(name: String, function: @escaping (T, P0, P1, P2) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try function(target, p.0, p.1, p.2)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try classFunction(target, p.0, p.1, p.2)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: (() -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, CR, R>(name: String, function: @escaping (T, P0, P1, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity0<CR>.self)
            let r = try function(target, p.0, p.1, p.2.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity0<CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity0<CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: (() -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, CR, R>(name: String, function: @escaping (T, P0, P1, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(target, p.0, p.1, p.2?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, C0, CR, R>(name: String, function: @escaping (T) -> (P0, P1, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: ((C0) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, CR, R>(name: String, function: @escaping (T, P0, P1, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(target, p.0, p.1, p.2.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity1<C0, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity1<C0, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, C0, CR, R>(name: String, function: @escaping (T) -> (P0, P1, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: ((C0) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, CR, R>(name: String, function: @escaping (T, P0, P1, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(target, p.0, p.1, p.2?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, R>(name: String, function: @escaping (T, P0, P1, P2, P3) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try function(target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3) throws -> (U0, U1) in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try function(target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: (() -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, CR, R>(name: String, function: @escaping (T, P0, P1, P2, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity0<CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity0<CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity0<CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: (() -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, CR, R>(name: String, function: @escaping (T, P0, P1, P2, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, C0, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: ((C0) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, CR, R>(name: String, function: @escaping (T, P0, P1, P2, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity1<C0, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity1<C0, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, C0, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: ((C0) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, CR, R>(name: String, function: @escaping (T, P0, P1, P2, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4) throws -> (U0, U1) in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: (() -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity0<CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity0<CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity0<CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: (() -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, C0, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: ((C0) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity1<C0, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity1<C0, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, C0, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: ((C0) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5) throws -> (U0, U1) in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: (() -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity0<CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity0<CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity0<CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: (() -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: ((C0) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity1<C0, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity1<C0, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: ((C0) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            var target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<R>(name: String, type: Any.Type, function: @escaping () throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 0) { args, context in
            let _ = try conveyParameters(args)
            let r = try function()
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<U0, U1>(name: String, type: Any.Type, function: @escaping () throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 0) { args, context in
            let _ = try conveyParameters(args)
            let r = try function()
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, R>(name: String, type: Any.Type, function: @escaping (P0) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 1) { args, context in
            let p = try conveyParameters(args, P0.self)
            let r = try function(p)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, U0, U1>(name: String, type: Any.Type, function: @escaping (P0) throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 1) { args, context in
            let p = try conveyParameters(args, P0.self)
            let r = try function(p)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<CR, R>(name: String, type: Any.Type, function: @escaping ((() -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 1) { args, context in
            let p = try conveyParameters(args, JXClosure.Arity0<CR>.self)
            let r = try function(p.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<CR, R>(name: String, type: Any.Type, function: @escaping ((() -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 1) { args, context in
            let p = try conveyParameters(args, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(p?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<C0, CR, R>(name: String, type: Any.Type, function: @escaping (((C0) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 1) { args, context in
            let p = try conveyParameters(args, JXClosure.Arity1<C0, CR>.self)
            let r = try function(p.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<C0, CR, R>(name: String, type: Any.Type, function: @escaping (((C0) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 1) { args, context in
            let p = try conveyParameters(args, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(p?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, R>(name: String, type: Any.Type, function: @escaping (P0, P1) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try function(p.0, p.1)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1) throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try function(p.0, p.1)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, (() -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, JXClosure.Arity0<CR>.self)
            let r = try function(p.0, p.1.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, (() -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(p.0, p.1?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, ((C0) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(p.0, p.1.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(p.0, p.1?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try function(p.0, p.1, p.2)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try function(p.0, p.1, p.2)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, (() -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity0<CR>.self)
            let r = try function(p.0, p.1, p.2.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, (() -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(p.0, p.1, p.2?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, ((C0) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(p.0, p.1, p.2.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(p.0, p.1, p.2?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try function(p.0, p.1, p.2, p.3)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try function(p.0, p.1, p.2, p.3)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, (() -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity0<CR>.self)
            let r = try function(p.0, p.1, p.2, p.3.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, (() -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, ((C0) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, (() -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity0<CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, (() -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, ((C0) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, (() -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity0<CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return try context.convey(r)
        }
    }
}

// ASYNC_FUNCTION

extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, R>(name: String, function: @escaping (T) -> () async throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc()
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, R>(name: String, function: @escaping (T) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 0) { obj, args, context in
            let target = obj as! T
            let _ = try conveyParameters(args)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, R>(name: String, classFunction: @escaping (T.Type) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 0) { obj, args, context in
            let target = obj as! T.Type
            let _ = try conveyParameters(args)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, U0, U1>(name: String, function: @escaping (T) -> () async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T) async throws -> (U0, U1) in
            let callFunc = function(obj)
            return try await callFunc()
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, U0, U1>(name: String, function: @escaping (T) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 0) { obj, args, context in
            let target = obj as! T
            let _ = try conveyParameters(args)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, U0, U1>(name: String, classFunction: @escaping (T.Type) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 0) { obj, args, context in
            let target = obj as! T.Type
            let _ = try conveyParameters(args)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, R>(name: String, function: @escaping (T) -> (P0) async throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, R>(name: String, function: @escaping (T, P0) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, R>(name: String, classFunction: @escaping (T.Type, P0) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, U0, U1>(name: String, function: @escaping (T) -> (P0) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0) async throws -> (U0, U1) in
            let callFunc = function(obj)
            return try await callFunc(p0)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, U0, U1>(name: String, function: @escaping (T, P0) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, U0, U1>(name: String, classFunction: @escaping (T.Type, P0) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 1) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, P1, R>(name: String, function: @escaping (T) -> (P0, P1) async throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, R>(name: String, function: @escaping (T, P0, P1) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, R>(name: String, classFunction: @escaping (T.Type, P0, P1) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, P1, U0, U1>(name: String, function: @escaping (T) -> (P0, P1) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1) async throws -> (U0, U1) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, U0, U1>(name: String, function: @escaping (T, P0, P1) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 2) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, P1, P2, R>(name: String, function: @escaping (T) -> (P0, P1, P2) async throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, R>(name: String, function: @escaping (T, P0, P1, P2) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, P1, P2, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2) async throws -> (U0, U1) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, U0, U1>(name: String, function: @escaping (T, P0, P1, P2) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 3) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, P1, P2, P3, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3) async throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, R>(name: String, function: @escaping (T, P0, P1, P2, P3) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, P1, P2, P3, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3) async throws -> (U0, U1) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 4) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, P1, P2, P3, P4, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4) async throws -> (U0, U1) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 5) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, P1, P2, P3, P4, P5, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5) async throws -> (U0, U1) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name, parameterCount: 6) { obj, args, context in
            let target = obj as! T.Type
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<R>(name: String, type: Any.Type, function: @escaping () async throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 0) { args, context in
            let _ = try conveyParameters(args)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function()
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<U0, U1>(name: String, type: Any.Type, function: @escaping () async throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 0) { args, context in
            let _ = try conveyParameters(args)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function()
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, R>(name: String, type: Any.Type, function: @escaping (P0) async throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 1) { args, context in
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, U0, U1>(name: String, type: Any.Type, function: @escaping (P0) async throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 1) { args, context in
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, P1, R>(name: String, type: Any.Type, function: @escaping (P0, P1) async throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, P1, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1) async throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, P1, P2, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) async throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, P1, P2, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) async throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) async throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) async throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) async throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) async throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) async throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(r)])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name, parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}

// PARAM_SUPPORT

public func conveyParameters(_ args: [JXValue]) throws -> () {
    return ()
}


public func conveyParameters<P0>(_ args: [JXValue], _ p0: P0.Type) throws -> (P0) {
    return try (args[0].convey(to: p0))
}


public func conveyParameters<P0, P1>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type) throws -> (P0, P1) {
    return try (args[0].convey(to: p0), args[1].convey(to: p1))
}


public func conveyParameters<P0, P1, P2>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type, _ p2: P2.Type) throws -> (P0, P1, P2) {
    return try (args[0].convey(to: p0), args[1].convey(to: p1), args[2].convey(to: p2))
}


public func conveyParameters<P0, P1, P2, P3>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type, _ p2: P2.Type, _ p3: P3.Type) throws -> (P0, P1, P2, P3) {
    return try (args[0].convey(to: p0), args[1].convey(to: p1), args[2].convey(to: p2), args[3].convey(to: p3))
}


public func conveyParameters<P0, P1, P2, P3, P4>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type, _ p2: P2.Type, _ p3: P3.Type, _ p4: P4.Type) throws -> (P0, P1, P2, P3, P4) {
    return try (args[0].convey(to: p0), args[1].convey(to: p1), args[2].convey(to: p2), args[3].convey(to: p3), args[4].convey(to: p4))
}


public func conveyParameters<P0, P1, P2, P3, P4, P5>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type, _ p2: P2.Type, _ p3: P3.Type, _ p4: P4.Type, _ p5: P5.Type) throws -> (P0, P1, P2, P3, P4, P5) {
    return try (args[0].convey(to: p0), args[1].convey(to: p1), args[2].convey(to: p2), args[3].convey(to: p3), args[4].convey(to: p4), args[5].convey(to: p5))
}
