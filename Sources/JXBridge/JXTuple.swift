import JXKit

/// `JXConvertible` wrappers around tuples, converting them to and from JavaScript arrays. Use these wrappers when passing tuples directly to or from `JXKit`.
/// When bridging native API, tuples can be automatically wrapped by the generated bridging code up to a certain arity.
///
/// - Seealso `ArityGenerator` tool documentation
public enum JXTuple {
}

/*ARITY:TUPLE_SUPPORT
extension JXTuple {
    /// `JXConvertible` wrapper around a tuple of arity ${TUPLE_COUNT}.
    public struct Arity${TUPLE_COUNT}<${TUPLE_TYPES_LIST}>: JXConvertible {
        public let tuple: (${TUPLE_LIST})
        
        public init(_ tuple: (${TUPLE_LIST})) {
            self.tuple = tuple
        }
        
        public init?(_ tuple: (${TUPLE_LIST})?) {
            guard let t = tuple else {
                return nil
            }
            self.init(t)
        }
        
        public static func fromJX(_ value: JXValue) throws -> Arity${TUPLE_COUNT}<${TUPLE_TYPES_LIST}> {
            return try Arity${TUPLE_COUNT}(value.convey(to: (${TUPLE_LIST}).self))
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
    public func conveyTuple<${TUPLE_TYPES_LIST}>(_ t: (${TUPLE_LIST})?) throws -> JXValue {
        guard let t else {
            return null()
        }
        let jxarray: [JXValue] = try [${TUPLE_CONVEY_LIST}]
        return try array(jxarray)
    }
}
     
extension JXValue {
    /// Attempts to convey this JavaScript value to a tuple with ${TUPLE_COUNT} values. This value must be an array.
    public func convey<${TUPLE_TYPES_LIST}>(to type: (${TUPLE_LIST}).Type = (${TUPLE_LIST}).self) throws -> (${TUPLE_LIST}) {
        guard isArray else {
            throw JXError.valueNotArray(self)
        }
        let t = try (${TUPLE_CONVEY_ARRAY_LIST})
        return ${TUPLE_FROMCONVEYED}
    }
}
ARITY*/
