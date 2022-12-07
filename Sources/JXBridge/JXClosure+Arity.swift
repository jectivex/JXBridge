// THIS FILE IS AUTO GENERATED FROM JXClosure.swift. DO NOT EDIT
//
//		swift package plugin generate-arity JXClosure.swift
//			-maximumFunctionParameters 8
//			-maximumTupleArity 2
//			-optionalTuples 0
//			-propertyTuples 0
//			-returnTuples 1
//			-maximumJXTupleArity 6
//			-maximumClosureParameters 2
//			-maximumThrowingClosureParameters -1
//			-optionalClosures 1
//			-propertyClosures 1
//			-trailingClosures 1
//			-asyncMemberClosures 0
//			-maximumJXClosureParameters 6

import JXKit

// CLOSURE_SUPPORT

 extension JXClosure {
    /// `JXConvertible` wrapper around a non-throwing closure of arity 0.
    public struct Arity0<R>: JXConvertible {
        public let closure: () -> R
        
        public init(_ closure: @escaping () -> R) {
            self.closure = closure
        }
        
        public init?(_ closure: (() -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity0<R> {
            return try Arity0(value.convey(to: (() -> R).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
 
    /// `JXConvertible` wrapper around a throwing closure of arity 0.
    public struct Throwing0<R>: JXConvertible {
        public let closure: () throws -> R
     
        public init(_ closure: @escaping () throws -> R) {
            self.closure = closure
        }
     
        public init?(_ closure: (() throws -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
     
        public static func fromJX(_ value: JXValue) throws -> Throwing0<R> {
            return try Throwing0(value.convey(to: (() throws -> R).self))
        }
     
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
}
 
extension JXContext {
    /// Attempts to convey the given closure or function into this JavaScript context as a function.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyClosure<R>(_ f: (() throws -> R)?) throws -> JXValue {
        guard let f else {
            return null()
        }
        return JXValue(newFunctionIn: self) { context, _, args in
            try validate(arguments: args, count: 0)
            let _ = try conveyParameters(args)
            let r = try f()
            return try context.convey(r)
        }
    }
}
 
extension JXValue {
    /// Attempts to convey this JavaScript value to a closure with 0 parameters. This value must be a function.
    public func convey<R>(to type: (() -> R).Type = (() -> R).self) throws -> () -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { () in
            do {
                let rvalue = try self.call(withArguments: [])
                let r = try rvalue.convey(to: R.self)
                return r
            } catch {
                // Is there anything else we could possibly do here?
                fatalError("Fatal: Caught an error invoking a JavaScript function conveyed to a native closure that does not throw. \(String(describing: error))")
            }
        }
    }
 
    /// Attempts to convey this JavaScript value to a closure with 0 parameters. This value must be a function.
    public func convey<R>(to type: (() throws -> R).Type = (() throws -> R).self) throws -> () throws -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { () in
            let rvalue = try self.call(withArguments: [])
            let r = try rvalue.convey(to: R.self)
            return r
        }
    }
}


 extension JXClosure {
    /// `JXConvertible` wrapper around a non-throwing closure of arity 1.
    public struct Arity1<P0, R>: JXConvertible {
        public let closure: (P0) -> R
        
        public init(_ closure: @escaping (P0) -> R) {
            self.closure = closure
        }
        
        public init?(_ closure: ((P0) -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity1<P0, R> {
            return try Arity1(value.convey(to: ((P0) -> R).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
 
    /// `JXConvertible` wrapper around a throwing closure of arity 1.
    public struct Throwing1<P0, R>: JXConvertible {
        public let closure: (P0) throws -> R
     
        public init(_ closure: @escaping (P0) throws -> R) {
            self.closure = closure
        }
     
        public init?(_ closure: ((P0) throws -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
     
        public static func fromJX(_ value: JXValue) throws -> Throwing1<P0, R> {
            return try Throwing1(value.convey(to: ((P0) throws -> R).self))
        }
     
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
}
 
extension JXContext {
    /// Attempts to convey the given closure or function into this JavaScript context as a function.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyClosure<P0, R>(_ f: ((P0) throws -> R)?) throws -> JXValue {
        guard let f else {
            return null()
        }
        return JXValue(newFunctionIn: self) { context, _, args in
            try validate(arguments: args, count: 1)
            let p = try conveyParameters(args, P0.self)
            let r = try f(p)
            return try context.convey(r)
        }
    }
}
 
extension JXValue {
    /// Attempts to convey this JavaScript value to a closure with 1 parameters. This value must be a function.
    public func convey<P0, R>(to type: ((P0) -> R).Type = ((P0) -> R).self) throws -> (P0) -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (p0) in
            do {
                let rvalue = try self.call(withArguments: [p0])
                let r = try rvalue.convey(to: R.self)
                return r
            } catch {
                // Is there anything else we could possibly do here?
                fatalError("Fatal: Caught an error invoking a JavaScript function conveyed to a native closure that does not throw. \(String(describing: error))")
            }
        }
    }
 
    /// Attempts to convey this JavaScript value to a closure with 1 parameters. This value must be a function.
    public func convey<P0, R>(to type: ((P0) throws -> R).Type = ((P0) throws -> R).self) throws -> (P0) throws -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (p0) in
            let rvalue = try self.call(withArguments: [p0])
            let r = try rvalue.convey(to: R.self)
            return r
        }
    }
}


 extension JXClosure {
    /// `JXConvertible` wrapper around a non-throwing closure of arity 2.
    public struct Arity2<P0, P1, R>: JXConvertible {
        public let closure: (P0, P1) -> R
        
        public init(_ closure: @escaping (P0, P1) -> R) {
            self.closure = closure
        }
        
        public init?(_ closure: ((P0, P1) -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity2<P0, P1, R> {
            return try Arity2(value.convey(to: ((P0, P1) -> R).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
 
    /// `JXConvertible` wrapper around a throwing closure of arity 2.
    public struct Throwing2<P0, P1, R>: JXConvertible {
        public let closure: (P0, P1) throws -> R
     
        public init(_ closure: @escaping (P0, P1) throws -> R) {
            self.closure = closure
        }
     
        public init?(_ closure: ((P0, P1) throws -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
     
        public static func fromJX(_ value: JXValue) throws -> Throwing2<P0, P1, R> {
            return try Throwing2(value.convey(to: ((P0, P1) throws -> R).self))
        }
     
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
}
 
extension JXContext {
    /// Attempts to convey the given closure or function into this JavaScript context as a function.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyClosure<P0, P1, R>(_ f: ((P0, P1) throws -> R)?) throws -> JXValue {
        guard let f else {
            return null()
        }
        return JXValue(newFunctionIn: self) { context, _, args in
            try validate(arguments: args, count: 2)
            let p = try conveyParameters(args, P0.self, P1.self)
            let r = try f(p.0, p.1)
            return try context.convey(r)
        }
    }
}
 
extension JXValue {
    /// Attempts to convey this JavaScript value to a closure with 2 parameters. This value must be a function.
    public func convey<P0, P1, R>(to type: ((P0, P1) -> R).Type = ((P0, P1) -> R).self) throws -> (P0, P1) -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (p0, p1) in
            do {
                let rvalue = try self.call(withArguments: [p0, p1])
                let r = try rvalue.convey(to: R.self)
                return r
            } catch {
                // Is there anything else we could possibly do here?
                fatalError("Fatal: Caught an error invoking a JavaScript function conveyed to a native closure that does not throw. \(String(describing: error))")
            }
        }
    }
 
    /// Attempts to convey this JavaScript value to a closure with 2 parameters. This value must be a function.
    public func convey<P0, P1, R>(to type: ((P0, P1) throws -> R).Type = ((P0, P1) throws -> R).self) throws -> (P0, P1) throws -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (p0, p1) in
            let rvalue = try self.call(withArguments: [p0, p1])
            let r = try rvalue.convey(to: R.self)
            return r
        }
    }
}


 extension JXClosure {
    /// `JXConvertible` wrapper around a non-throwing closure of arity 3.
    public struct Arity3<P0, P1, P2, R>: JXConvertible {
        public let closure: (P0, P1, P2) -> R
        
        public init(_ closure: @escaping (P0, P1, P2) -> R) {
            self.closure = closure
        }
        
        public init?(_ closure: ((P0, P1, P2) -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity3<P0, P1, P2, R> {
            return try Arity3(value.convey(to: ((P0, P1, P2) -> R).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
 
    /// `JXConvertible` wrapper around a throwing closure of arity 3.
    public struct Throwing3<P0, P1, P2, R>: JXConvertible {
        public let closure: (P0, P1, P2) throws -> R
     
        public init(_ closure: @escaping (P0, P1, P2) throws -> R) {
            self.closure = closure
        }
     
        public init?(_ closure: ((P0, P1, P2) throws -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
     
        public static func fromJX(_ value: JXValue) throws -> Throwing3<P0, P1, P2, R> {
            return try Throwing3(value.convey(to: ((P0, P1, P2) throws -> R).self))
        }
     
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
}
 
extension JXContext {
    /// Attempts to convey the given closure or function into this JavaScript context as a function.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyClosure<P0, P1, P2, R>(_ f: ((P0, P1, P2) throws -> R)?) throws -> JXValue {
        guard let f else {
            return null()
        }
        return JXValue(newFunctionIn: self) { context, _, args in
            try validate(arguments: args, count: 3)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self)
            let r = try f(p.0, p.1, p.2)
            return try context.convey(r)
        }
    }
}
 
extension JXValue {
    /// Attempts to convey this JavaScript value to a closure with 3 parameters. This value must be a function.
    public func convey<P0, P1, P2, R>(to type: ((P0, P1, P2) -> R).Type = ((P0, P1, P2) -> R).self) throws -> (P0, P1, P2) -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (p0, p1, p2) in
            do {
                let rvalue = try self.call(withArguments: [p0, p1, p2])
                let r = try rvalue.convey(to: R.self)
                return r
            } catch {
                // Is there anything else we could possibly do here?
                fatalError("Fatal: Caught an error invoking a JavaScript function conveyed to a native closure that does not throw. \(String(describing: error))")
            }
        }
    }
 
    /// Attempts to convey this JavaScript value to a closure with 3 parameters. This value must be a function.
    public func convey<P0, P1, P2, R>(to type: ((P0, P1, P2) throws -> R).Type = ((P0, P1, P2) throws -> R).self) throws -> (P0, P1, P2) throws -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (p0, p1, p2) in
            let rvalue = try self.call(withArguments: [p0, p1, p2])
            let r = try rvalue.convey(to: R.self)
            return r
        }
    }
}


 extension JXClosure {
    /// `JXConvertible` wrapper around a non-throwing closure of arity 4.
    public struct Arity4<P0, P1, P2, P3, R>: JXConvertible {
        public let closure: (P0, P1, P2, P3) -> R
        
        public init(_ closure: @escaping (P0, P1, P2, P3) -> R) {
            self.closure = closure
        }
        
        public init?(_ closure: ((P0, P1, P2, P3) -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity4<P0, P1, P2, P3, R> {
            return try Arity4(value.convey(to: ((P0, P1, P2, P3) -> R).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
 
    /// `JXConvertible` wrapper around a throwing closure of arity 4.
    public struct Throwing4<P0, P1, P2, P3, R>: JXConvertible {
        public let closure: (P0, P1, P2, P3) throws -> R
     
        public init(_ closure: @escaping (P0, P1, P2, P3) throws -> R) {
            self.closure = closure
        }
     
        public init?(_ closure: ((P0, P1, P2, P3) throws -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
     
        public static func fromJX(_ value: JXValue) throws -> Throwing4<P0, P1, P2, P3, R> {
            return try Throwing4(value.convey(to: ((P0, P1, P2, P3) throws -> R).self))
        }
     
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
}
 
extension JXContext {
    /// Attempts to convey the given closure or function into this JavaScript context as a function.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyClosure<P0, P1, P2, P3, R>(_ f: ((P0, P1, P2, P3) throws -> R)?) throws -> JXValue {
        guard let f else {
            return null()
        }
        return JXValue(newFunctionIn: self) { context, _, args in
            try validate(arguments: args, count: 4)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self)
            let r = try f(p.0, p.1, p.2, p.3)
            return try context.convey(r)
        }
    }
}
 
extension JXValue {
    /// Attempts to convey this JavaScript value to a closure with 4 parameters. This value must be a function.
    public func convey<P0, P1, P2, P3, R>(to type: ((P0, P1, P2, P3) -> R).Type = ((P0, P1, P2, P3) -> R).self) throws -> (P0, P1, P2, P3) -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (p0, p1, p2, p3) in
            do {
                let rvalue = try self.call(withArguments: [p0, p1, p2, p3])
                let r = try rvalue.convey(to: R.self)
                return r
            } catch {
                // Is there anything else we could possibly do here?
                fatalError("Fatal: Caught an error invoking a JavaScript function conveyed to a native closure that does not throw. \(String(describing: error))")
            }
        }
    }
 
    /// Attempts to convey this JavaScript value to a closure with 4 parameters. This value must be a function.
    public func convey<P0, P1, P2, P3, R>(to type: ((P0, P1, P2, P3) throws -> R).Type = ((P0, P1, P2, P3) throws -> R).self) throws -> (P0, P1, P2, P3) throws -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (p0, p1, p2, p3) in
            let rvalue = try self.call(withArguments: [p0, p1, p2, p3])
            let r = try rvalue.convey(to: R.self)
            return r
        }
    }
}


 extension JXClosure {
    /// `JXConvertible` wrapper around a non-throwing closure of arity 5.
    public struct Arity5<P0, P1, P2, P3, P4, R>: JXConvertible {
        public let closure: (P0, P1, P2, P3, P4) -> R
        
        public init(_ closure: @escaping (P0, P1, P2, P3, P4) -> R) {
            self.closure = closure
        }
        
        public init?(_ closure: ((P0, P1, P2, P3, P4) -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity5<P0, P1, P2, P3, P4, R> {
            return try Arity5(value.convey(to: ((P0, P1, P2, P3, P4) -> R).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
 
    /// `JXConvertible` wrapper around a throwing closure of arity 5.
    public struct Throwing5<P0, P1, P2, P3, P4, R>: JXConvertible {
        public let closure: (P0, P1, P2, P3, P4) throws -> R
     
        public init(_ closure: @escaping (P0, P1, P2, P3, P4) throws -> R) {
            self.closure = closure
        }
     
        public init?(_ closure: ((P0, P1, P2, P3, P4) throws -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
     
        public static func fromJX(_ value: JXValue) throws -> Throwing5<P0, P1, P2, P3, P4, R> {
            return try Throwing5(value.convey(to: ((P0, P1, P2, P3, P4) throws -> R).self))
        }
     
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
}
 
extension JXContext {
    /// Attempts to convey the given closure or function into this JavaScript context as a function.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyClosure<P0, P1, P2, P3, P4, R>(_ f: ((P0, P1, P2, P3, P4) throws -> R)?) throws -> JXValue {
        guard let f else {
            return null()
        }
        return JXValue(newFunctionIn: self) { context, _, args in
            try validate(arguments: args, count: 5)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self)
            let r = try f(p.0, p.1, p.2, p.3, p.4)
            return try context.convey(r)
        }
    }
}
 
extension JXValue {
    /// Attempts to convey this JavaScript value to a closure with 5 parameters. This value must be a function.
    public func convey<P0, P1, P2, P3, P4, R>(to type: ((P0, P1, P2, P3, P4) -> R).Type = ((P0, P1, P2, P3, P4) -> R).self) throws -> (P0, P1, P2, P3, P4) -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (p0, p1, p2, p3, p4) in
            do {
                let rvalue = try self.call(withArguments: [p0, p1, p2, p3, p4])
                let r = try rvalue.convey(to: R.self)
                return r
            } catch {
                // Is there anything else we could possibly do here?
                fatalError("Fatal: Caught an error invoking a JavaScript function conveyed to a native closure that does not throw. \(String(describing: error))")
            }
        }
    }
 
    /// Attempts to convey this JavaScript value to a closure with 5 parameters. This value must be a function.
    public func convey<P0, P1, P2, P3, P4, R>(to type: ((P0, P1, P2, P3, P4) throws -> R).Type = ((P0, P1, P2, P3, P4) throws -> R).self) throws -> (P0, P1, P2, P3, P4) throws -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (p0, p1, p2, p3, p4) in
            let rvalue = try self.call(withArguments: [p0, p1, p2, p3, p4])
            let r = try rvalue.convey(to: R.self)
            return r
        }
    }
}


 extension JXClosure {
    /// `JXConvertible` wrapper around a non-throwing closure of arity 6.
    public struct Arity6<P0, P1, P2, P3, P4, P5, R>: JXConvertible {
        public let closure: (P0, P1, P2, P3, P4, P5) -> R
        
        public init(_ closure: @escaping (P0, P1, P2, P3, P4, P5) -> R) {
            self.closure = closure
        }
        
        public init?(_ closure: ((P0, P1, P2, P3, P4, P5) -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity6<P0, P1, P2, P3, P4, P5, R> {
            return try Arity6(value.convey(to: ((P0, P1, P2, P3, P4, P5) -> R).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
 
    /// `JXConvertible` wrapper around a throwing closure of arity 6.
    public struct Throwing6<P0, P1, P2, P3, P4, P5, R>: JXConvertible {
        public let closure: (P0, P1, P2, P3, P4, P5) throws -> R
     
        public init(_ closure: @escaping (P0, P1, P2, P3, P4, P5) throws -> R) {
            self.closure = closure
        }
     
        public init?(_ closure: ((P0, P1, P2, P3, P4, P5) throws -> R)?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
     
        public static func fromJX(_ value: JXValue) throws -> Throwing6<P0, P1, P2, P3, P4, P5, R> {
            return try Throwing6(value.convey(to: ((P0, P1, P2, P3, P4, P5) throws -> R).self))
        }
     
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
}
 
extension JXContext {
    /// Attempts to convey the given closure or function into this JavaScript context as a function.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyClosure<P0, P1, P2, P3, P4, P5, R>(_ f: ((P0, P1, P2, P3, P4, P5) throws -> R)?) throws -> JXValue {
        guard let f else {
            return null()
        }
        return JXValue(newFunctionIn: self) { context, _, args in
            try validate(arguments: args, count: 6)
            let p = try conveyParameters(args, P0.self, P1.self, P2.self, P3.self, P4.self, P5.self)
            let r = try f(p.0, p.1, p.2, p.3, p.4, p.5)
            return try context.convey(r)
        }
    }
}
 
extension JXValue {
    /// Attempts to convey this JavaScript value to a closure with 6 parameters. This value must be a function.
    public func convey<P0, P1, P2, P3, P4, P5, R>(to type: ((P0, P1, P2, P3, P4, P5) -> R).Type = ((P0, P1, P2, P3, P4, P5) -> R).self) throws -> (P0, P1, P2, P3, P4, P5) -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (p0, p1, p2, p3, p4, p5) in
            do {
                let rvalue = try self.call(withArguments: [p0, p1, p2, p3, p4, p5])
                let r = try rvalue.convey(to: R.self)
                return r
            } catch {
                // Is there anything else we could possibly do here?
                fatalError("Fatal: Caught an error invoking a JavaScript function conveyed to a native closure that does not throw. \(String(describing: error))")
            }
        }
    }
 
    /// Attempts to convey this JavaScript value to a closure with 6 parameters. This value must be a function.
    public func convey<P0, P1, P2, P3, P4, P5, R>(to type: ((P0, P1, P2, P3, P4, P5) throws -> R).Type = ((P0, P1, P2, P3, P4, P5) throws -> R).self) throws -> (P0, P1, P2, P3, P4, P5) throws -> R {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (p0, p1, p2, p3, p4, p5) in
            let rvalue = try self.call(withArguments: [p0, p1, p2, p3, p4, p5])
            let r = try rvalue.convey(to: R.self)
            return r
        }
    }
}
