// THIS FILE IS AUTO GENERATED FROM JXPropertyWrappers.swift. DO NOT EDIT
//
//		swift package plugin generate-arity JXPropertyWrappers.swift
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

extension JXVar {
    public init<T, U0, U1>(wrappedValue: (get: (T) throws -> (U0, U1), set: ((T, (U0, U1)) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, U0, U1>(wrappedValue: @escaping (T) throws -> (U0, U1), _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, U0, U1>(wrappedValue: (get: (T) throws -> (U0, U1)?, set: ((T, (U0, U1)?) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, U0, U1>(wrappedValue: @escaping (T) throws -> (U0, U1)?, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, U0, U1, U2>(wrappedValue: (get: (T) throws -> (U0, U1, U2), set: ((T, (U0, U1, U2)) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T) throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, U0, U1, U2>(wrappedValue: (get: (T) throws -> (U0, U1, U2)?, set: ((T, (U0, U1, U2)?) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T) throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, CR>(wrappedValue: (get: (T) throws -> (() -> CR), set: ((T, (() -> CR)) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, CR>(wrappedValue: @escaping (T) throws -> (() -> CR), _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, CR>(wrappedValue: (get: (T) throws -> (() -> CR)?, set: ((T, (() -> CR)?) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, CR>(wrappedValue: @escaping (T) throws -> (() -> CR)?, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, C0, CR>(wrappedValue: (get: (T) throws -> ((C0) -> CR), set: ((T, ((C0) -> CR)) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, C0, CR>(wrappedValue: @escaping (T) throws -> ((C0) -> CR), _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, C0, CR>(wrappedValue: (get: (T) throws -> ((C0) -> CR)?, set: ((T, ((C0) -> CR)?) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, C0, CR>(wrappedValue: @escaping (T) throws -> ((C0) -> CR)?, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, C0, C1, CR>(wrappedValue: (get: (T) throws -> ((C0, C1) -> CR), set: ((T, ((C0, C1) -> CR)) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, C0, C1, CR>(wrappedValue: @escaping (T) throws -> ((C0, C1) -> CR), _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, C0, C1, CR>(wrappedValue: (get: (T) throws -> ((C0, C1) -> CR)?, set: ((T, ((C0, C1) -> CR)?) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, C0, C1, CR>(wrappedValue: @escaping (T) throws -> ((C0, C1) -> CR)?, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, C0, C1, C2, CR>(wrappedValue: (get: (T) throws -> ((C0, C1, C2) -> CR), set: ((T, ((C0, C1, C2) -> CR)) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, C0, C1, C2, CR>(wrappedValue: @escaping (T) throws -> ((C0, C1, C2) -> CR), _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXVar {
    public init<T, C0, C1, C2, CR>(wrappedValue: (get: (T) throws -> ((C0, C1, C2) -> CR)?, set: ((T, ((C0, C1, C2) -> CR)?) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, C0, C1, C2, CR>(wrappedValue: @escaping (T) throws -> ((C0, C1, C2) -> CR)?, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXStaticVar {
    public init<U0, U1>(wrappedValue: (get: () throws -> (U0, U1), set: (((U0, U1)) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<U0, U1>(wrappedValue: @escaping () throws -> (U0, U1)) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<U0, U1>(wrappedValue: (get: () throws -> (U0, U1)?, set: (((U0, U1)?) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<U0, U1>(wrappedValue: @escaping () throws -> (U0, U1)?) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<U0, U1, U2>(wrappedValue: (get: () throws -> (U0, U1, U2), set: (((U0, U1, U2)) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<U0, U1, U2>(wrappedValue: @escaping () throws -> (U0, U1, U2)) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<U0, U1, U2>(wrappedValue: (get: () throws -> (U0, U1, U2)?, set: (((U0, U1, U2)?) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<U0, U1, U2>(wrappedValue: @escaping () throws -> (U0, U1, U2)?) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<CR>(wrappedValue: (get: () throws -> (() -> CR), set: (((() -> CR)) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<CR>(wrappedValue: @escaping () throws -> (() -> CR)) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<CR>(wrappedValue: (get: () throws -> (() -> CR)?, set: (((() -> CR)?) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<CR>(wrappedValue: @escaping () throws -> (() -> CR)?) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<C0, CR>(wrappedValue: (get: () throws -> ((C0) -> CR), set: ((((C0) -> CR)) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<C0, CR>(wrappedValue: @escaping () throws -> ((C0) -> CR)) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<C0, CR>(wrappedValue: (get: () throws -> ((C0) -> CR)?, set: ((((C0) -> CR)?) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<C0, CR>(wrappedValue: @escaping () throws -> ((C0) -> CR)?) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<C0, C1, CR>(wrappedValue: (get: () throws -> ((C0, C1) -> CR), set: ((((C0, C1) -> CR)) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<C0, C1, CR>(wrappedValue: @escaping () throws -> ((C0, C1) -> CR)) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<C0, C1, CR>(wrappedValue: (get: () throws -> ((C0, C1) -> CR)?, set: ((((C0, C1) -> CR)?) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<C0, C1, CR>(wrappedValue: @escaping () throws -> ((C0, C1) -> CR)?) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<C0, C1, C2, CR>(wrappedValue: (get: () throws -> ((C0, C1, C2) -> CR), set: ((((C0, C1, C2) -> CR)) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<C0, C1, C2, CR>(wrappedValue: @escaping () throws -> ((C0, C1, C2) -> CR)) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXStaticVar {
    public init<C0, C1, C2, CR>(wrappedValue: (get: () throws -> ((C0, C1, C2) -> CR)?, set: ((((C0, C1, C2) -> CR)?) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<C0, C1, C2, CR>(wrappedValue: @escaping () throws -> ((C0, C1, C2) -> CR)?) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}


extension JXClassVar {
    public init<T, U0, U1>(wrappedValue: (get: (T.Type) throws -> (U0, U1), set: ((T.Type, (U0, U1)) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, U0, U1>(wrappedValue: @escaping (T.Type) throws -> (U0, U1), _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, U0, U1>(wrappedValue: (get: (T.Type) throws -> (U0, U1)?, set: ((T.Type, (U0, U1)?) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, U0, U1>(wrappedValue: @escaping (T.Type) throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, U0, U1, U2>(wrappedValue: (get: (T.Type) throws -> (U0, U1, U2), set: ((T.Type, (U0, U1, U2)) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T.Type) throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, U0, U1, U2>(wrappedValue: (get: (T.Type) throws -> (U0, U1, U2)?, set: ((T.Type, (U0, U1, U2)?) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T.Type) throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, CR>(wrappedValue: (get: (T.Type) throws -> (() -> CR), set: ((T.Type, (() -> CR)) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, CR>(wrappedValue: @escaping (T.Type) throws -> (() -> CR), _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, CR>(wrappedValue: (get: (T.Type) throws -> (() -> CR)?, set: ((T.Type, (() -> CR)?) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, CR>(wrappedValue: @escaping (T.Type) throws -> (() -> CR)?, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, C0, CR>(wrappedValue: (get: (T.Type) throws -> ((C0) -> CR), set: ((T.Type, ((C0) -> CR)) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, C0, CR>(wrappedValue: @escaping (T.Type) throws -> ((C0) -> CR), _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, C0, CR>(wrappedValue: (get: (T.Type) throws -> ((C0) -> CR)?, set: ((T.Type, ((C0) -> CR)?) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, C0, CR>(wrappedValue: @escaping (T.Type) throws -> ((C0) -> CR)?, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, C0, C1, CR>(wrappedValue: (get: (T.Type) throws -> ((C0, C1) -> CR), set: ((T.Type, ((C0, C1) -> CR)) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, C0, C1, CR>(wrappedValue: @escaping (T.Type) throws -> ((C0, C1) -> CR), _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, C0, C1, CR>(wrappedValue: (get: (T.Type) throws -> ((C0, C1) -> CR)?, set: ((T.Type, ((C0, C1) -> CR)?) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, C0, C1, CR>(wrappedValue: @escaping (T.Type) throws -> ((C0, C1) -> CR)?, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, C0, C1, C2, CR>(wrappedValue: (get: (T.Type) throws -> ((C0, C1, C2) -> CR), set: ((T.Type, ((C0, C1, C2) -> CR)) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, C0, C1, C2, CR>(wrappedValue: @escaping (T.Type) throws -> ((C0, C1, C2) -> CR), _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXClassVar {
    public init<T, C0, C1, C2, CR>(wrappedValue: (get: (T.Type) throws -> ((C0, C1, C2) -> CR)?, set: ((T.Type, ((C0, C1, C2) -> CR)?) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, C0, C1, C2, CR>(wrappedValue: @escaping (T.Type) throws -> ((C0, C1, C2) -> CR)?, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}


extension JXKeyPath {
    public init<T, U0, U1>(wrappedValue: KeyPath<T, (U0, U1)>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}


extension JXKeyPath {
    public init<T, U0, U1>(wrappedValue: KeyPath<T, (U0, U1)?>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}


extension JXKeyPath {
    public init<T, U0, U1, U2>(wrappedValue: KeyPath<T, (U0, U1, U2)>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}


extension JXKeyPath {
    public init<T, U0, U1, U2>(wrappedValue: KeyPath<T, (U0, U1, U2)?>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}


extension JXKeyPath {
    public init<T, CR>(wrappedValue: KeyPath<T, (() -> CR)>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}


extension JXKeyPath {
    public init<T, CR>(wrappedValue: KeyPath<T, (() -> CR)?>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}


extension JXKeyPath {
    public init<T, C0, CR>(wrappedValue: KeyPath<T, ((C0) -> CR)>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}


extension JXKeyPath {
    public init<T, C0, CR>(wrappedValue: KeyPath<T, ((C0) -> CR)?>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}


extension JXKeyPath {
    public init<T, C0, C1, CR>(wrappedValue: KeyPath<T, ((C0, C1) -> CR)>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}


extension JXKeyPath {
    public init<T, C0, C1, CR>(wrappedValue: KeyPath<T, ((C0, C1) -> CR)?>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}


extension JXKeyPath {
    public init<T, C0, C1, C2, CR>(wrappedValue: KeyPath<T, ((C0, C1, C2) -> CR)>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}


extension JXKeyPath {
    public init<T, C0, C1, C2, CR>(wrappedValue: KeyPath<T, ((C0, C1, C2) -> CR)?>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}

// ASYNC_PROPERTY

extension JXVar {
    public init<T, U0, U1>(wrappedValue: @escaping (T) async throws -> (U0, U1), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue) })
    }
}


extension JXVar {
    public init<T, U0, U1>(wrappedValue: @escaping (T) async throws -> (U0, U1)?, _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue) })
    }
}


extension JXVar {
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T) async throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue) })
    }
}


extension JXVar {
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T) async throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue) })
    }
}


extension JXStaticVar {
    public init<U0, U1>(wrappedValue: @escaping () async throws -> (U0, U1)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue) })
    }
}


extension JXStaticVar {
    public init<U0, U1>(wrappedValue: @escaping () async throws -> (U0, U1)?) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue) })
    }
}


extension JXStaticVar {
    public init<U0, U1, U2>(wrappedValue: @escaping () async throws -> (U0, U1, U2)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue) })
    }
}


extension JXStaticVar {
    public init<U0, U1, U2>(wrappedValue: @escaping () async throws -> (U0, U1, U2)?) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue) })
    }
}


extension JXClassVar {
    public init<T, U0, U1>(wrappedValue: @escaping ((U0, U1).Type) async throws -> (U0, U1), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue) })
    }
}


extension JXClassVar {
    public init<T, U0, U1>(wrappedValue: @escaping ((U0, U1)?.Type) async throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue) })
    }
}


extension JXClassVar {
    public init<T, U0, U1, U2>(wrappedValue: @escaping ((U0, U1, U2).Type) async throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue) })
    }
}


extension JXClassVar {
    public init<T, U0, U1, U2>(wrappedValue: @escaping ((U0, U1, U2)?.Type) async throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue) })
    }
}

// INIT

extension JXInit {
    public init<T, C0, C1, CR>(wrappedValue: @escaping (((C0, C1) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, C0, C1, CR>(wrappedValue: @escaping (((C0, C1) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, C0, C1, C2, CR>(wrappedValue: @escaping (((C0, C1, C2) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, C0, C1, C2, CR>(wrappedValue: @escaping (((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, C0, C1, CR>(wrappedValue: @escaping (P0, ((C0, C1) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, C0, C1, CR>(wrappedValue: @escaping (P0, ((C0, C1) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, C0, C1, C2, CR>(wrappedValue: @escaping (P0, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, C0, C1, C2, CR>(wrappedValue: @escaping (P0, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}


extension JXInit {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}

// FUNCTION

extension JXFunc {
    public init<T, U0, U1>(wrappedValue: @escaping (T) -> () throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T) -> () throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T) -> () throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, U0, U1>(wrappedValue: @escaping (T) -> (P0) throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0) throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0) throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1, C2) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1) throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1) throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1) throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2) throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2) throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2) throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<U0, U1>(wrappedValue: @escaping () throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<U0, U1, U2>(wrappedValue: @escaping () throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<U0, U1, U2>(wrappedValue: @escaping () throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, U0, U1>(wrappedValue: @escaping (P0) throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, U0, U1, U2>(wrappedValue: @escaping (P0) throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, U0, U1, U2>(wrappedValue: @escaping (P0) throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<C0, C1, CR, R>(wrappedValue: @escaping (((C0, C1) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<C0, C1, CR, R>(wrappedValue: @escaping (((C0, C1) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<C0, C1, C2, CR, R>(wrappedValue: @escaping (((C0, C1, C2) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<C0, C1, C2, CR, R>(wrappedValue: @escaping (((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, U0, U1>(wrappedValue: @escaping (P0, P1) throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, U0, U1, U2>(wrappedValue: @escaping (P0, P1) throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, U0, U1, U2>(wrappedValue: @escaping (P0, P1) throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, CR, R>(wrappedValue: @escaping (P0, ((C0, C1) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, CR, R>(wrappedValue: @escaping (P0, ((C0, C1) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, U0, U1>(wrappedValue: @escaping (P0, P1, P2) throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2) throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2) throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3) throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3) throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3) throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4) throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, P7, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, U0, U1>(wrappedValue: @escaping (T.Type) throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T.Type) throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T.Type) throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, U0, U1>(wrappedValue: @escaping (T.Type, P0) throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0) throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0) throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1) throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1) throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1) throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2) throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2) throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2) throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}

// ASYNC_FUNCTION

 extension JXFunc {
    public init<T, U0, U1>(wrappedValue: @escaping (T) -> () async throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T) -> () async throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T) -> () async throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, U0, U1>(wrappedValue: @escaping (T) -> (P0) async throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0) async throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0) async throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1) async throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1) async throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1) async throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2) async throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2) async throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2) async throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) async throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) async throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) async throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


 extension JXFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)?) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<U0, U1>(wrappedValue: @escaping () async throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<U0, U1, U2>(wrappedValue: @escaping () async throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<U0, U1, U2>(wrappedValue: @escaping () async throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, U0, U1>(wrappedValue: @escaping (P0) async throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, U0, U1, U2>(wrappedValue: @escaping (P0) async throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, U0, U1, U2>(wrappedValue: @escaping (P0) async throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, U0, U1>(wrappedValue: @escaping (P0, P1) async throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, U0, U1, U2>(wrappedValue: @escaping (P0, P1) async throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, U0, U1, U2>(wrappedValue: @escaping (P0, P1) async throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, U0, U1>(wrappedValue: @escaping (P0, P1, P2) async throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2) async throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2) async throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3) async throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3) async throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3) async throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4) async throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, P7, R>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXStaticFunc {
    public init<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)?) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, U0, U1>(wrappedValue: @escaping (T.Type) async throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T.Type) async throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, U0, U1, U2>(wrappedValue: @escaping (T.Type) async throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, U0, U1>(wrappedValue: @escaping (T.Type, P0) async throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0) async throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0) async throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1) async throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1) async throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1) async throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2) async throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2) async throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2) async throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) async throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) async throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) async throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, R>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2), _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}


extension JXClassFunc {
    public init<T, P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)?, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}
