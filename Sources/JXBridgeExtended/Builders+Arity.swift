// THIS FILE IS AUTO GENERATED FROM Builders.swift. DO NOT EDIT
//
//		swift package plugin generate-arity Builders.swift
//			-maximumFunctionParameters 8
//			-maximumTupleArity 3
//			-optionalTuples 1
//			-propertyTuples 1
//			-returnTuples 1
//			-returnTuplesWhenTrailingClosures 0
//			-maximumJXTupleArity 6
//			-maximumClosureParameters 3
//			-maximumThrowingClosureParameters -1
//			-optionalClosures 1
//			-propertyClosures 1
//			-trailingClosures 1
//			-asyncMemberClosures 0
//			-maximumJXClosureParameters 6
//			-beyondDefaults 1

import JXBridge
import JXKit

// PROPERTY

extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, U0, U1>(name: String, keyPath: KeyPath<T, (U0, U1)>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(JXTuple.Arity2(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, (U0, U1)> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: JXTuple.Arity2<U0, U1>.self)
                target[keyPath: writeableKeyPath] = v.tuple
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, U0, U1>(name: String, getter getterFunc: @escaping (T) throws -> (U0, U1), setter setterFunc: ((T, (U0, U1)) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXTuple.Arity2(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: JXTuple.Arity2<U0, U1>.self)
                setterFunc(target, v.tuple)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, U0, U1>(name: String, getter getterFunc: @escaping (T) throws -> (U0, U1), setter setterFunc: @escaping (T, (U0, U1)) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXTuple.Arity2(v))
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: JXTuple.Arity2<U0, U1>.self)
            let ret = setterFunc(target, v.tuple)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, U0, U1>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> (U0, U1), setter setterFunc: ((T.Type, (U0, U1)) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(JXTuple.Arity2(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: JXTuple.Arity2<U0, U1>.self)
                setterFunc(target, v.tuple)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, U0, U1>(name: String, keyPath: KeyPath<T, (U0, U1)?>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(JXTuple.Arity2(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, (U0, U1)?> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: Optional<JXTuple.Arity2<U0, U1>>.self)
                target[keyPath: writeableKeyPath] = v?.tuple
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, U0, U1>(name: String, getter getterFunc: @escaping (T) throws -> (U0, U1)?, setter setterFunc: ((T, (U0, U1)?) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXTuple.Arity2(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: Optional<JXTuple.Arity2<U0, U1>>.self)
                setterFunc(target, v?.tuple)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, U0, U1>(name: String, getter getterFunc: @escaping (T) throws -> (U0, U1)?, setter setterFunc: @escaping (T, (U0, U1)?) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXTuple.Arity2(v))
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: Optional<JXTuple.Arity2<U0, U1>>.self)
            let ret = setterFunc(target, v?.tuple)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, U0, U1>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> (U0, U1)?, setter setterFunc: ((T.Type, (U0, U1)?) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(JXTuple.Arity2(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: Optional<JXTuple.Arity2<U0, U1>>.self)
                setterFunc(target, v?.tuple)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, U0, U1, U2>(name: String, keyPath: KeyPath<T, (U0, U1, U2)>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(JXTuple.Arity3(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, (U0, U1, U2)> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: JXTuple.Arity3<U0, U1, U2>.self)
                target[keyPath: writeableKeyPath] = v.tuple
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, U0, U1, U2>(name: String, getter getterFunc: @escaping (T) throws -> (U0, U1, U2), setter setterFunc: ((T, (U0, U1, U2)) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXTuple.Arity3(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: JXTuple.Arity3<U0, U1, U2>.self)
                setterFunc(target, v.tuple)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, U0, U1, U2>(name: String, getter getterFunc: @escaping (T) throws -> (U0, U1, U2), setter setterFunc: @escaping (T, (U0, U1, U2)) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXTuple.Arity3(v))
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: JXTuple.Arity3<U0, U1, U2>.self)
            let ret = setterFunc(target, v.tuple)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, U0, U1, U2>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> (U0, U1, U2), setter setterFunc: ((T.Type, (U0, U1, U2)) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(JXTuple.Arity3(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: JXTuple.Arity3<U0, U1, U2>.self)
                setterFunc(target, v.tuple)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, U0, U1, U2>(name: String, keyPath: KeyPath<T, (U0, U1, U2)?>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(JXTuple.Arity3(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, (U0, U1, U2)?> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: Optional<JXTuple.Arity3<U0, U1, U2>>.self)
                target[keyPath: writeableKeyPath] = v?.tuple
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, U0, U1, U2>(name: String, getter getterFunc: @escaping (T) throws -> (U0, U1, U2)?, setter setterFunc: ((T, (U0, U1, U2)?) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXTuple.Arity3(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: Optional<JXTuple.Arity3<U0, U1, U2>>.self)
                setterFunc(target, v?.tuple)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, U0, U1, U2>(name: String, getter getterFunc: @escaping (T) throws -> (U0, U1, U2)?, setter setterFunc: @escaping (T, (U0, U1, U2)?) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXTuple.Arity3(v))
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: Optional<JXTuple.Arity3<U0, U1, U2>>.self)
            let ret = setterFunc(target, v?.tuple)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, U0, U1, U2>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> (U0, U1, U2)?, setter setterFunc: ((T.Type, (U0, U1, U2)?) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(JXTuple.Arity3(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: Optional<JXTuple.Arity3<U0, U1, U2>>.self)
                setterFunc(target, v?.tuple)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, CR>(name: String, keyPath: KeyPath<T, (() -> CR)>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(JXClosure.Arity0(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, (() -> CR)> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: JXClosure.Arity0<CR>.self)
                target[keyPath: writeableKeyPath] = v.closure
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, CR>(name: String, getter getterFunc: @escaping (T) throws -> (() -> CR), setter setterFunc: ((T, (() -> CR)) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity0(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: JXClosure.Arity0<CR>.self)
                setterFunc(target, v.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, CR>(name: String, getter getterFunc: @escaping (T) throws -> (() -> CR), setter setterFunc: @escaping (T, (() -> CR)) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity0(v))
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: JXClosure.Arity0<CR>.self)
            let ret = setterFunc(target, v.closure)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, CR>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> (() -> CR), setter setterFunc: ((T.Type, (() -> CR)) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity0(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: JXClosure.Arity0<CR>.self)
                setterFunc(target, v.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, CR>(name: String, keyPath: KeyPath<T, (() -> CR)?>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(JXClosure.Arity0(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, (() -> CR)?> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: Optional<JXClosure.Arity0<CR>>.self)
                target[keyPath: writeableKeyPath] = v?.closure
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, CR>(name: String, getter getterFunc: @escaping (T) throws -> (() -> CR)?, setter setterFunc: ((T, (() -> CR)?) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity0(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: Optional<JXClosure.Arity0<CR>>.self)
                setterFunc(target, v?.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, CR>(name: String, getter getterFunc: @escaping (T) throws -> (() -> CR)?, setter setterFunc: @escaping (T, (() -> CR)?) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity0(v))
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: Optional<JXClosure.Arity0<CR>>.self)
            let ret = setterFunc(target, v?.closure)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, CR>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> (() -> CR)?, setter setterFunc: ((T.Type, (() -> CR)?) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity0(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: Optional<JXClosure.Arity0<CR>>.self)
                setterFunc(target, v?.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, C0, CR>(name: String, keyPath: KeyPath<T, ((C0) -> CR)>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(JXClosure.Arity1(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, ((C0) -> CR)> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: JXClosure.Arity1<C0, CR>.self)
                target[keyPath: writeableKeyPath] = v.closure
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, C0, CR>(name: String, getter getterFunc: @escaping (T) throws -> ((C0) -> CR), setter setterFunc: ((T, ((C0) -> CR)) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity1(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: JXClosure.Arity1<C0, CR>.self)
                setterFunc(target, v.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, C0, CR>(name: String, getter getterFunc: @escaping (T) throws -> ((C0) -> CR), setter setterFunc: @escaping (T, ((C0) -> CR)) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity1(v))
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: JXClosure.Arity1<C0, CR>.self)
            let ret = setterFunc(target, v.closure)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, C0, CR>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> ((C0) -> CR), setter setterFunc: ((T.Type, ((C0) -> CR)) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity1(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: JXClosure.Arity1<C0, CR>.self)
                setterFunc(target, v.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, C0, CR>(name: String, keyPath: KeyPath<T, ((C0) -> CR)?>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(JXClosure.Arity1(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, ((C0) -> CR)?> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: Optional<JXClosure.Arity1<C0, CR>>.self)
                target[keyPath: writeableKeyPath] = v?.closure
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, C0, CR>(name: String, getter getterFunc: @escaping (T) throws -> ((C0) -> CR)?, setter setterFunc: ((T, ((C0) -> CR)?) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity1(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: Optional<JXClosure.Arity1<C0, CR>>.self)
                setterFunc(target, v?.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, C0, CR>(name: String, getter getterFunc: @escaping (T) throws -> ((C0) -> CR)?, setter setterFunc: @escaping (T, ((C0) -> CR)?) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity1(v))
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: Optional<JXClosure.Arity1<C0, CR>>.self)
            let ret = setterFunc(target, v?.closure)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, C0, CR>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> ((C0) -> CR)?, setter setterFunc: ((T.Type, ((C0) -> CR)?) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity1(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: Optional<JXClosure.Arity1<C0, CR>>.self)
                setterFunc(target, v?.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, C0, C1, CR>(name: String, keyPath: KeyPath<T, ((C0, C1) -> CR)>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(JXClosure.Arity2(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, ((C0, C1) -> CR)> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: JXClosure.Arity2<C0, C1, CR>.self)
                target[keyPath: writeableKeyPath] = v.closure
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, C0, C1, CR>(name: String, getter getterFunc: @escaping (T) throws -> ((C0, C1) -> CR), setter setterFunc: ((T, ((C0, C1) -> CR)) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity2(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: JXClosure.Arity2<C0, C1, CR>.self)
                setterFunc(target, v.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, C0, C1, CR>(name: String, getter getterFunc: @escaping (T) throws -> ((C0, C1) -> CR), setter setterFunc: @escaping (T, ((C0, C1) -> CR)) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity2(v))
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: JXClosure.Arity2<C0, C1, CR>.self)
            let ret = setterFunc(target, v.closure)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, C0, C1, CR>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> ((C0, C1) -> CR), setter setterFunc: ((T.Type, ((C0, C1) -> CR)) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity2(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: JXClosure.Arity2<C0, C1, CR>.self)
                setterFunc(target, v.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, C0, C1, CR>(name: String, keyPath: KeyPath<T, ((C0, C1) -> CR)?>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(JXClosure.Arity2(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, ((C0, C1) -> CR)?> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: Optional<JXClosure.Arity2<C0, C1, CR>>.self)
                target[keyPath: writeableKeyPath] = v?.closure
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, C0, C1, CR>(name: String, getter getterFunc: @escaping (T) throws -> ((C0, C1) -> CR)?, setter setterFunc: ((T, ((C0, C1) -> CR)?) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity2(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: Optional<JXClosure.Arity2<C0, C1, CR>>.self)
                setterFunc(target, v?.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, C0, C1, CR>(name: String, getter getterFunc: @escaping (T) throws -> ((C0, C1) -> CR)?, setter setterFunc: @escaping (T, ((C0, C1) -> CR)?) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity2(v))
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let ret = setterFunc(target, v?.closure)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, C0, C1, CR>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> ((C0, C1) -> CR)?, setter setterFunc: ((T.Type, ((C0, C1) -> CR)?) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity2(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: Optional<JXClosure.Arity2<C0, C1, CR>>.self)
                setterFunc(target, v?.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, C0, C1, C2, CR>(name: String, keyPath: KeyPath<T, ((C0, C1, C2) -> CR)>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(JXClosure.Arity3(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, ((C0, C1, C2) -> CR)> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: JXClosure.Arity3<C0, C1, C2, CR>.self)
                target[keyPath: writeableKeyPath] = v.closure
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, C0, C1, C2, CR>(name: String, getter getterFunc: @escaping (T) throws -> ((C0, C1, C2) -> CR), setter setterFunc: ((T, ((C0, C1, C2) -> CR)) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity3(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: JXClosure.Arity3<C0, C1, C2, CR>.self)
                setterFunc(target, v.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, C0, C1, C2, CR>(name: String, getter getterFunc: @escaping (T) throws -> ((C0, C1, C2) -> CR), setter setterFunc: @escaping (T, ((C0, C1, C2) -> CR)) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity3(v))
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: JXClosure.Arity3<C0, C1, C2, CR>.self)
            let ret = setterFunc(target, v.closure)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, C0, C1, C2, CR>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> ((C0, C1, C2) -> CR), setter setterFunc: ((T.Type, ((C0, C1, C2) -> CR)) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity3(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: JXClosure.Arity3<C0, C1, C2, CR>.self)
                setterFunc(target, v.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.PropertyBridge {
    // \Type.var
    public init<T, C0, C1, C2, CR>(name: String, keyPath: KeyPath<T, ((C0, C1, C2) -> CR)?>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let v = (obj as! T)[keyPath: keyPath]
            return try context.convey(JXClosure.Arity3(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, ((C0, C1, C2) -> CR)?> {
            setter = { obj, value, context in
                var target = obj as! T
                let v = try value.convey(to: Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
                target[keyPath: writeableKeyPath] = v?.closure
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }

    // get: { $0.xxx ) set: { ... }
    public init<T, C0, C1, C2, CR>(name: String, getter getterFunc: @escaping (T) throws -> ((C0, C1, C2) -> CR)?, setter setterFunc: ((T, ((C0, C1, C2) -> CR)?) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity3(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { obj, value, context in
                let target = obj as! T
                let v = try value.convey(to: Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
                setterFunc(target, v?.closure)
                return target
            }
        } else {
            setter = nil
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
    
    // get: { $0.xxx ) set: { ... } // struct
    public init<T, C0, C1, C2, CR>(name: String, getter getterFunc: @escaping (T) throws -> ((C0, C1, C2) -> CR)?, setter setterFunc: @escaping (T, ((C0, C1, C2) -> CR)?) -> T) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity3(v))
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            let target = obj as! T
            let v = try value.convey(to: Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let ret = setterFunc(target, v?.closure)
            return ret
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: setter)
    }
 
    // get: { $0.xxx ) set: { ... }
    public init<T, C0, C1, C2, CR>(name: String, classGetter getterFunc: @escaping (T.Type) throws -> ((C0, C1, C2) -> CR)?, setter setterFunc: ((T.Type, ((C0, C1, C2) -> CR)?) -> Void)?) {
        let getter: (Any, JXContext) throws -> JXValue = { cls, context in
            let target = cls as! T.Type
            let v = try getterFunc(target)
            return try context.convey(JXClosure.Arity3(v))
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let setterFunc {
            setter = { cls, value, context in
                let target = cls as! T.Type
                let v = try value.convey(to: Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
                setterFunc(target, v?.closure)
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
    public init<U0, U1>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> (U0, U1), setter setterFunc: (((U0, U1)) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(JXTuple.Arity2(v))
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: JXTuple.Arity2<U0, U1>.self)
                setterFunc(v.tuple)
            }
        } else {
            setter = nil
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    public init<U0, U1>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> (U0, U1)?, setter setterFunc: (((U0, U1)?) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(JXTuple.Arity2(v))
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: Optional<JXTuple.Arity2<U0, U1>>.self)
                setterFunc(v?.tuple)
            }
        } else {
            setter = nil
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    public init<U0, U1, U2>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> (U0, U1, U2), setter setterFunc: (((U0, U1, U2)) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(JXTuple.Arity3(v))
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: JXTuple.Arity3<U0, U1, U2>.self)
                setterFunc(v.tuple)
            }
        } else {
            setter = nil
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    public init<U0, U1, U2>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> (U0, U1, U2)?, setter setterFunc: (((U0, U1, U2)?) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(JXTuple.Arity3(v))
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: Optional<JXTuple.Arity3<U0, U1, U2>>.self)
                setterFunc(v?.tuple)
            }
        } else {
            setter = nil
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    public init<CR>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> (() -> CR), setter setterFunc: (((() -> CR)) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(JXClosure.Arity0(v))
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: JXClosure.Arity0<CR>.self)
                setterFunc(v.closure)
            }
        } else {
            setter = nil
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    public init<CR>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> (() -> CR)?, setter setterFunc: (((() -> CR)?) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(JXClosure.Arity0(v))
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: Optional<JXClosure.Arity0<CR>>.self)
                setterFunc(v?.closure)
            }
        } else {
            setter = nil
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    public init<C0, CR>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> ((C0) -> CR), setter setterFunc: ((((C0) -> CR)) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(JXClosure.Arity1(v))
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: JXClosure.Arity1<C0, CR>.self)
                setterFunc(v.closure)
            }
        } else {
            setter = nil
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    public init<C0, CR>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> ((C0) -> CR)?, setter setterFunc: ((((C0) -> CR)?) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(JXClosure.Arity1(v))
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: Optional<JXClosure.Arity1<C0, CR>>.self)
                setterFunc(v?.closure)
            }
        } else {
            setter = nil
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    public init<C0, C1, CR>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> ((C0, C1) -> CR), setter setterFunc: ((((C0, C1) -> CR)) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(JXClosure.Arity2(v))
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: JXClosure.Arity2<C0, C1, CR>.self)
                setterFunc(v.closure)
            }
        } else {
            setter = nil
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    public init<C0, C1, CR>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> ((C0, C1) -> CR)?, setter setterFunc: ((((C0, C1) -> CR)?) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(JXClosure.Arity2(v))
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: Optional<JXClosure.Arity2<C0, C1, CR>>.self)
                setterFunc(v?.closure)
            }
        } else {
            setter = nil
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    public init<C0, C1, C2, CR>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> ((C0, C1, C2) -> CR), setter setterFunc: ((((C0, C1, C2) -> CR)) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(JXClosure.Arity3(v))
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: JXClosure.Arity3<C0, C1, C2, CR>.self)
                setterFunc(v.closure)
            }
        } else {
            setter = nil
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: setter)
    }
}


extension JXBridge.StaticPropertyBridge {
    // get: { Type.xxx } set: { ... }
    public init<C0, C1, C2, CR>(name: String, type: Any.Type, getter getterFunc: @escaping () throws -> ((C0, C1, C2) -> CR)?, setter setterFunc: ((((C0, C1, C2) -> CR)?) -> Void)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let v = try getterFunc()
            return try context.convey(JXClosure.Arity3(v))
        }
        let setter: ((JXValue, JXContext) throws -> Void)?
        if let setterFunc {
            setter = { value, context in
                let v = try value.convey(to: Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
                setterFunc(v?.closure)
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
    public init<T, U0, U1>(name: String, getter getterFunc: @escaping (T) async throws -> (U0, U1)) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(v))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: nil)
    }
    
    // { await $0.xxx )
    public init<T, U0, U1>(name: String, classGetter getterFunc: @escaping (T.Type) async throws -> (U0, U1)) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T.Type
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(v))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: nil)
    }
}


extension JXBridge.PropertyBridge {
    // { await $0.xxx }
    public init<T, U0, U1>(name: String, getter getterFunc: @escaping (T) async throws -> (U0, U1)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(v))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: nil)
    }
    
    // { await $0.xxx )
    public init<T, U0, U1>(name: String, classGetter getterFunc: @escaping (T.Type) async throws -> (U0, U1)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T.Type
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(v))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: nil)
    }
}


extension JXBridge.PropertyBridge {
    // { await $0.xxx }
    public init<T, U0, U1, U2>(name: String, getter getterFunc: @escaping (T) async throws -> (U0, U1, U2)) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(v))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: nil)
    }
    
    // { await $0.xxx )
    public init<T, U0, U1, U2>(name: String, classGetter getterFunc: @escaping (T.Type) async throws -> (U0, U1, U2)) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T.Type
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(v))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: nil)
    }
}


extension JXBridge.PropertyBridge {
    // { await $0.xxx }
    public init<T, U0, U1, U2>(name: String, getter getterFunc: @escaping (T) async throws -> (U0, U1, U2)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(v))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.PropertyBridge(owningTypeName: String(describing: T.self), name: name, getter: getter, setter: nil)
    }
    
    // { await $0.xxx )
    public init<T, U0, U1, U2>(name: String, classGetter getterFunc: @escaping (T.Type) async throws -> (U0, U1, U2)?) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let target = obj as! T.Type
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(v))])
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
    public init<U0, U1>(name: String, type: Any.Type, getter getterFunc: @escaping () async throws -> (U0, U1)) {
        let getter: (JXContext) throws -> JXValue = { context in
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc()
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(v))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: nil)
    }
}


extension JXBridge.StaticPropertyBridge {
    // { await Type.xxx )
    public init<U0, U1>(name: String, type: Any.Type, getter getterFunc: @escaping () async throws -> (U0, U1)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc()
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity2(v))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: nil)
    }
}


extension JXBridge.StaticPropertyBridge {
    // { await Type.xxx )
    public init<U0, U1, U2>(name: String, type: Any.Type, getter getterFunc: @escaping () async throws -> (U0, U1, U2)) {
        let getter: (JXContext) throws -> JXValue = { context in
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc()
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(v))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
        self = JXBridge.StaticPropertyBridge(owningTypeName: String(describing: type), name: name, getter: getter, setter: nil)
    }
}


extension JXBridge.StaticPropertyBridge {
    // { await Type.xxx )
    public init<U0, U1, U2>(name: String, type: Any.Type, getter getterFunc: @escaping () async throws -> (U0, U1, U2)?) {
        let getter: (JXContext) throws -> JXValue = { context in
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let v = try await getterFunc()
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(v))])
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
    public init<T, C0, C1, CR>(_ cons: @escaping (((C0, C1) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 1) { args, context in
            let p = try conveyParameters(args, JXClosure.Arity2<C0, C1, CR>.self)
            return try cons(p.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, C0, C1, CR>(_ cons: @escaping (((C0, C1) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 1) { args, context in
            let p = try conveyParameters(args, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            return try cons(p?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, C0, C1, C2, CR>(_ cons: @escaping (((C0, C1, C2) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 1) { args, context in
            let p = try conveyParameters(args, JXClosure.Arity3<C0, C1, C2, CR>.self)
            return try cons(p.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, C0, C1, C2, CR>(_ cons: @escaping (((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 1) { args, context in
            let p = try conveyParameters(args, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            return try cons(p?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, C0, C1, CR>(_ cons: @escaping (P0, ((C0, C1) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, JXClosure.Arity2<C0, C1, CR>.self)
            return try cons(p.0, p.1.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, C0, C1, CR>(_ cons: @escaping (P0, ((C0, C1) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            return try cons(p.0, p.1?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, C0, C1, C2, CR>(_ cons: @escaping (P0, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            return try cons(p.0, p.1.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, C0, C1, C2, CR>(_ cons: @escaping (P0, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 2) { args, context in
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            return try cons(p.0, p.1?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, C0, C1, CR>(_ cons: @escaping (P0, P1, ((C0, C1) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity2<C0, C1, CR>.self)
            return try cons(p.0, p.1, p.2.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, C0, C1, CR>(_ cons: @escaping (P0, P1, ((C0, C1) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            return try cons(p.0, p.1, p.2?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            return try cons(p.0, p.1, p.2.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 3) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            return try cons(p.0, p.1, p.2?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, ((C0, C1) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity2<C0, C1, CR>.self)
            return try cons(p.0, p.1, p.2, p.3.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, ((C0, C1) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            return try cons(p.0, p.1, p.2, p.3.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 4) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity2<C0, C1, CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 5) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity2<C0, C1, CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 6) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 7) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 7) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity0<CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 7) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity0<CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 7) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity1<C0, CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 7) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 7) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity2<C0, C1, CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 7) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 7) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 7) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 8) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 8) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity0<CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 8) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity0<CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 8) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity1<C0, CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 8) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 8) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity2<C0, C1, CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 8) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 8) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
        }
    }
}


extension JXBridge.ConstructorBridge {
    // Type.init(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXBridge.ConstructorBridge(owningTypeName: String(describing: T.self), parameterCount: 8) { args, context in
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            return try cons(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
        }
    }
}

// FUNCTION

extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, U0, U1>(name: String, function: @escaping (T) -> () throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T) throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try callFunc()
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, U0, U1>(name: String, function: @escaping (T) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try function(target)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, U0, U1>(name: String, mutatingFunction: @escaping (inout T) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try mutatingFunction(&target)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, U0, U1>(name: String, classFunction: @escaping (T.Type) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try classFunction(target)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, U0, U1, U2>(name: String, function: @escaping (T) -> () throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T) throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try callFunc()
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, U0, U1, U2>(name: String, function: @escaping (T) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try function(target)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try mutatingFunction(&target)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, U0, U1, U2>(name: String, classFunction: @escaping (T.Type) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try classFunction(target)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, U0, U1, U2>(name: String, function: @escaping (T) -> () throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T) throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try callFunc()
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, U0, U1, U2>(name: String, function: @escaping (T) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try function(target)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try mutatingFunction(&target)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, U0, U1, U2>(name: String, classFunction: @escaping (T.Type) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try classFunction(target)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, U0, U1>(name: String, function: @escaping (T) -> (P0) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0) throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, U0, U1>(name: String, function: @escaping (T, P0) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try function(target, p)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try mutatingFunction(&target, p)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, U0, U1>(name: String, classFunction: @escaping (T.Type, P0) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try classFunction(target, p)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, U0, U1, U2>(name: String, function: @escaping (T) -> (P0) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0) throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, U0, U1, U2>(name: String, function: @escaping (T, P0) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try function(target, p)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try mutatingFunction(&target, p)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try classFunction(target, p)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, U0, U1, U2>(name: String, function: @escaping (T) -> (P0) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0) throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, U0, U1, U2>(name: String, function: @escaping (T, P0) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try function(target, p)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try mutatingFunction(&target, p)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try classFunction(target, p)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, C0, C1, CR, R>(name: String, function: @escaping (T) -> (((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: ((C0, C1) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, C0, C1, CR, R>(name: String, function: @escaping (T, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(target, p.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try mutatingFunction(&target, p.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try classFunction(target, p.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, C0, C1, CR, R>(name: String, function: @escaping (T) -> (((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: ((C0, C1) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, C0, C1, CR, R>(name: String, function: @escaping (T, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(target, p?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try mutatingFunction(&target, p?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try classFunction(target, p?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: ((C0, C1, C2) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, C0, C1, C2, CR, R>(name: String, function: @escaping (T, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(target, p.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try mutatingFunction(&target, p.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try classFunction(target, p.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: ((C0, C1, C2) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, C0, C1, C2, CR, R>(name: String, function: @escaping (T, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(target, p?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try mutatingFunction(&target, p?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try classFunction(target, p?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, U0, U1>(name: String, function: @escaping (T) -> (P0, P1) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1) throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, U0, U1>(name: String, function: @escaping (T, P0, P1) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try function(target, p.0, p.1)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try mutatingFunction(&target, p.0, p.1)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try classFunction(target, p.0, p.1)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1) throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, U0, U1, U2>(name: String, function: @escaping (T, P0, P1) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try function(target, p.0, p.1)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try mutatingFunction(&target, p.0, p.1)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try classFunction(target, p.0, p.1)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1) throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, U0, U1, U2>(name: String, function: @escaping (T, P0, P1) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try function(target, p.0, p.1)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try mutatingFunction(&target, p.0, p.1)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try classFunction(target, p.0, p.1)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: ((C0, C1) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, C1, CR, R>(name: String, function: @escaping (T, P0, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(target, p.0, p.1.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try classFunction(target, p.0, p.1.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: ((C0, C1) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, C1, CR, R>(name: String, function: @escaping (T, P0, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(target, p.0, p.1?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try classFunction(target, p.0, p.1?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: ((C0, C1, C2) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(target, p.0, p.1.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try classFunction(target, p.0, p.1.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: ((C0, C1, C2) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(target, p.0, p.1?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try classFunction(target, p.0, p.1?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2) throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, U0, U1>(name: String, function: @escaping (T, P0, P1, P2) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try function(target, p.0, p.1, p.2)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try classFunction(target, p.0, p.1, p.2)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2) throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try function(target, p.0, p.1, p.2)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try classFunction(target, p.0, p.1, p.2)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2) throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try function(target, p.0, p.1, p.2)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try classFunction(target, p.0, p.1, p.2)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: ((C0, C1) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, C1, CR, R>(name: String, function: @escaping (T, P0, P1, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(target, p.0, p.1, p.2.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: ((C0, C1) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, C1, CR, R>(name: String, function: @escaping (T, P0, P1, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(target, p.0, p.1, p.2?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: ((C0, C1, C2) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, P1, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(target, p.0, p.1, p.2.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: ((C0, C1, C2) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(target, p.0, p.1, p.2?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3) throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try function(target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3) throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try function(target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3) throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try function(target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: ((C0, C1) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, C1, CR, R>(name: String, function: @escaping (T, P0, P1, P2, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: ((C0, C1) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, C1, CR, R>(name: String, function: @escaping (T, P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: ((C0, C1, C2) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: ((C0, C1, C2) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4) throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4) throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4) throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: ((C0, C1) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: ((C0, C1) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: ((C0, C1, C2) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: ((C0, C1, C2) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5) throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5) throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5) throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: ((C0, C1) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: ((C0, C1) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: ((C0, C1, C2) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: ((C0, C1, C2) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6) throws -> (U0, U1) in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6) throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6) throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6) throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: (() -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity0<CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity0<CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity0<CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: (() -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: ((C0) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity1<C0, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity1<C0, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: ((C0) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: ((C0, C1) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: ((C0, C1) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: ((C0, C1, C2) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: ((C0, C1, C2) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7) throws -> (U0, U1) in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7) throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(JXTuple.Arity2(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7) throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7) throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return (target, try context.convey(JXTuple.Arity3(r)))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: (() -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity0<CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity0<CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity0<CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: (() -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: ((C0) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity1<C0, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity1<C0, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: ((C0) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: ((C0, C1) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: ((C0, C1) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: ((C0, C1, C2) -> CR)) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...)
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: ((C0, C1, C2) -> CR)?) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return (target, try context.convey(r))
        }
    }

    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(name: String, mutatingFunction: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            var target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try mutatingFunction(&target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return (target, try context.convey(r))
        }
    }
    
    // { $0.xxx(p0: $1...) }
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return (target, try context.convey(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<U0, U1>(name: String, type: Any.Type, function: @escaping () throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try function()
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<U0, U1, U2>(name: String, type: Any.Type, function: @escaping () throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try function()
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<U0, U1, U2>(name: String, type: Any.Type, function: @escaping () throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try function()
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, U0, U1>(name: String, type: Any.Type, function: @escaping (P0) throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try function(p)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0) throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try function(p)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0) throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try function(p)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(p.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(p?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(p.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(p?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1) throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try function(p.0, p.1)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1) throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try function(p.0, p.1)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1) throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try function(p.0, p.1)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(p.0, p.1.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(p.0, p.1?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(p.0, p.1.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(p.0, p.1?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try function(p.0, p.1, p.2)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try function(p.0, p.1, p.2)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try function(p.0, p.1, p.2)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(p.0, p.1, p.2.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(p.0, p.1, p.2?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(p.0, p.1, p.2.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(p.0, p.1, p.2?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try function(p.0, p.1, p.2, p.3)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try function(p.0, p.1, p.2, p.3)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try function(p.0, p.1, p.2, p.3)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity0<CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return try context.convey(JXTuple.Arity2(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
            return try context.convey(JXTuple.Arity3(r))
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity0<CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity0<CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity1<C0, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity1<C0, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity2<C0, C1, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity2<C0, C1, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, JXClosure.Arity3<C0, C1, C2, CR>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7.closure)
            return try context.convey(r)
        }
    }
}


extension JXBridge.StaticFunctionBridge {
    // { Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, Optional<JXClosure.Arity3<C0, C1, C2, CR>>.self)
            let r = try function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7?.closure)
            return try context.convey(r)
        }
    }
}

// ASYNC_FUNCTION

extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, U0, U1>(name: String, function: @escaping (T) -> () async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T) async throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try await callFunc()
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, U0, U1>(name: String, function: @escaping (T) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 0)
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
    init<T, U0, U1>(name: String, classFunction: @escaping (T.Type) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 0)
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
    init<T, U0, U1, U2>(name: String, function: @escaping (T) -> () async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T) async throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try await callFunc()
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, U0, U1, U2>(name: String, function: @escaping (T) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, U0, U1, U2>(name: String, classFunction: @escaping (T.Type) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, U0, U1, U2>(name: String, function: @escaping (T) -> () async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T) async throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try await callFunc()
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, U0, U1, U2>(name: String, function: @escaping (T) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, U0, U1, U2>(name: String, classFunction: @escaping (T.Type) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, U0, U1>(name: String, function: @escaping (T) -> (P0) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0) async throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try await callFunc(p0)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, U0, U1>(name: String, function: @escaping (T, P0) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 1)
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
    init<T, P0, U0, U1>(name: String, classFunction: @escaping (T.Type, P0) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 1)
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
    init<T, P0, U0, U1, U2>(name: String, function: @escaping (T) -> (P0) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0) async throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try await callFunc(p0)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, U0, U1, U2>(name: String, function: @escaping (T, P0) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, U0, U1, U2>(name: String, function: @escaping (T) -> (P0) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0) async throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try await callFunc(p0)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, U0, U1, U2>(name: String, function: @escaping (T, P0) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, U0, U1>(name: String, function: @escaping (T) -> (P0, P1) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1) async throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, U0, U1>(name: String, function: @escaping (T, P0, P1) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 2)
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
    init<T, P0, P1, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 2)
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
    init<T, P0, P1, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1) async throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, U0, U1, U2>(name: String, function: @escaping (T, P0, P1) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1) async throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, U0, U1, U2>(name: String, function: @escaping (T, P0, P1) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, P2, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2) async throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, U0, U1>(name: String, function: @escaping (T, P0, P1, P2) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 3)
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
    init<T, P0, P1, P2, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 3)
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
    init<T, P0, P1, P2, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2) async throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, P2, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2) async throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, P2, P3, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3) async throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 4)
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
    init<T, P0, P1, P2, P3, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 4)
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
    init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3) async throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3) async throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4) async throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 5)
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
    init<T, P0, P1, P2, P3, P4, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 5)
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
    init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4) async throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4) async throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5) async throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 6)
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
    init<T, P0, P1, P2, P3, P4, P5, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 6)
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


extension JXBridge.FunctionBridge {
    // Type.xxx(p0:...) async
    init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5) async throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5) async throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
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
    init<T, P0, P1, P2, P3, P4, P5, P6, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
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
    init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6) async throws -> (U0, U1) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
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
    init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
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
    init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6) async throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
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
    init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
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
    init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6) async throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6) async throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5, p6)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7) async throws -> R in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
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
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
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
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7) async throws -> (U0, U1) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
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
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
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
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7) async throws -> (U0, U1)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
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
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
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
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7) async throws -> (U0, U1, U2) in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, function: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(name: name) { (obj: T, p0: P0, p1: P1, p2: P2, p3: P3, p4: P4, p5: P5, p6: P6, p7: P7) async throws -> (U0, U1, U2)? in
            let callFunc = function(obj)
            return try await callFunc(p0, p1, p2, p3, p4, p5, p6, p7)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, function: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            let promiseValue = JXValue(context: context, value: promise.promise)
            return (target, promiseValue)
        }
    }

    // { await $0.xxx(p0: $1...) }
    init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, classFunction: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)?) {
        self = JXBridge.FunctionBridge(owningTypeName: String(describing: T.self), name: name) { obj, args, context in
            let target = obj as! T.Type
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await classFunction(target, p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<U0, U1>(name: String, type: Any.Type, function: @escaping () async throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 0)
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
    init<U0, U1, U2>(name: String, type: Any.Type, function: @escaping () async throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function()
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<U0, U1, U2>(name: String, type: Any.Type, function: @escaping () async throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function()
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, U0, U1>(name: String, type: Any.Type, function: @escaping (P0) async throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 1)
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
    init<P0, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0) async throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0) async throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1) async throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 2)
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
    init<P0, P1, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1) async throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1) async throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, P2, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) async throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 3)
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
    init<P0, P1, P2, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) async throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, P2, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2) async throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, P2, P3, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) async throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 4)
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
    init<P0, P1, P2, P3, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) async throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, P2, P3, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3) async throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, P2, P3, P4, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) async throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 5)
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
    init<P0, P1, P2, P3, P4, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, P2, P3, P4, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, P2, P3, P4, P5, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 6)
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


extension JXBridge.StaticFunctionBridge {
    // { await Type.xxx(p0: $0...) }
    init<P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, P2, P3, P4, P5, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, P2, P3, P4, P5, P6, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
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
    init<P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
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
    init<P0, P1, P2, P3, P4, P5, P6, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
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
    init<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 7)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5, p.6)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, P2, P3, P4, P5, P6, P7, R>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
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
    init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
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
    init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
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
    init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
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
    init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(name: String, type: Any.Type, function: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)?) {
        self = JXBridge.StaticFunctionBridge(owningTypeName: String(describing: type), name: name) { args, context in
            try validate(arguments: args, count: 8)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self, P6.self, P7.self)
            let promise = try JXValue.createPromise(in: context)
            Task {
                do {
                    let r = try await function(p.0, p.1, p.2, p.3, p.4, p.5, p.6, p.7)
                    try promise.resolveFunction.call(withArguments: [context.convey(JXTuple.Arity3(r))])
                } catch {
                    try promise.rejectFunction.call(withArguments: [context.error(error)])
                }
            }
            return JXValue(context: context, value: promise.promise)
        }
    }
}

// PARAM_SUPPORT

func conveyParameters<P0, P1, P2, P3, P4, P5, P6>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type, _ p2: P2.Type, _ p3: P3.Type, _ p4: P4.Type, _ p5: P5.Type, _ p6: P6.Type) throws -> (P0, P1, P2, P3, P4, P5, P6) {
    return try (args[0].convey(to: p0), args[1].convey(to: p1), args[2].convey(to: p2), args[3].convey(to: p3), args[4].convey(to: p4), args[5].convey(to: p5), args[6].convey(to: p6))
}


func conveyParameters<P0, P1, P2, P3, P4, P5, P6, P7>(_ args: [JXValue], _ p0: P0.Type, _ p1: P1.Type, _ p2: P2.Type, _ p3: P3.Type, _ p4: P4.Type, _ p5: P5.Type, _ p6: P6.Type, _ p7: P7.Type) throws -> (P0, P1, P2, P3, P4, P5, P6, P7) {
    return try (args[0].convey(to: p0), args[1].convey(to: p1), args[2].convey(to: p2), args[3].convey(to: p3), args[4].convey(to: p4), args[5].convey(to: p5), args[6].convey(to: p6), args[7].convey(to: p7))
}
