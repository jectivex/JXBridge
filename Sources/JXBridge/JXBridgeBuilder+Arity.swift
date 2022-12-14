// THIS FILE IS AUTO GENERATED FROM JXBridgeBuilder.swift. DO NOT EDIT
//
//		swift package plugin generate-arity JXBridgeBuilder.swift
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

extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<V>(_ accessor: () -> KeyPath<T, V>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<V>(_ getter: @escaping (T) throws -> V) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T) throws -> V, set setterFunc: ((T, V) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T) throws -> V, set setterFunc: @escaping (T, V) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<V>(_ getterFunc: @escaping () throws -> V) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<V>(get getterFunc: @escaping () throws -> V, set setterFunc: ((V) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<V>(_ getter: @escaping (T.Type) throws -> V) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T.Type) throws -> V, set setterFunc: ((T.Type, V) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}

// ASYNC_PROPERTY

extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<V>(_ getter: @escaping (T) async throws -> V) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getter))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<V>(_ getterFunc: @escaping () async throws -> V) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
 
    // builder.static.var.xxx { await Type.xxx }
    @discardableResult public func callAsFunction<V>(get getterFunc: @escaping () async throws -> V) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<V>(_ getter: @escaping (T.Type) async throws -> V) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter))
    }
}

// INIT

extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor(_ cons: @escaping () -> () throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor(_ cons: @escaping () throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0>(_ cons: @escaping () -> (P0) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0>(_ cons: @escaping (P0) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<CR>(_ cons: @escaping () -> ((() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<CR>(_ cons: @escaping ((() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<CR>(_ cons: @escaping () -> ((() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<CR>(_ cons: @escaping ((() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<C0, CR>(_ cons: @escaping () -> (((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<C0, CR>(_ cons: @escaping (((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<C0, CR>(_ cons: @escaping () -> (((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<C0, CR>(_ cons: @escaping (((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1>(_ cons: @escaping () -> (P0, P1) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1>(_ cons: @escaping (P0, P1) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, CR>(_ cons: @escaping () -> (P0, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, CR>(_ cons: @escaping (P0, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, CR>(_ cons: @escaping () -> (P0, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, CR>(_ cons: @escaping (P0, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, C0, CR>(_ cons: @escaping () -> (P0, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, C0, CR>(_ cons: @escaping (P0, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, C0, CR>(_ cons: @escaping () -> (P0, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, C0, CR>(_ cons: @escaping (P0, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2>(_ cons: @escaping () -> (P0, P1, P2) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2>(_ cons: @escaping (P0, P1, P2) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, CR>(_ cons: @escaping () -> (P0, P1, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, CR>(_ cons: @escaping (P0, P1, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, CR>(_ cons: @escaping () -> (P0, P1, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, CR>(_ cons: @escaping (P0, P1, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, C0, CR>(_ cons: @escaping () -> (P0, P1, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, C0, CR>(_ cons: @escaping (P0, P1, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, C0, CR>(_ cons: @escaping () -> (P0, P1, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, C0, CR>(_ cons: @escaping (P0, P1, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3>(_ cons: @escaping () -> (P0, P1, P2, P3) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3>(_ cons: @escaping (P0, P1, P2, P3) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, CR>(_ cons: @escaping () -> (P0, P1, P2, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, CR>(_ cons: @escaping (P0, P1, P2, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, CR>(_ cons: @escaping () -> (P0, P1, P2, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, CR>(_ cons: @escaping (P0, P1, P2, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, C0, CR>(_ cons: @escaping () -> (P0, P1, P2, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, C0, CR>(_ cons: @escaping (P0, P1, P2, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, C0, CR>(_ cons: @escaping () -> (P0, P1, P2, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, C0, CR>(_ cons: @escaping (P0, P1, P2, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4>(_ cons: @escaping () -> (P0, P1, P2, P3, P4) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4>(_ cons: @escaping (P0, P1, P2, P3, P4) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, CR>(_ cons: @escaping (P0, P1, P2, P3, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, CR>(_ cons: @escaping (P0, P1, P2, P3, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, C0, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, C0, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5>(_ cons: @escaping (P0, P1, P2, P3, P4, P5) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, C0, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, C0, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}

// FUNCTION

extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping () -> (T) -> () throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping (T) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping () -> (T) -> () throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping (T) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (T) -> (P0) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T, P0) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping () -> (T) -> (P0) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (T, P0) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping () -> (T) -> ((() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping (T, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping () -> (T) -> ((() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping (T, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping () -> (T) -> (((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (T, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping () -> (T) -> (((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (T, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping () -> (T) -> (P0, P1) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (T, P0, P1) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (T, P0, P1) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping () -> (T) -> (P0, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (T, P0, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping () -> (T) -> (P0, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (T, P0, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (T, P0, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (T, P0, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping () -> (T) -> (P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (T, P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (T, P0, P1, P2) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (T, P0, P1, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (T, P0, P1, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (T, P0, P1, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (T, P0, P1, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (T, P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (T, P0, P1, P2, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (T, P0, P1, P2, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (T, P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping (inout T) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping (inout T) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (inout T, P0) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (inout T, P0) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping (inout T, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping (inout T, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (inout T, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (inout T, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (inout T, P0, P1) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (inout T, P0, P1) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (inout T, P0, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (inout T, P0, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (inout T, P0, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (inout T, P0, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (inout T, P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (inout T, P0, P1, P2) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (inout T, P0, P1, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (inout T, P0, P1, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (inout T, P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (inout T, P0, P1, P2, P3) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (inout T, P0, P1, P2, P3, P4) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping () -> () throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping () throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping () -> () throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping () throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (P0) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (P0) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping () -> (P0) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (P0) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping () -> ((() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping ((() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping () -> ((() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping ((() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping () -> (((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping () -> (((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping () -> (P0, P1) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (P0, P1) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping () -> (P0, P1) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (P0, P1) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping () -> (P0, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (P0, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping () -> (P0, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (P0, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping () -> (P0, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (P0, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping () -> (P0, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (P0, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping () -> (P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping () -> (P0, P1, P2) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (P0, P1, P2) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping () -> (P0, P1, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (P0, P1, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping () -> (P0, P1, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (P0, P1, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping () -> (P0, P1, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (P0, P1, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping () -> (P0, P1, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (P0, P1, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping () -> (P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (P0, P1, P2, P3) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping () -> (P0, P1, P2, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (P0, P1, P2, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping () -> (P0, P1, P2, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (P0, P1, P2, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (P0, P1, P2, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (P0, P1, P2, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (P0, P1, P2, P3, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (P0, P1, P2, P3, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping (T.Type) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping (T.Type) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T.Type, P0) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (T.Type, P0) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping (T.Type, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<CR, R>(_ f: @escaping (T.Type, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (T.Type, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, CR, R>(_ f: @escaping (T.Type, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (T.Type, P0, P1) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (T.Type, P0, P1) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (T.Type, P0, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, CR, R>(_ f: @escaping (T.Type, P0, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (T.Type, P0, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, CR, R>(_ f: @escaping (T.Type, P0, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (T.Type, P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (T.Type, P0, P1, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, CR, R>(_ f: @escaping (T.Type, P0, P1, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (T.Type, P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}

// ASYNC_FUNCTION

extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping () -> (T) -> () async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping (T) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping () -> (T) -> () async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping (T) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (T) -> (P0) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T, P0) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping () -> (T) -> (P0) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (T, P0) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping () -> (T) -> (P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (T, P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (T, P0, P1) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping () -> (T) -> (P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (T, P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (T, P0, P1, P2) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (T, P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (T, P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping () -> () async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping () async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping () -> () async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping () async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (P0) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (P0) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping () -> (P0) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (P0) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping () -> (P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping () -> (P0, P1) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (P0, P1) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping () -> (P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping () -> (P0, P1, P2) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (P0, P1, P2) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping () -> (P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (P0, P1, P2, P3) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<R>(_ f: @escaping (T.Type) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping (T.Type) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T.Type, P0) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (T.Type, P0) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (T.Type, P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (T.Type, P0, P1) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (T.Type, P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (T.Type, P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}
