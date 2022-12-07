import JXKit

public enum JXClosure {
    /// Wrapper for a closure with 0 parameters.
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
    
    /// Wrapper for a throwing closure with 0 parameters.
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
    
    /// Wrapper for a closure with 1 parameter.
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
    
    /// Wrapper for a throwing closure with 1 parameter.
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
    
    /// Wrapper for a closure with 2 parameters.
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
    
    /// Wrapper for a throwing closure with 2 parameters.
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
    
    //~~~ Need to auto-gen this support too
}
