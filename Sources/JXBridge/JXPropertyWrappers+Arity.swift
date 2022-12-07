// THIS FILE IS AUTO GENERATED FROM JXPropertyWrappers.swift. DO NOT EDIT
//
//		swift package plugin generate-arity JXPropertyWrappers.swift
//			-maximumFunctionParameters 8
//			-maximumClosureParameters 2
//			-maximumThrowingClosureParameters -1
//			-optionalClosures 1
//			-asyncMemberClosures 0
//			-maximumJXClosureParameters 6

import JXKit

// PROPERTY

extension JXVar {
    public init<T, V>(wrappedValue: (get: (T) throws -> V, set: ((T, V) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, V>(wrappedValue: @escaping (T) throws -> V, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, CR>(wrappedValue: (get: (T) throws -> (() -> CR), set: ((T, (() -> CR)) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, CR>(wrappedValue: @escaping (T) throws -> (() -> CR), _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, CR>(wrappedValue: (get: (T) throws -> (() -> CR)?, set: ((T, (() -> CR)?) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, CR>(wrappedValue: @escaping (T) throws -> (() -> CR)?, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, C0, CR>(wrappedValue: (get: (T) throws -> ((C0) -> CR), set: ((T, ((C0) -> CR)) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, C0, CR>(wrappedValue: @escaping (T) throws -> ((C0) -> CR), _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, C0, CR>(wrappedValue: (get: (T) throws -> ((C0) -> CR)?, set: ((T, ((C0) -> CR)?) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, C0, CR>(wrappedValue: @escaping (T) throws -> ((C0) -> CR)?, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, C0, C1, CR>(wrappedValue: (get: (T) throws -> ((C0, C1) -> CR), set: ((T, ((C0, C1) -> CR)) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, C0, C1, CR>(wrappedValue: @escaping (T) throws -> ((C0, C1) -> CR), _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, C0, C1, CR>(wrappedValue: (get: (T) throws -> ((C0, C1) -> CR)?, set: ((T, ((C0, C1) -> CR)?) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, C0, C1, CR>(wrappedValue: @escaping (T) throws -> ((C0, C1) -> CR)?, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXStaticVar {
    public init<V>(wrappedValue: (get: () throws -> V, set: ((V) -> Void)?)) {
        propertyBridge = { StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<V>(wrappedValue: @escaping () throws -> V) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<CR>(wrappedValue: (get: () throws -> (() -> CR), set: (((() -> CR)) -> Void)?)) {
        propertyBridge = { StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<CR>(wrappedValue: @escaping () throws -> (() -> CR)) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<CR>(wrappedValue: (get: () throws -> (() -> CR)?, set: (((() -> CR)?) -> Void)?)) {
        propertyBridge = { StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<CR>(wrappedValue: @escaping () throws -> (() -> CR)?) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<C0, CR>(wrappedValue: (get: () throws -> ((C0) -> CR), set: ((((C0) -> CR)) -> Void)?)) {
        propertyBridge = { StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<C0, CR>(wrappedValue: @escaping () throws -> ((C0) -> CR)) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<C0, CR>(wrappedValue: (get: () throws -> ((C0) -> CR)?, set: ((((C0) -> CR)?) -> Void)?)) {
        propertyBridge = { StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<C0, CR>(wrappedValue: @escaping () throws -> ((C0) -> CR)?) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<C0, C1, CR>(wrappedValue: (get: () throws -> ((C0, C1) -> CR), set: ((((C0, C1) -> CR)) -> Void)?)) {
        propertyBridge = { StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<C0, C1, CR>(wrappedValue: @escaping () throws -> ((C0, C1) -> CR)) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<C0, C1, CR>(wrappedValue: (get: () throws -> ((C0, C1) -> CR)?, set: ((((C0, C1) -> CR)?) -> Void)?)) {
        propertyBridge = { StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<C0, C1, CR>(wrappedValue: @escaping () throws -> ((C0, C1) -> CR)?) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXClassVar {
    public init<T, V>(wrappedValue: (get: (T.Type) throws -> V, set: ((T.Type, V) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, V>(wrappedValue: @escaping (T.Type) throws -> V, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, CR>(wrappedValue: (get: (T.Type) throws -> (() -> CR), set: ((T.Type, (() -> CR)) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, CR>(wrappedValue: @escaping (T.Type) throws -> (() -> CR), _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, CR>(wrappedValue: (get: (T.Type) throws -> (() -> CR)?, set: ((T.Type, (() -> CR)?) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, CR>(wrappedValue: @escaping (T.Type) throws -> (() -> CR)?, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, C0, CR>(wrappedValue: (get: (T.Type) throws -> ((C0) -> CR), set: ((T.Type, ((C0) -> CR)) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, C0, CR>(wrappedValue: @escaping (T.Type) throws -> ((C0) -> CR), _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, C0, CR>(wrappedValue: (get: (T.Type) throws -> ((C0) -> CR)?, set: ((T.Type, ((C0) -> CR)?) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, C0, CR>(wrappedValue: @escaping (T.Type) throws -> ((C0) -> CR)?, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, C0, C1, CR>(wrappedValue: (get: (T.Type) throws -> ((C0, C1) -> CR), set: ((T.Type, ((C0, C1) -> CR)) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, C0, C1, CR>(wrappedValue: @escaping (T.Type) throws -> ((C0, C1) -> CR), _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, C0, C1, CR>(wrappedValue: (get: (T.Type) throws -> ((C0, C1) -> CR)?, set: ((T.Type, ((C0, C1) -> CR)?) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init<T, C0, C1, CR>(wrappedValue: @escaping (T.Type) throws -> ((C0, C1) -> CR)?, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXKeyPath {
    public init<T, V>(wrappedValue: KeyPath<T, V>) {
        propertyBridge = { PropertyBridge(name: $0, keyPath: wrappedValue) }
    }
}


extension JXKeyPath {
    public init<T, CR>(wrappedValue: KeyPath<T, (() -> CR)>) {
        propertyBridge = { PropertyBridge(name: $0, keyPath: wrappedValue) }
    }
}


extension JXKeyPath {
    public init<T, CR>(wrappedValue: KeyPath<T, (() -> CR)?>) {
        propertyBridge = { PropertyBridge(name: $0, keyPath: wrappedValue) }
    }
}


extension JXKeyPath {
    public init<T, C0, CR>(wrappedValue: KeyPath<T, ((C0) -> CR)>) {
        propertyBridge = { PropertyBridge(name: $0, keyPath: wrappedValue) }
    }
}


extension JXKeyPath {
    public init<T, C0, CR>(wrappedValue: KeyPath<T, ((C0) -> CR)?>) {
        propertyBridge = { PropertyBridge(name: $0, keyPath: wrappedValue) }
    }
}


extension JXKeyPath {
    public init<T, C0, C1, CR>(wrappedValue: KeyPath<T, ((C0, C1) -> CR)>) {
        propertyBridge = { PropertyBridge(name: $0, keyPath: wrappedValue) }
    }
}


extension JXKeyPath {
    public init<T, C0, C1, CR>(wrappedValue: KeyPath<T, ((C0, C1) -> CR)?>) {
        propertyBridge = { PropertyBridge(name: $0, keyPath: wrappedValue) }
    }
}

// ASYNC_PROPERTY

extension JXVar {
    public init<T, V>(wrappedValue: @escaping (T) async throws -> V, _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, getter: wrappedValue) }
    }
}


extension JXStaticVar {
    public init<V>(wrappedValue: @escaping () async throws -> V) {
        propertyBridge = { StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue) }
    }
}


extension JXClassVar {
    public init<T, V>(wrappedValue: @escaping (V.Type) async throws -> V, _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, classGetter: wrappedValue) }
    }
}

// FUNCTION

extension JXInit {
    public init<T>(wrappedValue: @escaping () throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0>(wrappedValue: @escaping (P0) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, CR>(wrappedValue: @escaping ((() -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, CR>(wrappedValue: @escaping ((() -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, C0, CR>(wrappedValue: @escaping (((C0) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, C0, CR>(wrappedValue: @escaping (((C0) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, C0, C1, CR>(wrappedValue: @escaping (((C0, C1) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, C0, C1, CR>(wrappedValue: @escaping (((C0, C1) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, C0, C1, C2, CR>(wrappedValue: @escaping (((C0, C1, C2) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, C0, C1, C2, CR>(wrappedValue: @escaping (((C0, C1, C2) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, C0, C1, C2, C3, CR>(wrappedValue: @escaping (((C0, C1, C2, C3) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, C0, C1, C2, C3, CR>(wrappedValue: @escaping (((C0, C1, C2, C3) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (((C0, C1, C2, C3, C4) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (((C0, C1, C2, C3, C4) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (((C0, C1, C2, C3, C4, C5) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1>(wrappedValue: @escaping (P0, P1) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, CR>(wrappedValue: @escaping (P0, (() -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, CR>(wrappedValue: @escaping (P0, (() -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, C0, CR>(wrappedValue: @escaping (P0, ((C0) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, C0, CR>(wrappedValue: @escaping (P0, ((C0) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, C0, C1, CR>(wrappedValue: @escaping (P0, ((C0, C1) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, C0, C1, CR>(wrappedValue: @escaping (P0, ((C0, C1) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, C0, C1, C2, CR>(wrappedValue: @escaping (P0, ((C0, C1, C2) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, C0, C1, C2, CR>(wrappedValue: @escaping (P0, ((C0, C1, C2) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, ((C0, C1, C2, C3) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, ((C0, C1, C2, C3) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, ((C0, C1, C2, C3, C4) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, ((C0, C1, C2, C3, C4) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2>(wrappedValue: @escaping (P0, P1, P2) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, CR>(wrappedValue: @escaping (P0, P1, (() -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, CR>(wrappedValue: @escaping (P0, P1, (() -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, C0, CR>(wrappedValue: @escaping (P0, P1, ((C0) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, C0, CR>(wrappedValue: @escaping (P0, P1, ((C0) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2, C3) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2, C3) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2, C3, C4) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2, C3, C4) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3>(wrappedValue: @escaping (P0, P1, P2, P3) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, CR>(wrappedValue: @escaping (P0, P1, P2, (() -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, CR>(wrappedValue: @escaping (P0, P1, P2, (() -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2, C3) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2, C3) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4>(wrappedValue: @escaping (P0, P1, P2, P3, P4) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, CR>(wrappedValue: @escaping (P0, P1, P2, P3, (() -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, CR>(wrappedValue: @escaping (P0, P1, P2, P3, (() -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, (() -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, (() -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
}


extension JXFunc {
    public init<T, R>(wrappedValue: @escaping (T) -> () throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, R>(wrappedValue: @escaping (T) -> (P0) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, CR, R>(wrappedValue: @escaping (T) -> ((() -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, CR, R>(wrappedValue: @escaping (T) -> ((() -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, C0, CR, R>(wrappedValue: @escaping (T) -> (((C0) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, C0, CR, R>(wrappedValue: @escaping (T) -> (((C0) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, R>(wrappedValue: @escaping (T) -> (P0, P1) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, CR, R>(wrappedValue: @escaping (T) -> (P0, (() -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, CR, R>(wrappedValue: @escaping (T) -> (P0, (() -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, R>(wrappedValue: @escaping (T) -> (P0, P1, P2) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, (() -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, (() -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, (() -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, (() -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, (() -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, (() -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, (() -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<R>(wrappedValue: @escaping () throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, R>(wrappedValue: @escaping (P0) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<CR, R>(wrappedValue: @escaping ((() -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<CR, R>(wrappedValue: @escaping ((() -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<C0, CR, R>(wrappedValue: @escaping (((C0) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<C0, CR, R>(wrappedValue: @escaping (((C0) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<C0, C1, CR, R>(wrappedValue: @escaping (((C0, C1) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<C0, C1, CR, R>(wrappedValue: @escaping (((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<C0, C1, C2, CR, R>(wrappedValue: @escaping (((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<C0, C1, C2, CR, R>(wrappedValue: @escaping (((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, R>(wrappedValue: @escaping (P0, P1) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, CR, R>(wrappedValue: @escaping (P0, (() -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, CR, R>(wrappedValue: @escaping (P0, (() -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, C0, CR, R>(wrappedValue: @escaping (P0, ((C0) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, C0, CR, R>(wrappedValue: @escaping (P0, ((C0) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, CR, R>(wrappedValue: @escaping (P0, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, CR, R>(wrappedValue: @escaping (P0, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, R>(wrappedValue: @escaping (P0, P1, P2) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, CR, R>(wrappedValue: @escaping (P0, P1, (() -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, CR, R>(wrappedValue: @escaping (P0, P1, (() -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, CR, R>(wrappedValue: @escaping (P0, P1, ((C0) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, CR, R>(wrappedValue: @escaping (P0, P1, ((C0) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, R>(wrappedValue: @escaping (P0, P1, P2, P3) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, CR, R>(wrappedValue: @escaping (P0, P1, P2, (() -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, CR, R>(wrappedValue: @escaping (P0, P1, P2, (() -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, (() -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, (() -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, (() -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, (() -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, P7, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, R>(wrappedValue: @escaping (T.Type) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, R>(wrappedValue: @escaping (T.Type, P0) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, CR, R>(wrappedValue: @escaping (T.Type, (() -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, CR, R>(wrappedValue: @escaping (T.Type, (() -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, C0, CR, R>(wrappedValue: @escaping (T.Type, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, C0, CR, R>(wrappedValue: @escaping (T.Type, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1, C2, C3) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1, C2, C3) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1, C2, C3, C4) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, R>(wrappedValue: @escaping (T.Type, P0, P1) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, CR, R>(wrappedValue: @escaping (T.Type, P0, (() -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, CR, R>(wrappedValue: @escaping (T.Type, P0, (() -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1, C2, C3) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1, C2, C3) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1, C2, C3, C4) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, R>(wrappedValue: @escaping (T.Type, P0, P1, P2) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, (() -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, (() -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1, C2, C3) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1, C2, C3) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1, C2, C3, C4) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, (() -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, (() -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2, C3) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2, C3) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, (() -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, (() -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2, C3) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, (() -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, (() -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2, C3) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, C3, C4, C5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2, C3, C4, C5) -> CR)?) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}

// ASYNC_FUNCTION

 extension JXFunc {
    public init<T, R>(wrappedValue: @escaping (T) -> () async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


 extension JXFunc {
    public init<T, P0, R>(wrappedValue: @escaping (T) -> (P0) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


 extension JXFunc {
    public init<T, P0, P1, R>(wrappedValue: @escaping (T) -> (P0, P1) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, R>(wrappedValue: @escaping (T) -> (P0, P1, P2) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<R>(wrappedValue: @escaping () async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, R>(wrappedValue: @escaping (P0) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, R>(wrappedValue: @escaping (P0, P1) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, R>(wrappedValue: @escaping (P0, P1, P2) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, R>(wrappedValue: @escaping (P0, P1, P2, P3) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, P7, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, R>(wrappedValue: @escaping (T.Type) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, R>(wrappedValue: @escaping (T.Type, P0) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, R>(wrappedValue: @escaping (T.Type, P0, P1) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, R>(wrappedValue: @escaping (T.Type, P0, P1, P2) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
}
