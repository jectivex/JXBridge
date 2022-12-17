// THIS FILE IS AUTO GENERATED FROM JXPropertyWrappers.swift. DO NOT EDIT
//
//		swift package plugin generate-arity JXPropertyWrappers.swift
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

extension JXVar {
    public init<T, V>(wrappedValue: (get: (T) throws -> V, set: ((T, V) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, V>(wrappedValue: @escaping (T) throws -> V, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXStaticVar {
    public init<V>(wrappedValue: (get: () throws -> V, set: ((V) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<V>(wrappedValue: @escaping () throws -> V) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXClassVar {
    public init<T, V>(wrappedValue: (get: (T.Type) throws -> V, set: ((T.Type, V) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, V>(wrappedValue: @escaping (T.Type) throws -> V, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXKeyPath {
    public init<T, V>(wrappedValue: KeyPath<T, V>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}

// ASYNC_PROPERTY

extension JXVar {
    public init<T, V>(wrappedValue: @escaping (T) async throws -> V, _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue) })
    }
}


extension JXStaticVar {
    public init<V>(wrappedValue: @escaping () async throws -> V) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue) })
    }
}


extension JXClassVar {
    public init<T, V>(wrappedValue: @escaping (V.Type) async throws -> V, _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue) })
    }
}

// INIT

extension JXInit {
    public init<T>(wrappedValue: @escaping () throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0>(wrappedValue: @escaping (P0) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, CR>(wrappedValue: @escaping ((() -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, CR>(wrappedValue: @escaping ((() -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, C0, CR>(wrappedValue: @escaping (((C0) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, C0, CR>(wrappedValue: @escaping (((C0) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1>(wrappedValue: @escaping (P0, P1) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, CR>(wrappedValue: @escaping (P0, (() -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, CR>(wrappedValue: @escaping (P0, (() -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, C0, CR>(wrappedValue: @escaping (P0, ((C0) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, C0, CR>(wrappedValue: @escaping (P0, ((C0) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2>(wrappedValue: @escaping (P0, P1, P2) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, CR>(wrappedValue: @escaping (P0, P1, (() -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, CR>(wrappedValue: @escaping (P0, P1, (() -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, C0, CR>(wrappedValue: @escaping (P0, P1, ((C0) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, C0, CR>(wrappedValue: @escaping (P0, P1, ((C0) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3>(wrappedValue: @escaping (P0, P1, P2, P3) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, CR>(wrappedValue: @escaping (P0, P1, P2, (() -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, CR>(wrappedValue: @escaping (P0, P1, P2, (() -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4>(wrappedValue: @escaping (P0, P1, P2, P3, P4) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, CR>(wrappedValue: @escaping (P0, P1, P2, P3, (() -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, CR>(wrappedValue: @escaping (P0, P1, P2, P3, (() -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, (() -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, (() -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}

// FUNCTION

extension JXFunc {
    public init<T, R>(wrappedValue: @escaping (T) -> () throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, U0, U1>(wrappedValue: @escaping (T) -> () throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, R>(wrappedValue: @escaping (T) -> (P0) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, U0, U1>(wrappedValue: @escaping (T) -> (P0) throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, CR, R>(wrappedValue: @escaping (T) -> ((() -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, CR, R>(wrappedValue: @escaping (T) -> ((() -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, C0, CR, R>(wrappedValue: @escaping (T) -> (((C0) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, C0, CR, R>(wrappedValue: @escaping (T) -> (((C0) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, R>(wrappedValue: @escaping (T) -> (P0, P1) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1) throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, CR, R>(wrappedValue: @escaping (T) -> (P0, (() -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, CR, R>(wrappedValue: @escaping (T) -> (P0, (() -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, R>(wrappedValue: @escaping (T) -> (P0, P1, P2) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2) throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, (() -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, (() -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, (() -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, (() -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, (() -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, (() -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, (() -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<R>(wrappedValue: @escaping () throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<U0, U1>(wrappedValue: @escaping () throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, R>(wrappedValue: @escaping (P0) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, U0, U1>(wrappedValue: @escaping (P0) throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<CR, R>(wrappedValue: @escaping ((() -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<CR, R>(wrappedValue: @escaping ((() -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<C0, CR, R>(wrappedValue: @escaping (((C0) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<C0, CR, R>(wrappedValue: @escaping (((C0) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, R>(wrappedValue: @escaping (P0, P1) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, U0, U1>(wrappedValue: @escaping (P0, P1) throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, CR, R>(wrappedValue: @escaping (P0, (() -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, CR, R>(wrappedValue: @escaping (P0, (() -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, C0, CR, R>(wrappedValue: @escaping (P0, ((C0) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, C0, CR, R>(wrappedValue: @escaping (P0, ((C0) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, R>(wrappedValue: @escaping (P0, P1, P2) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, U0, U1>(wrappedValue: @escaping (P0, P1, P2) throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, CR, R>(wrappedValue: @escaping (P0, P1, (() -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, CR, R>(wrappedValue: @escaping (P0, P1, (() -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, CR, R>(wrappedValue: @escaping (P0, P1, ((C0) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, CR, R>(wrappedValue: @escaping (P0, P1, ((C0) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, R>(wrappedValue: @escaping (P0, P1, P2, P3) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3) throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, CR, R>(wrappedValue: @escaping (P0, P1, P2, (() -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, CR, R>(wrappedValue: @escaping (P0, P1, P2, (() -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4) throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, (() -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, (() -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, (() -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, R>(wrappedValue: @escaping (T.Type) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, U0, U1>(wrappedValue: @escaping (T.Type) throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, R>(wrappedValue: @escaping (T.Type, P0) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, U0, U1>(wrappedValue: @escaping (T.Type, P0) throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, CR, R>(wrappedValue: @escaping (T.Type, (() -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, CR, R>(wrappedValue: @escaping (T.Type, (() -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, C0, CR, R>(wrappedValue: @escaping (T.Type, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, C0, CR, R>(wrappedValue: @escaping (T.Type, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, R>(wrappedValue: @escaping (T.Type, P0, P1) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1) throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, CR, R>(wrappedValue: @escaping (T.Type, P0, (() -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, CR, R>(wrappedValue: @escaping (T.Type, P0, (() -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, R>(wrappedValue: @escaping (T.Type, P0, P1, P2) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2) throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, (() -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, (() -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, (() -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, (() -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, (() -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, (() -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, (() -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, (() -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}

// ASYNC_FUNCTION

 extension JXFunc {
    public init<T, R>(wrappedValue: @escaping (T) -> () async throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, U0, U1>(wrappedValue: @escaping (T) -> () async throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, R>(wrappedValue: @escaping (T) -> (P0) async throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, U0, U1>(wrappedValue: @escaping (T) -> (P0) async throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, R>(wrappedValue: @escaping (T) -> (P0, P1) async throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1) async throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, R>(wrappedValue: @escaping (T) -> (P0, P1, P2) async throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2) async throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) async throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) async throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<R>(wrappedValue: @escaping () async throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<U0, U1>(wrappedValue: @escaping () async throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, R>(wrappedValue: @escaping (P0) async throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, U0, U1>(wrappedValue: @escaping (P0) async throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, R>(wrappedValue: @escaping (P0, P1) async throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, U0, U1>(wrappedValue: @escaping (P0, P1) async throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, R>(wrappedValue: @escaping (P0, P1, P2) async throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, U0, U1>(wrappedValue: @escaping (P0, P1, P2) async throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, R>(wrappedValue: @escaping (P0, P1, P2, P3) async throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3) async throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4) async throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4) async throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) async throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, R>(wrappedValue: @escaping (T.Type) async throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, U0, U1>(wrappedValue: @escaping (T.Type) async throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, R>(wrappedValue: @escaping (T.Type, P0) async throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, U0, U1>(wrappedValue: @escaping (T.Type, P0) async throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, R>(wrappedValue: @escaping (T.Type, P0, P1) async throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1) async throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, R>(wrappedValue: @escaping (T.Type, P0, P1, P2) async throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2) async throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) async throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) async throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}
