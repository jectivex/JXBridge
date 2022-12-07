// THIS FILE IS AUTO GENERATED FROM JXBridgeBuilder.swift. DO NOT EDIT
//
//		swift package plugin generate-arity JXBridgeBuilder.swift
//			-maximumFunctionParameters 8
//			-maximumClosureParameters 2
//			-maximumThrowingClosureParameters -1
//			-optionalClosures 1
//			-asyncMemberClosures 0
//			-maximumJXClosureParameters 6

import JXKit

// PROPERTY

extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<V>(_ accessor: () -> KeyPath<T, V>) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<V>(_ getter: @escaping (T) throws -> V) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T) throws -> V, set setterFunc: ((T, V) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T) throws -> V, set setterFunc: @escaping (T, V) -> T) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<CR>(_ accessor: () -> KeyPath<T, (() -> CR)>) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<CR>(_ getter: @escaping (T) throws -> (() -> CR)) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping (T) throws -> (() -> CR), set setterFunc: ((T, (() -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping (T) throws -> (() -> CR), set setterFunc: @escaping (T, (() -> CR)) -> T) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<CR>(_ accessor: () -> KeyPath<T, (() -> CR)?>) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<CR>(_ getter: @escaping (T) throws -> (() -> CR)?) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping (T) throws -> (() -> CR)?, set setterFunc: ((T, (() -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping (T) throws -> (() -> CR)?, set setterFunc: @escaping (T, (() -> CR)?) -> T) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ accessor: () -> KeyPath<T, ((C0) -> CR)>) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ getter: @escaping (T) throws -> ((C0) -> CR)) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping (T) throws -> ((C0) -> CR), set setterFunc: ((T, ((C0) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping (T) throws -> ((C0) -> CR), set setterFunc: @escaping (T, ((C0) -> CR)) -> T) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ accessor: () -> KeyPath<T, ((C0) -> CR)?>) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ getter: @escaping (T) throws -> ((C0) -> CR)?) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping (T) throws -> ((C0) -> CR)?, set setterFunc: ((T, ((C0) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping (T) throws -> ((C0) -> CR)?, set setterFunc: @escaping (T, ((C0) -> CR)?) -> T) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ accessor: () -> KeyPath<T, ((C0, C1) -> CR)>) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ getter: @escaping (T) throws -> ((C0, C1) -> CR)) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping (T) throws -> ((C0, C1) -> CR), set setterFunc: ((T, ((C0, C1) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping (T) throws -> ((C0, C1) -> CR), set setterFunc: @escaping (T, ((C0, C1) -> CR)) -> T) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ accessor: () -> KeyPath<T, ((C0, C1) -> CR)?>) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ getter: @escaping (T) throws -> ((C0, C1) -> CR)?) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping (T) throws -> ((C0, C1) -> CR)?, set setterFunc: ((T, ((C0, C1) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping (T) throws -> ((C0, C1) -> CR)?, set setterFunc: @escaping (T, ((C0, C1) -> CR)?) -> T) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<V>(_ getterFunc: @escaping () throws -> V) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<V>(get getterFunc: @escaping () throws -> V, set setterFunc: ((V) -> Void)?) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<CR>(_ getterFunc: @escaping () throws -> (() -> CR)) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping () throws -> (() -> CR), set setterFunc: (((() -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<CR>(_ getterFunc: @escaping () throws -> (() -> CR)?) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping () throws -> (() -> CR)?, set setterFunc: (((() -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ getterFunc: @escaping () throws -> ((C0) -> CR)) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping () throws -> ((C0) -> CR), set setterFunc: ((((C0) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ getterFunc: @escaping () throws -> ((C0) -> CR)?) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping () throws -> ((C0) -> CR)?, set setterFunc: ((((C0) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ getterFunc: @escaping () throws -> ((C0, C1) -> CR)) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping () throws -> ((C0, C1) -> CR), set setterFunc: ((((C0, C1) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ getterFunc: @escaping () throws -> ((C0, C1) -> CR)?) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping () throws -> ((C0, C1) -> CR)?, set setterFunc: ((((C0, C1) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<V>(_ getter: @escaping (T.Type) throws -> V) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T.Type) throws -> V, set setterFunc: ((T.Type, V) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<CR>(_ getter: @escaping (T.Type) throws -> (() -> CR)) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping (T.Type) throws -> (() -> CR), set setterFunc: ((T.Type, (() -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<CR>(_ getter: @escaping (T.Type) throws -> (() -> CR)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping (T.Type) throws -> (() -> CR)?, set setterFunc: ((T.Type, (() -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ getter: @escaping (T.Type) throws -> ((C0) -> CR)) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping (T.Type) throws -> ((C0) -> CR), set setterFunc: ((T.Type, ((C0) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ getter: @escaping (T.Type) throws -> ((C0) -> CR)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping (T.Type) throws -> ((C0) -> CR)?, set setterFunc: ((T.Type, ((C0) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ getter: @escaping (T.Type) throws -> ((C0, C1) -> CR)) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping (T.Type) throws -> ((C0, C1) -> CR), set setterFunc: ((T.Type, ((C0, C1) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ getter: @escaping (T.Type) throws -> ((C0, C1) -> CR)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping (T.Type) throws -> ((C0, C1) -> CR)?, set setterFunc: ((T.Type, ((C0, C1) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}

// ASYNC_PROPERTY

extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<V>(_ getter: @escaping (T) async throws -> V) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, getter: getter))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<V>(_ getterFunc: @escaping () async throws -> V) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
 
    // builder.static.var.xxx { await Type.xxx }
    @discardableResult public func callAsFunction<V>(get getterFunc: @escaping () async throws -> V) -> JXBridgeBuilder<T> {
        return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<V>(_ getter: @escaping (T.Type) async throws -> V) -> JXBridgeBuilder<T> {
        return add(PropertyBridge(name: name, classGetter: getter))
    }
}

// FUNCTION

extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping () -> (T) -> () throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping (T) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (T) -> (P0) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T, P0) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping () -> (T) -> ((() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping (T, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping () -> (T) -> ((() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping (T, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping () -> (T) -> (((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (T, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping () -> (T) -> (((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (T, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (T, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (T, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (T, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (T, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, CR, R>(_ f: @escaping (T, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, CR, R>(_ f: @escaping (T, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping () -> (T) -> (P0, P1) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (T, P0, P1) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping () -> (T) -> (P0, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (T, P0, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping () -> (T) -> (P0, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (T, P0, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (T, P0, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (T, P0, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (T, P0, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (T, P0, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping () -> (T) -> (P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (T, P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (T, P0, P1, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (T, P0, P1, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (T, P0, P1, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (T, P0, P1, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (T, P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (T, P0, P1, P2, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (T, P0, P1, P2, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (T, P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping (inout T) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (inout T, P0) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping (inout T, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping (inout T, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (inout T, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (inout T, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (inout T, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (inout T, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (inout T, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (inout T, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (inout T, P0, P1) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (inout T, P0, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (inout T, P0, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (inout T, P0, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (inout T, P0, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (inout T, P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (inout T, P0, P1, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (inout T, P0, P1, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (inout T, P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping () -> () throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping () throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (P0) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (P0) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping () -> ((() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping ((() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping () -> ((() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping ((() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping () -> (((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping () -> (((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping () -> (((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping () -> (((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping () -> (((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping () -> (((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, CR, R>(_ f: @escaping (((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, CR, R>(_ f: @escaping (((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping () -> (P0, P1) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (P0, P1) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping () -> (P0, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (P0, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping () -> (P0, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (P0, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping () -> (P0, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (P0, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping () -> (P0, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (P0, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping () -> (P0, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (P0, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping () -> (P0, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (P0, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (P0, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (P0, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping () -> (P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping () -> (P0, P1, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (P0, P1, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping () -> (P0, P1, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (P0, P1, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping () -> (P0, P1, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (P0, P1, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping () -> (P0, P1, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (P0, P1, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (P0, P1, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (P0, P1, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, P1, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, P1, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, P1, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, P1, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping () -> (P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping () -> (P0, P1, P2, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (P0, P1, P2, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping () -> (P0, P1, P2, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (P0, P1, P2, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (P0, P1, P2, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (P0, P1, P2, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (P0, P1, P2, P3, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (P0, P1, P2, P3, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping (T.Type) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T.Type, P0) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping (T.Type, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping (T.Type, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (T.Type, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (T.Type, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (T.Type, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (T.Type, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (T.Type, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (T.Type, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (T.Type, P0, P1) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (T.Type, P0, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (T.Type, P0, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (T.Type, P0, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (T.Type, P0, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (T.Type, P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (T.Type, P0, P1, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (T.Type, P0, P1, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (T.Type, P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}

// ASYNC_FUNCTION

extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping () -> (T) -> () async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping (T) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (T) -> (P0) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T, P0) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping () -> (T) -> (P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (T, P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping () -> (T) -> (P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (T, P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (T, P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (T, P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping () -> () async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping () async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (P0) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (P0) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping () -> (P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping () -> (P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping () -> (P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
        return add(StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping (T.Type) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T.Type, P0) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (T.Type, P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (T.Type, P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (T.Type, P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
        return add(FunctionBridge(name: name, classFunction: f))
    }
}
