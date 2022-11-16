import JXKit

/// Throw an informative error if the user attempts to pass the wrong number of arguments to a function.
func validate(typeName: String, function: String, arguments: [Any?], count: Int) throws {
    if arguments.count != count {
        throw JXBridgeErrors.invalidArgumentCount(typeName, function)
    }
}

extension FunctionBridge {
    // Type.xxx()
    init<T, R>(name: String, function: @escaping (T) -> () throws -> R) {
        self = FunctionBridge(name: name) { (obj: T) throws -> R in
            let callFunc = function(obj)
            return try callFunc()
        }
    }
    
    // { $0.xxx() }
    init<T, R>(name: String, function: @escaping (T) throws -> R) {
        let typeName = String(describing: T.self)
        let bridgeFunction: (Any, [JXValue], JXContext) throws -> (Any, JXValue) = { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 0)
            let ret = try function(target)
            let retjx = R.self == Void.self ? context.undefined() : try context.convey(ret)
            return (target, retjx)
        }
        self = FunctionBridge(name: name, function: bridgeFunction)
    }

    // Type.xxx(p0:)
    init<T, P0, R>(name: String, function: @escaping (T) -> (P0) throws -> R) {
        self = FunctionBridge(name: name) { (obj: T, p0: P0) throws -> R in
            let callFunc = function(obj)
            return try callFunc(p0)
        }
    }

    // { $0.xxx(p0: $1) }
    init<T, P0, R>(name: String, function: @escaping (T, P0) throws -> R) {
        let typeName = String(describing: T.self)
        let bridgeFunction: (Any, [JXValue], JXContext) throws -> (Any, JXValue) = { obj, args, context in
            let target = obj as! T
            try validate(typeName: typeName, function: name, arguments: args, count: 1)
            let p0 = try args[0].convey(to: P0.self)
            let ret = try function(target, p0)
            let retjx = R.self == Void.self ? context.undefined() : try context.convey(ret)
            return (target, retjx)
        }
        self = FunctionBridge(name: name, function: bridgeFunction)
    }
}
