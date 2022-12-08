// THIS FILE IS AUTO GENERATED FROM JXBridgeBuilder.swift. DO NOT EDIT
//
//		swift package plugin generate-arity JXBridgeBuilder.swift
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

extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ accessor: () -> KeyPath<T, (U0, U1)>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ getter: @escaping (T) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<U0, U1>(get getterFunc: @escaping (T) throws -> (U0, U1), set setterFunc: ((T, (U0, U1)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<U0, U1>(get getterFunc: @escaping (T) throws -> (U0, U1), set setterFunc: @escaping (T, (U0, U1)) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ accessor: () -> KeyPath<T, (U0, U1)?>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ getter: @escaping (T) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<U0, U1>(get getterFunc: @escaping (T) throws -> (U0, U1)?, set setterFunc: ((T, (U0, U1)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<U0, U1>(get getterFunc: @escaping (T) throws -> (U0, U1)?, set setterFunc: @escaping (T, (U0, U1)?) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ accessor: () -> KeyPath<T, (U0, U1, U2)>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ getter: @escaping (T) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<U0, U1, U2>(get getterFunc: @escaping (T) throws -> (U0, U1, U2), set setterFunc: ((T, (U0, U1, U2)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<U0, U1, U2>(get getterFunc: @escaping (T) throws -> (U0, U1, U2), set setterFunc: @escaping (T, (U0, U1, U2)) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ accessor: () -> KeyPath<T, (U0, U1, U2)?>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ getter: @escaping (T) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<U0, U1, U2>(get getterFunc: @escaping (T) throws -> (U0, U1, U2)?, set setterFunc: ((T, (U0, U1, U2)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<U0, U1, U2>(get getterFunc: @escaping (T) throws -> (U0, U1, U2)?, set setterFunc: @escaping (T, (U0, U1, U2)?) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<CR>(_ accessor: () -> KeyPath<T, (() -> CR)>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<CR>(_ getter: @escaping (T) throws -> (() -> CR)) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping (T) throws -> (() -> CR), set setterFunc: ((T, (() -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping (T) throws -> (() -> CR), set setterFunc: @escaping (T, (() -> CR)) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<CR>(_ accessor: () -> KeyPath<T, (() -> CR)?>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<CR>(_ getter: @escaping (T) throws -> (() -> CR)?) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping (T) throws -> (() -> CR)?, set setterFunc: ((T, (() -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping (T) throws -> (() -> CR)?, set setterFunc: @escaping (T, (() -> CR)?) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ accessor: () -> KeyPath<T, ((C0) -> CR)>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ getter: @escaping (T) throws -> ((C0) -> CR)) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping (T) throws -> ((C0) -> CR), set setterFunc: ((T, ((C0) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping (T) throws -> ((C0) -> CR), set setterFunc: @escaping (T, ((C0) -> CR)) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ accessor: () -> KeyPath<T, ((C0) -> CR)?>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ getter: @escaping (T) throws -> ((C0) -> CR)?) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping (T) throws -> ((C0) -> CR)?, set setterFunc: ((T, ((C0) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping (T) throws -> ((C0) -> CR)?, set setterFunc: @escaping (T, ((C0) -> CR)?) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ accessor: () -> KeyPath<T, ((C0, C1) -> CR)>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ getter: @escaping (T) throws -> ((C0, C1) -> CR)) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping (T) throws -> ((C0, C1) -> CR), set setterFunc: ((T, ((C0, C1) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping (T) throws -> ((C0, C1) -> CR), set setterFunc: @escaping (T, ((C0, C1) -> CR)) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ accessor: () -> KeyPath<T, ((C0, C1) -> CR)?>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ getter: @escaping (T) throws -> ((C0, C1) -> CR)?) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping (T) throws -> ((C0, C1) -> CR)?, set setterFunc: ((T, ((C0, C1) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping (T) throws -> ((C0, C1) -> CR)?, set setterFunc: @escaping (T, ((C0, C1) -> CR)?) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(_ accessor: () -> KeyPath<T, ((C0, C1, C2) -> CR)>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(_ getter: @escaping (T) throws -> ((C0, C1, C2) -> CR)) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(get getterFunc: @escaping (T) throws -> ((C0, C1, C2) -> CR), set setterFunc: ((T, ((C0, C1, C2) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(get getterFunc: @escaping (T) throws -> ((C0, C1, C2) -> CR), set setterFunc: @escaping (T, ((C0, C1, C2) -> CR)) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(_ accessor: () -> KeyPath<T, ((C0, C1, C2) -> CR)?>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(_ getter: @escaping (T) throws -> ((C0, C1, C2) -> CR)?) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(get getterFunc: @escaping (T) throws -> ((C0, C1, C2) -> CR)?, set setterFunc: ((T, ((C0, C1, C2) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(get getterFunc: @escaping (T) throws -> ((C0, C1, C2) -> CR)?, set setterFunc: @escaping (T, ((C0, C1, C2) -> CR)?) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ getterFunc: @escaping () throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<U0, U1>(get getterFunc: @escaping () throws -> (U0, U1), set setterFunc: (((U0, U1)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ getterFunc: @escaping () throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<U0, U1>(get getterFunc: @escaping () throws -> (U0, U1)?, set setterFunc: (((U0, U1)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ getterFunc: @escaping () throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<U0, U1, U2>(get getterFunc: @escaping () throws -> (U0, U1, U2), set setterFunc: (((U0, U1, U2)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ getterFunc: @escaping () throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<U0, U1, U2>(get getterFunc: @escaping () throws -> (U0, U1, U2)?, set setterFunc: (((U0, U1, U2)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<CR>(_ getterFunc: @escaping () throws -> (() -> CR)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping () throws -> (() -> CR), set setterFunc: (((() -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<CR>(_ getterFunc: @escaping () throws -> (() -> CR)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping () throws -> (() -> CR)?, set setterFunc: (((() -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ getterFunc: @escaping () throws -> ((C0) -> CR)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping () throws -> ((C0) -> CR), set setterFunc: ((((C0) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ getterFunc: @escaping () throws -> ((C0) -> CR)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping () throws -> ((C0) -> CR)?, set setterFunc: ((((C0) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ getterFunc: @escaping () throws -> ((C0, C1) -> CR)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping () throws -> ((C0, C1) -> CR), set setterFunc: ((((C0, C1) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ getterFunc: @escaping () throws -> ((C0, C1) -> CR)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping () throws -> ((C0, C1) -> CR)?, set setterFunc: ((((C0, C1) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(_ getterFunc: @escaping () throws -> ((C0, C1, C2) -> CR)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(get getterFunc: @escaping () throws -> ((C0, C1, C2) -> CR), set setterFunc: ((((C0, C1, C2) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(_ getterFunc: @escaping () throws -> ((C0, C1, C2) -> CR)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(get getterFunc: @escaping () throws -> ((C0, C1, C2) -> CR)?, set setterFunc: ((((C0, C1, C2) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ getter: @escaping (T.Type) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<U0, U1>(get getterFunc: @escaping (T.Type) throws -> (U0, U1), set setterFunc: ((T.Type, (U0, U1)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ getter: @escaping (T.Type) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<U0, U1>(get getterFunc: @escaping (T.Type) throws -> (U0, U1)?, set setterFunc: ((T.Type, (U0, U1)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ getter: @escaping (T.Type) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<U0, U1, U2>(get getterFunc: @escaping (T.Type) throws -> (U0, U1, U2), set setterFunc: ((T.Type, (U0, U1, U2)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ getter: @escaping (T.Type) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<U0, U1, U2>(get getterFunc: @escaping (T.Type) throws -> (U0, U1, U2)?, set setterFunc: ((T.Type, (U0, U1, U2)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<CR>(_ getter: @escaping (T.Type) throws -> (() -> CR)) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping (T.Type) throws -> (() -> CR), set setterFunc: ((T.Type, (() -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<CR>(_ getter: @escaping (T.Type) throws -> (() -> CR)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<CR>(get getterFunc: @escaping (T.Type) throws -> (() -> CR)?, set setterFunc: ((T.Type, (() -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ getter: @escaping (T.Type) throws -> ((C0) -> CR)) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping (T.Type) throws -> ((C0) -> CR), set setterFunc: ((T.Type, ((C0) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, CR>(_ getter: @escaping (T.Type) throws -> ((C0) -> CR)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, CR>(get getterFunc: @escaping (T.Type) throws -> ((C0) -> CR)?, set setterFunc: ((T.Type, ((C0) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ getter: @escaping (T.Type) throws -> ((C0, C1) -> CR)) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping (T.Type) throws -> ((C0, C1) -> CR), set setterFunc: ((T.Type, ((C0, C1) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, C1, CR>(_ getter: @escaping (T.Type) throws -> ((C0, C1) -> CR)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, CR>(get getterFunc: @escaping (T.Type) throws -> ((C0, C1) -> CR)?, set setterFunc: ((T.Type, ((C0, C1) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(_ getter: @escaping (T.Type) throws -> ((C0, C1, C2) -> CR)) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(get getterFunc: @escaping (T.Type) throws -> ((C0, C1, C2) -> CR), set setterFunc: ((T.Type, ((C0, C1, C2) -> CR)) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(_ getter: @escaping (T.Type) throws -> ((C0, C1, C2) -> CR)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<C0, C1, C2, CR>(get getterFunc: @escaping (T.Type) throws -> ((C0, C1, C2) -> CR)?, set setterFunc: ((T.Type, ((C0, C1, C2) -> CR)?) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}

// ASYNC_PROPERTY

extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ getter: @escaping (T) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getter))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ getter: @escaping (T) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getter))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ getter: @escaping (T) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getter))
    }
}


extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ getter: @escaping (T) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getter))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ getterFunc: @escaping () async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
 
    // builder.static.var.xxx { await Type.xxx }
    @discardableResult public func callAsFunction<U0, U1>(get getterFunc: @escaping () async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ getterFunc: @escaping () async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
 
    // builder.static.var.xxx { await Type.xxx }
    @discardableResult public func callAsFunction<U0, U1>(get getterFunc: @escaping () async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ getterFunc: @escaping () async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
 
    // builder.static.var.xxx { await Type.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(get getterFunc: @escaping () async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
}


extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ getterFunc: @escaping () async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
 
    // builder.static.var.xxx { await Type.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(get getterFunc: @escaping () async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ getter: @escaping (T.Type) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<U0, U1>(_ getter: @escaping (T.Type) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ getter: @escaping (T.Type) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter))
    }
}


extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ getter: @escaping (T.Type) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter))
    }
}

// INIT

extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<C0, C1, CR>(_ cons: @escaping () -> (((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<C0, C1, CR>(_ cons: @escaping (((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<C0, C1, CR>(_ cons: @escaping () -> (((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<C0, C1, CR>(_ cons: @escaping (((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<C0, C1, C2, CR>(_ cons: @escaping () -> (((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<C0, C1, C2, CR>(_ cons: @escaping (((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<C0, C1, C2, CR>(_ cons: @escaping () -> (((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<C0, C1, C2, CR>(_ cons: @escaping (((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, C0, C1, CR>(_ cons: @escaping () -> (P0, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, C0, C1, CR>(_ cons: @escaping (P0, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, C0, C1, CR>(_ cons: @escaping () -> (P0, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, C0, C1, CR>(_ cons: @escaping (P0, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, C0, C1, C2, CR>(_ cons: @escaping (P0, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, C0, C1, C2, CR>(_ cons: @escaping (P0, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, C0, C1, CR>(_ cons: @escaping () -> (P0, P1, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, C0, C1, CR>(_ cons: @escaping (P0, P1, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, C0, C1, CR>(_ cons: @escaping () -> (P0, P1, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, C0, C1, CR>(_ cons: @escaping (P0, P1, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, P1, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, P1, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, C0, C1, CR>(_ cons: @escaping () -> (P0, P1, P2, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, C0, C1, CR>(_ cons: @escaping () -> (P0, P1, P2, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, C0, C1, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, C0, C1, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, C0, C1, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, C0, C1, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, C0, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, C0, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, C0, C1, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, C0, C1, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, P7>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, P7>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, C0, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, C0, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, C0, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}


extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}

// FUNCTION

extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping () -> (T) -> () throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping (T) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping () -> (T) -> () throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping (T) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping () -> (T) -> () throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping (T) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping () -> (T) -> (P0) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (T, P0) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (T, P0) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (T, P0) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (T, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (T, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (T, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (T, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (T, P0, P1) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (T, P0, P1) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (T, P0, P1) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (T, P0, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (T, P0, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (T, P0, P1, P2) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping (inout T) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping (inout T) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping (inout T) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (inout T, P0) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (inout T, P0) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (inout T, P0) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (inout T, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (inout T, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (inout T, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (inout T, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (inout T, P0, P1) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (inout T, P0, P1) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (inout T, P0, P1) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (inout T, P0, P1, P2) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (inout T, P0, P1, P2) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (inout T, P0, P1, P2) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (inout T, P0, P1, P2, P3) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (inout T, P0, P1, P2, P3) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (inout T, P0, P1, P2, P3) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (inout T, P0, P1, P2, P3, P4) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (inout T, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (inout T, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping () -> () throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping () throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping () -> () throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping () throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping () -> () throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping () throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping () -> (P0) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (P0) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping () -> (P0) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (P0) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping () -> (P0) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (P0) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping () -> (((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping () -> (((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping () -> (((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping () -> (((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping () -> (P0, P1) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (P0, P1) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping () -> (P0, P1) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (P0, P1) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping () -> (P0, P1) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (P0, P1) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping () -> (P0, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (P0, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping () -> (P0, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (P0, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (P0, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (P0, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping () -> (P0, P1, P2) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (P0, P1, P2) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (P0, P1, P2) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (P0, P1, P2) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (P0, P1, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (P0, P1, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (P0, P1, P2, P3) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping (T.Type) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping (T.Type) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping (T.Type) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (T.Type, P0) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (T.Type, P0) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (T.Type, P0) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (T.Type, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, CR, R>(_ f: @escaping (T.Type, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (T.Type, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<C0, C1, C2, CR, R>(_ f: @escaping (T.Type, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (T.Type, P0, P1) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, (() -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, (() -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, C0, C1, C2, CR, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, ((C0, C1, C2) -> CR)?) throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}

// ASYNC_FUNCTION

extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping () -> (T) -> () async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping (T) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping () -> (T) -> () async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping (T) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping () -> (T) -> () async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping (T) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping () -> (T) -> (P0) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (T, P0) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (T, P0) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (T, P0) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (T, P0, P1) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (T, P0, P1) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (T, P0, P1) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (T, P0, P1, P2) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping () -> () async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping () async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping () -> () async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping () async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping () -> () async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping () async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping () -> (P0) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (P0) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping () -> (P0) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (P0) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping () -> (P0) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (P0) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping () -> (P0, P1) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (P0, P1) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping () -> (P0, P1) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (P0, P1) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping () -> (P0, P1) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (P0, P1) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping () -> (P0, P1, P2) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (P0, P1, P2) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (P0, P1, P2) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (P0, P1, P2) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (P0, P1, P2, P3) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1>(_ f: @escaping (T.Type) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping (T.Type) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<U0, U1, U2>(_ f: @escaping (T.Type) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1>(_ f: @escaping (T.Type, P0) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (T.Type, P0) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, U0, U1, U2>(_ f: @escaping (T.Type, P0) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1>(_ f: @escaping (T.Type, P0, P1) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}


extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, U0, U1, U2>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> (U0, U1, U2)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}
