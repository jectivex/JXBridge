// THIS FILE IS AUTO GENERATED FROM JXTuple.swift. DO NOT EDIT
//
//		swift package plugin generate-arity JXTuple.swift
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

// TUPLE_SUPPORT

extension JXTuple {
    /// `JXConvertible` wrapper around a tuple of arity 2.
    public struct Arity2<T0, T1>: JXConvertible {
        public let tuple: (T0, T1)
        
        public init(_ tuple: (T0, T1)) {
            self.tuple = tuple
        }
        
        public init?(_ tuple: (T0, T1)?) {
            guard let t = tuple else {
                return nil
            }
            self.init(t)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity2<T0, T1> {
            return try Arity2(value.convey(to: (T0, T1).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyTuple(tuple)
        }
    }
}
 
extension JXContext {
    /// Attempts to convey the given tuple into this JavaScript context as an array.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyTuple<T0, T1>(_ t: (T0, T1)?) throws -> JXValue {
        guard let t else {
            return null()
        }
        let jxarray: [JXValue] = try [convey(t.0), convey(t.1)]
        return try array(jxarray)
    }
}
     
extension JXValue {
    /// Attempts to convey this JavaScript value to a tuple with 2 values. This value must be an array.
    public func convey<T0, T1>(to type: (T0, T1).Type = (T0, T1).self) throws -> (T0, T1) {
        guard isArray else {
            throw JXError.valueNotArray(self)
        }
        let t = try (self[0].convey(to: T0.self), self[1].convey(to: T1.self))
        return t
    }
}


extension JXTuple {
    /// `JXConvertible` wrapper around a tuple of arity 3.
    public struct Arity3<T0, T1, T2>: JXConvertible {
        public let tuple: (T0, T1, T2)
        
        public init(_ tuple: (T0, T1, T2)) {
            self.tuple = tuple
        }
        
        public init?(_ tuple: (T0, T1, T2)?) {
            guard let t = tuple else {
                return nil
            }
            self.init(t)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity3<T0, T1, T2> {
            return try Arity3(value.convey(to: (T0, T1, T2).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyTuple(tuple)
        }
    }
}
 
extension JXContext {
    /// Attempts to convey the given tuple into this JavaScript context as an array.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyTuple<T0, T1, T2>(_ t: (T0, T1, T2)?) throws -> JXValue {
        guard let t else {
            return null()
        }
        let jxarray: [JXValue] = try [convey(t.0), convey(t.1), convey(t.2)]
        return try array(jxarray)
    }
}
     
extension JXValue {
    /// Attempts to convey this JavaScript value to a tuple with 3 values. This value must be an array.
    public func convey<T0, T1, T2>(to type: (T0, T1, T2).Type = (T0, T1, T2).self) throws -> (T0, T1, T2) {
        guard isArray else {
            throw JXError.valueNotArray(self)
        }
        let t = try (self[0].convey(to: T0.self), self[1].convey(to: T1.self), self[2].convey(to: T2.self))
        return t
    }
}


extension JXTuple {
    /// `JXConvertible` wrapper around a tuple of arity 4.
    public struct Arity4<T0, T1, T2, T3>: JXConvertible {
        public let tuple: (T0, T1, T2, T3)
        
        public init(_ tuple: (T0, T1, T2, T3)) {
            self.tuple = tuple
        }
        
        public init?(_ tuple: (T0, T1, T2, T3)?) {
            guard let t = tuple else {
                return nil
            }
            self.init(t)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity4<T0, T1, T2, T3> {
            return try Arity4(value.convey(to: (T0, T1, T2, T3).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyTuple(tuple)
        }
    }
}
 
extension JXContext {
    /// Attempts to convey the given tuple into this JavaScript context as an array.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyTuple<T0, T1, T2, T3>(_ t: (T0, T1, T2, T3)?) throws -> JXValue {
        guard let t else {
            return null()
        }
        let jxarray: [JXValue] = try [convey(t.0), convey(t.1), convey(t.2), convey(t.3)]
        return try array(jxarray)
    }
}
     
extension JXValue {
    /// Attempts to convey this JavaScript value to a tuple with 4 values. This value must be an array.
    public func convey<T0, T1, T2, T3>(to type: (T0, T1, T2, T3).Type = (T0, T1, T2, T3).self) throws -> (T0, T1, T2, T3) {
        guard isArray else {
            throw JXError.valueNotArray(self)
        }
        let t = try (self[0].convey(to: T0.self), self[1].convey(to: T1.self), self[2].convey(to: T2.self), self[3].convey(to: T3.self))
        return t
    }
}


extension JXTuple {
    /// `JXConvertible` wrapper around a tuple of arity 5.
    public struct Arity5<T0, T1, T2, T3, T4>: JXConvertible {
        public let tuple: (T0, T1, T2, T3, T4)
        
        public init(_ tuple: (T0, T1, T2, T3, T4)) {
            self.tuple = tuple
        }
        
        public init?(_ tuple: (T0, T1, T2, T3, T4)?) {
            guard let t = tuple else {
                return nil
            }
            self.init(t)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity5<T0, T1, T2, T3, T4> {
            return try Arity5(value.convey(to: (T0, T1, T2, T3, T4).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyTuple(tuple)
        }
    }
}
 
extension JXContext {
    /// Attempts to convey the given tuple into this JavaScript context as an array.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyTuple<T0, T1, T2, T3, T4>(_ t: (T0, T1, T2, T3, T4)?) throws -> JXValue {
        guard let t else {
            return null()
        }
        let jxarray: [JXValue] = try [convey(t.0), convey(t.1), convey(t.2), convey(t.3), convey(t.4)]
        return try array(jxarray)
    }
}
     
extension JXValue {
    /// Attempts to convey this JavaScript value to a tuple with 5 values. This value must be an array.
    public func convey<T0, T1, T2, T3, T4>(to type: (T0, T1, T2, T3, T4).Type = (T0, T1, T2, T3, T4).self) throws -> (T0, T1, T2, T3, T4) {
        guard isArray else {
            throw JXError.valueNotArray(self)
        }
        let t = try (self[0].convey(to: T0.self), self[1].convey(to: T1.self), self[2].convey(to: T2.self), self[3].convey(to: T3.self), self[4].convey(to: T4.self))
        return t
    }
}


extension JXTuple {
    /// `JXConvertible` wrapper around a tuple of arity 6.
    public struct Arity6<T0, T1, T2, T3, T4, T5>: JXConvertible {
        public let tuple: (T0, T1, T2, T3, T4, T5)
        
        public init(_ tuple: (T0, T1, T2, T3, T4, T5)) {
            self.tuple = tuple
        }
        
        public init?(_ tuple: (T0, T1, T2, T3, T4, T5)?) {
            guard let t = tuple else {
                return nil
            }
            self.init(t)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity6<T0, T1, T2, T3, T4, T5> {
            return try Arity6(value.convey(to: (T0, T1, T2, T3, T4, T5).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyTuple(tuple)
        }
    }
}
 
extension JXContext {
    /// Attempts to convey the given tuple into this JavaScript context as an array.
    ///
    /// - Seealso: `JXValue.convey` to convey back from JavaScript.
    public func conveyTuple<T0, T1, T2, T3, T4, T5>(_ t: (T0, T1, T2, T3, T4, T5)?) throws -> JXValue {
        guard let t else {
            return null()
        }
        let jxarray: [JXValue] = try [convey(t.0), convey(t.1), convey(t.2), convey(t.3), convey(t.4), convey(t.5)]
        return try array(jxarray)
    }
}
     
extension JXValue {
    /// Attempts to convey this JavaScript value to a tuple with 6 values. This value must be an array.
    public func convey<T0, T1, T2, T3, T4, T5>(to type: (T0, T1, T2, T3, T4, T5).Type = (T0, T1, T2, T3, T4, T5).self) throws -> (T0, T1, T2, T3, T4, T5) {
        guard isArray else {
            throw JXError.valueNotArray(self)
        }
        let t = try (self[0].convey(to: T0.self), self[1].convey(to: T1.self), self[2].convey(to: T2.self), self[3].convey(to: T3.self), self[4].convey(to: T4.self), self[5].convey(to: T5.self))
        return t
    }
}
