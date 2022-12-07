import JXKit

public enum JXClosure {
/*ARITY:CLOSURE_SUPPORT
 extension JXClosure {
    /// `JXConvertible` wrapper around a non-throwing closure of arity ${PARAM_COUNT}.
    public struct Arity${PARAM_COUNT}<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>: JXConvertible {
        public let closure: (${PARAM_LIST}) -> ${RETURN}
        
        public init(_ closure: @escaping (${PARAM_LIST}) -> ${RETURN}) {
            self.closure = closure
        }
        
        public init?(_ closure: ((${PARAM_LIST}) -> ${RETURN})?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity${PARAM_COUNT}<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}> {
            return try Arity${PARAM_COUNT}(value.convey(to: ((${PARAM_LIST}) -> ${RETURN}).self))
        }
        
        public func toJX(in context: JXContext) throws -> JXValue {
            return try context.conveyClosure(closure)
        }
    }
 
    /// `JXConvertible` wrapper around a throwing closure of arity ${PARAM_COUNT}.
    public struct Throwing${PARAM_COUNT}<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>: JXConvertible {
        public let closure: (${PARAM_LIST}) throws -> ${RETURN}
     
        public init(_ closure: @escaping (${PARAM_LIST}) throws -> ${RETURN}) {
            self.closure = closure
        }
     
        public init?(_ closure: ((${PARAM_LIST}) throws -> ${RETURN})?) {
            guard let c = closure else {
                return nil
            }
            self.init(c)
        }
     
        public static func fromJX(_ value: JXValue) throws -> Throwing${PARAM_COUNT}<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}> {
            return try Throwing${PARAM_COUNT}(value.convey(to: ((${PARAM_LIST}) throws -> ${RETURN}).self))
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
    public func conveyClosure<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(_ f: ((${PARAM_LIST}) throws -> ${RETURN})?) throws -> JXValue {
        guard let f else {
            return null()
        }
        return JXValue(newFunctionIn: self) { context, _, args in
            try validate(arguments: args, count: ${PARAM_COUNT})
            let ${PARAM_TUPLE} = try conveyParameters(args${PARAM_COMMA}${PARAM_CONVEY_TYPE_LIST})
            let r = try f(${PARAM_TUPLE_LIST})
            return try context.convey(${RETURN_CONVEY})
        }
    }
}
 
extension JXValue {
    /// Attempts to convey this JavaScript value to a closure with ${PARAM_COUNT} parameters. This value must be a function.
    public func convey<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(to type: ((${PARAM_LIST}) -> ${RETURN}).Type = ((${PARAM_LIST}) -> ${RETURN}).self) throws -> (${PARAM_LIST}) -> ${RETURN} {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (${PARAM_LABEL_LIST}) in
            do {
                let rvalue = try self.call(withArguments: [${PARAM_LABEL_LIST}])
                let r = try rvalue.convey(to: ${RETURN_CONVEY_TYPE})
                return ${RETURN_FROMCONVEYED}
            } catch {
                // Is there anything else we could possibly do here?
                fatalError("Fatal: Caught an error invoking a JavaScript function conveyed to a native closure that does not throw. \(String(describing: error))")
            }
        }
    }
 
    /// Attempts to convey this JavaScript value to a closure with ${PARAM_COUNT} parameters. This value must be a function.
    public func convey<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(to type: ((${PARAM_LIST}) throws -> ${RETURN}).Type = ((${PARAM_LIST}) throws -> ${RETURN}).self) throws -> (${PARAM_LIST}) throws -> ${RETURN} {
        guard isFunction else {
            throw JXError.valueNotFunction(self)
        }
        return { (${PARAM_LABEL_LIST}) in
            let rvalue = try self.call(withArguments: [${PARAM_LABEL_LIST}])
            let r = try rvalue.convey(to: ${RETURN_CONVEY_TYPE})
            return ${RETURN_FROMCONVEYED}
        }
    }
}
ARITY*/
}
