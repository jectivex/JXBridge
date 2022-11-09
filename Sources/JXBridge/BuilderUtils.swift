import JXKit

extension ConstructorBridge {
    init<T>(_ cons: @escaping () throws -> T) {
        self = ConstructorBridge(parameterCount: 0) { _, _ in
            return try cons()
        }
    }

    init<T, P0>(_ cons: @escaping (P0) throws -> T) {
        self = ConstructorBridge(parameterCount: 1) { args, context in
            let arg0 = try args[0].convey(to: P0.self)
            return try cons(arg0)
        }
    }
}

extension PropertyBridge {
    init<T, V>(name: String, keyPath: KeyPath<T, V>) {
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            let ret = (obj as! T)[keyPath: keyPath]
            return try context.convey(ret)
        }
        let setter: ((Any, JXValue, JXContext) throws -> Any)?
        if let writeableKeyPath = keyPath as? WritableKeyPath<T, V> {
            setter = { obj, value, context in
                var target = obj as! T
                let p0 = try value.convey(to: V.self)
                target[keyPath: writeableKeyPath] = p0
                return target
            }
        } else {
            setter = nil
        }
        self = PropertyBridge(name: name, getter: getter, setter: setter)
    }
}
