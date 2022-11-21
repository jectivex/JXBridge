#if canImport(ObjectiveC)
import Foundation
#endif
import JXKit

// TODO: Expand builder constructors, funcs to handle additional arguments.
// TODO: Expand builder to handle async funcs.

/// Build the bridge for scripting a native type.
public final class JXBridgeBuilder<T> {
    /// Supply the type to bridge.
    public convenience init(type: T.Type, as typeName: String? = nil, namespace: JXNamespace = .default) {
        self.init(bridge: JXBridge(type: type, as: typeName, namespace: namespace))
    }
    
    /// Supply an in-progress bridge to add to.
    public init(bridge: JXBridge) {
        self.bridge = bridge
    }

    /// The bridge being created.
    public var bridge: JXBridge
    
    /// Set the bridge's namespace.
    public func namespace(_ namespace: JXNamespace) -> JXBridgeBuilder<T> {
        bridge.namespace = namespace
        return self
    }
    
    /// Set the bridge's type name.
    public func typeName(_ typeName: String) -> JXBridgeBuilder<T> {
        bridge.typeName = typeName
        return self
    }

    /// Add bridged instance vars.
    public var `var`: JXBridgeBuilderVars<T> {
        return JXBridgeBuilderVars(builder: self)
    }

    /// Add bridged instance functions.
    public var `func`: JXBridgeBuilderFuncs<T> {
        return JXBridgeBuilderFuncs(builder: self)
    }

    /// Add bridged mutating functions to value types.
    public var `mutating`: JXBridgeBuilderMutating<T> {
        return JXBridgeBuilderMutating(builder: self)
    }

    /// Add bridged static members.
    public var `static`: JXBridgeBuilderStatics<T> {
        return JXBridgeBuilderStatics(builder: self)
    }

    /// Add bridged class members.
    public var `class`: JXBridgeBuilderClassMembers<T> {
        return JXBridgeBuilderClassMembers(builder: self)
    }

    /// Set the mapped superclass.
    @discardableResult public func superclass(_ superclass: Any.Type?) -> JXBridgeBuilder<T> {
        bridge.superclass = superclass
        return self
    }
    
    // MARK: 0 parameters

    // builder.constructor { Type.init }
    @discardableResult public func constructor(_ cons: @escaping () -> () throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons()))
    }

    // builder.constructor { Type() }
    @discardableResult public func constructor(_ cons: @escaping () throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons))
    }
    
    // MARK: 1 parameter

    // builder.constructor { Type.init(p0:) }
    @discardableResult public func constructor<P0>(_ cons: @escaping () -> (P0) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons()))
    }

    // builder.constructor { Type(p0: $1) }
    @discardableResult public func constructor<P0>(_ cons: @escaping (P0) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons))
    }
    
    // MARK: 2 parameters
    
    // builder.constructor { Type.init(p0:p1:) }
    @discardableResult public func constructor<P0, P1>(_ cons: @escaping () -> (P0, P1) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons()))
    }

    // builder.constructor { Type(p0: $1, p1: $2) }
    @discardableResult public func constructor<P0, P1>(_ cons: @escaping (P0, P1) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons))
    }
    
    // MARK: 3 parameters
    
    // builder.constructor { Type.init(p0:p1:p2:) }
    @discardableResult public func constructor<P0, P1, P2>(_ cons: @escaping () -> (P0, P1, P2) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1, p1: $2, p2: $3) }
    @discardableResult public func constructor<P0, P1, P2>(_ cons: @escaping (P0, P1, P2) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons))
    }
    
    // MARK: 4 parameters
    
    // builder.constructor { Type.init(p0:p1:p2:p3:) }
    @discardableResult public func constructor<P0, P1, P2, P3>(_ cons: @escaping () -> (P0, P1, P2, P3) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1, p1: $2, p2: $3, p3: $4) }
    @discardableResult public func constructor<P0, P1, P2, P3>(_ cons: @escaping (P0, P1, P2, P3) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons))
    }
    
    // MARK: 5 parameters
    
    // builder.constructor { Type.init(p0:p1:p2:p3:p4:) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4>(_ cons: @escaping () -> (P0, P1, P2, P3, P4) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4>(_ cons: @escaping (P0, P1, P2, P3, P4) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons))
    }
    
    // MARK: 6 parameters
    
    // builder.constructor { Type.init(p0:p1:p2:p3:p4:p5:) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5>(_ cons: @escaping (P0, P1, P2, P3, P4, P5) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons))
    }
    
    // MARK: 7 parameters
    
    // builder.constructor { Type.init(p0:p1:p2:p3:p4:p5:p6:) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons))
    }
    
    // MARK: 8 parameters
    
    // builder.constructor { Type.init(p0:p1:p2:p3:p4:p5:p6:p7:) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, P7>(_ cons: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7, p7: $8) }
    @discardableResult public func constructor<P0, P1, P2, P3, P4, P5, P6, P7>(_ cons: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> T) -> JXBridgeBuilder<T> {
        return add(ConstructorBridge(cons))
    }

    private func add(_ constructorBridge: ConstructorBridge) -> JXBridgeBuilder<T> {
        bridge.constructors.append(constructorBridge)
        return self
    }
}

@dynamicMemberLookup
public struct JXBridgeBuilderVars<T> {
    var builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Var<T> {
        return Var(name: name, vars: self)
    }

    public struct Var<T> {
        let name: String
        let vars: JXBridgeBuilderVars<T>

        // builder.var.xxx { \.xxx }
        @discardableResult public func callAsFunction<V>(_ accessor: () -> KeyPath<T, V>) -> JXBridgeBuilder<T> {
            return add(PropertyBridge(name: name, keyPath: accessor()))
        }

        // builder.var.xxx { $0.xxx }
        @discardableResult public func callAsFunction<V>(_ getter: @escaping (T) throws -> V) -> JXBridgeBuilder<T> {
            return callAsFunction(get: getter, set: nil)
        }

        // builder.var.xxx { $0.xxx ) set: { ... }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T) throws -> V, set setterFunc: ((T, V) -> Void)?) -> JXBridgeBuilder<T> {
            return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
        }

        // builder.var.xxx { $0.xxx ) set: { ... }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T) throws -> V, set setterFunc: @escaping (T, V) -> T) -> JXBridgeBuilder<T> {
            return add(PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
        }
        
        // builder.var.xxx { await $0.xxx }
        @discardableResult public func callAsFunction<V>(_ getter: @escaping (T) async throws -> V) -> JXBridgeBuilder<T> {
            return add(PropertyBridge(name: name, getter: getter))
        }

        private func add(_ propertyBridge: PropertyBridge) -> JXBridgeBuilder<T> {
            vars.builder.bridge.properties.append(propertyBridge)
            return vars.builder
        }
    }
}

@dynamicMemberLookup
public struct JXBridgeBuilderFuncs<T> {
    let builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Func<T> {
        return Func(name: name, funcs: self)
    }

    public struct Func<T> {
        let name: String
        let funcs: JXBridgeBuilderFuncs<T>
        
        // MARK: 0 parameters

        // builder.func.xxx { Type.xxx }
        @discardableResult public func callAsFunction<R>(_ f: @escaping () -> (T) -> () throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }
        
        // builder.func.xxx { Type.xxx }
        @discardableResult public func callAsFunction<R>(_ f: @escaping () -> (T) -> () async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }

        // builder.func.xxx { $0.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping (T) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // builder.func.xxx { await $0.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping (T) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // MARK: 1 parameter

        // builder.func.xxx { Type.xxx(p0:) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (T) -> (P0) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }
        
        // builder.func.xxx { Type.xxx(p0:) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (T) -> (P0) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }

        // builder.func.xxx { $0.xxx(p0: $1) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T, P0) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // builder.func.xxx { await $0.xxx(p0: $1) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T, P0) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // MARK: 2 parameters
        
        // builder.func.xxx { Type.xxx(p0:p1:) }
        @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping () -> (T) -> (P0, P1) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }
        
        // builder.func.xxx { Type.xxx(p0:p1:) }
        @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping () -> (T) -> (P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }

        // builder.func.xxx { $0.xxx(p0: $1, p1: $2) }
        @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (T, P0, P1) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // builder.func.xxx { await $0.xxx(p0: $1, p1: $2) }
        @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (T, P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // MARK: 3 parameters
        
        // builder.func.xxx { Type.xxx(p0:p1:p2:) }
        @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping () -> (T) -> (P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }
        
        // builder.func.xxx { Type.xxx(p0:p1:p2:) }
        @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping () -> (T) -> (P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }

        // builder.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3) }
        @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (T, P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // builder.func.xxx { await $0.xxx(p0: $1, p1: $2, p2: $3) }
        @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (T, P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }

        // MARK: 4 parameters
        
        // builder.func.xxx { Type.xxx(p0:p1:p2:p3:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }
        
        // builder.func.xxx { Type.xxx(p0:p1:p2:p3:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }

        // builder.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (T, P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // builder.func.xxx { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (T, P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // MARK: 5 parameters
        
        // builder.func.xxx { Type.xxx(p0:p1:p2:p3:p4:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }
        
        // builder.func.xxx { Type.xxx(p0:p1:p2:p3:p4:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }

        // builder.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (T, P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // builder.func.xxx { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (T, P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // MARK: 6 parameters
        
        // builder.func.xxx { Type.xxx(p0:p1:p2:p3:p4:p5:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }
        
        // builder.func.xxx { Type.xxx(p0:p1:p2:p3:p4:p5:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }

        // builder.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // builder.func.xxx { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // MARK: 7 parameters
        
        // builder.func.xxx { Type.xxx(p0:p1:p2:p3:p4:p5:p6:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }
        
        // builder.func.xxx { Type.xxx(p0:p1:p2:p3:p4:p5:p6:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }

        // builder.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // builder.func.xxx { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // MARK: 8 parameters
        
        // builder.func.xxx { Type.xxx(p0:p1:p2:p3:p4:p5:p6:p7:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }
        
        // builder.func.xxx { Type.xxx(p0:p1:p2:p3:p4:p5:p6:p7:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping () -> (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f()))
        }

        // builder.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7, p7: $8) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }
        
        // builder.func.xxx { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7, p7: $8) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (T, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, function: f))
        }

        private func add(_ functionBridge: FunctionBridge) -> JXBridgeBuilder<T> {
            funcs.builder.bridge.functions.append(functionBridge)
            return funcs.builder
        }
    }
}

public struct JXBridgeBuilderMutating<T> {
    init(builder: JXBridgeBuilder<T>) {
        self.func = JXBridgeBuilderMutatingFuncs(builder: builder)
    }

    public let `func`: JXBridgeBuilderMutatingFuncs<T>
}

@dynamicMemberLookup
public struct JXBridgeBuilderMutatingFuncs<T> {
    let builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Func<T> {
        return Func(name: name, funcs: self)
    }

    public struct Func<T> {
        let name: String
        let funcs: JXBridgeBuilderMutatingFuncs<T>

        // builder.mutating.func.xxx { $0.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping (inout T) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, mutatingFunction: f))
        }

        // builder.mutating.func.xxx { $0.xxx(p0: $1) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (inout T, P0) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, mutatingFunction: f))
        }
        
        // builder.mutating.func.xxx { $0.xxx(p0: $1, p1: $2) }
        @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (inout T, P0, P1) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, mutatingFunction: f))
        }
        
        // builder.mutating.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3) }
        @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (inout T, P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, mutatingFunction: f))
        }
        
        // builder.mutating.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (inout T, P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, mutatingFunction: f))
        }
        
        // builder.mutating.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, mutatingFunction: f))
        }
        
        // builder.mutating.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, mutatingFunction: f))
        }
        
        // builder.mutating.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, mutatingFunction: f))
        }
        
        // builder.mutating.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7, p7: $8) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (inout T, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, mutatingFunction: f))
        }

        private func add(_ functionBridge: FunctionBridge) -> JXBridgeBuilder<T> {
            funcs.builder.bridge.functions.append(functionBridge)
            return funcs.builder
        }
    }
}

public struct JXBridgeBuilderStatics<T> {
    init(builder: JXBridgeBuilder<T>) {
        self.var = JXBridgeBuilderStaticVars(builder: builder)
        self.func = JXBridgeBuilderStaticFuncs(builder: builder)
    }

    public let `var`: JXBridgeBuilderStaticVars<T>
    public let `func`: JXBridgeBuilderStaticFuncs<T>
}

@dynamicMemberLookup
public struct JXBridgeBuilderStaticVars<T> {
    let builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Var<T> {
        return Var(name: name, vars: self)
    }

    public struct Var<T> {
        let name: String
        let vars: JXBridgeBuilderStaticVars<T>

        // builder.static.var.xxx { Type.xxx }
        @discardableResult public func callAsFunction<V>(_ getterFunc: @escaping () throws -> V) -> JXBridgeBuilder<T> {
            return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
        }
        
        // builder.static.var.xxx { Type.xxx }
        @discardableResult public func callAsFunction<V>(_ getterFunc: @escaping () async throws -> V) -> JXBridgeBuilder<T> {
            return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
        }

        // builder.static.var.xxx { Type.xxx } set: { ... }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping () throws -> V, set setterFunc: ((V) -> Void)?) -> JXBridgeBuilder<T> {
            return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
        }
        
        // builder.static.var.xxx { await Type.xxx }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping () async throws -> V) -> JXBridgeBuilder<T> {
            return add(StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
        }

        private func add(_ propertyBridge: StaticPropertyBridge) -> JXBridgeBuilder<T> {
            vars.builder.bridge.staticProperties.append(propertyBridge)
            return vars.builder
        }
    }
}

@dynamicMemberLookup
public struct JXBridgeBuilderStaticFuncs<T> {
    let builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Func {
        return Func(name: name, funcs: self)
    }

    public struct Func {
        let name: String
        let funcs: JXBridgeBuilderStaticFuncs
        
        // MARK: 0 parameters

        // builder.static.func.xxx { Type.xxx }
        @discardableResult public func callAsFunction<R>(_ f: @escaping () -> () throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }
        
        // builder.static.func.xxx { Type.xxx }
        @discardableResult public func callAsFunction<R>(_ f: @escaping () -> () async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }

        // builder.static.func.xxx { Type.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping () throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // builder.static.func.xxx { await Type.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping () async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // MARK: 1 parameter

        // builder.static.func.xxx { Type.xxx(p0:) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (P0) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }
        
        // builder.static.func.xxx { Type.xxx(p0:) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping () -> (P0) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }

        // builder.static.func.xxx { Type.xxx(p0: $0) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (P0) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // builder.static.func.xxx { Type.xxx(p0: $0) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (P0) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // MARK: 2 parameters
        
        // builder.static.func.xxx { Type.xxx(p0:p1:) }
        @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping () -> (P0, P1) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }
        
        // builder.static.func.xxx { Type.xxx(p0:p1:) }
        @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping () -> (P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }

        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1) }
        @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (P0, P1) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1) }
        @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // MARK: 3 parameters
        
        // builder.static.func.xxx { Type.xxx(p0:p1:p2:) }
        @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping () -> (P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }
        
        // builder.static.func.xxx { Type.xxx(p0:p1:p2:) }
        @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping () -> (P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }

        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1, p2: $2) }
        @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1, p2: $2) }
        @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // MARK: 4 parameters
        
        // builder.static.func.xxx { Type.xxx(p0:p1:p2:p3:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping () -> (P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }
        
        // builder.static.func.xxx { Type.xxx(p0:p1:p2:p3:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping () -> (P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }

        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // MARK: 5 parameters
        
        // builder.static.func.xxx { Type.xxx(p0:p1:p2:p3:p4:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }
        
        // builder.static.func.xxx { Type.xxx(p0:p1:p2:p3:p4:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }

        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // MARK: 6 parameters
        
        // builder.static.func.xxx { Type.xxx(p0:p1:p2:p3:p4:p5:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }
        
        // builder.static.func.xxx { Type.xxx(p0:p1:p2:p3:p4:p5:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }

        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // MARK: 7 parameters
        
        // builder.static.func.xxx { Type.xxx(p0:p1:p2:p3:p4:p5:p6:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }
        
        // builder.static.func.xxx { Type.xxx(p0:p1:p2:p3:p4:p5:p6:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }

        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5, p6: $6) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5, p6: $6) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // MARK: 8 parameters
        
        // builder.static.func.xxx { Type.xxx(p0:p1:p2:p3:p4:p5:p6:p7:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }
        
        // builder.static.func.xxx { Type.xxx(p0:p1:p2:p3:p4:p5:p6:p7:) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping () -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f()))
        }

        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5, p6: $6, p7: $7) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }
        
        // builder.static.func.xxx { Type.xxx(p0: $0, p1: $1, p2: $2, p3: $3, p4: $4, p5: $5, p6: $6, p7: $7) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
            return add(StaticFunctionBridge(name: name, type: T.self, function: f))
        }

        private func add(_ functionBridge: StaticFunctionBridge) -> JXBridgeBuilder<T> {
            funcs.builder.bridge.staticFunctions.append(functionBridge)
            return funcs.builder
        }
    }
}

public struct JXBridgeBuilderClassMembers<T> {
    init(builder: JXBridgeBuilder<T>) {
        self.var = JXBridgeBuilderClassVars(builder: builder)
        self.func = JXBridgeBuilderClassFuncs(builder: builder)
    }

    public let `var`: JXBridgeBuilderClassVars<T>
    public let `func`: JXBridgeBuilderClassFuncs<T>
}

@dynamicMemberLookup
public struct JXBridgeBuilderClassVars<T> {
    let builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Var<T> {
        return Var(name: name, vars: self)
    }

    public struct Var<T> {
        let name: String
        let vars: JXBridgeBuilderClassVars<T>

        // builder.class.var.xxx { $0.xxx }
        @discardableResult public func callAsFunction<V>(_ getter: @escaping (T.Type) throws -> V) -> JXBridgeBuilder<T> {
            return add(PropertyBridge(name: name, classGetter: getter, setter: nil))
        }

        // builder.class.var.xxx { $0.xxx ) set: { ... }
        @discardableResult public func callAsFunction<V>(get getterFunc: @escaping (T.Type) throws -> V, set setterFunc: ((T.Type, V) -> Void)?) -> JXBridgeBuilder<T> {
            return add(PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
        }
        
        // builder.class.var.xxx { await $0.xxx }
        @discardableResult public func callAsFunction<V>(_ getter: @escaping (T.Type) async throws -> V) -> JXBridgeBuilder<T> {
            return add(PropertyBridge(name: name, classGetter: getter))
        }

        private func add(_ propertyBridge: PropertyBridge) -> JXBridgeBuilder<T> {
            vars.builder.bridge.classProperties.append(propertyBridge)
            return vars.builder
        }
    }
}

@dynamicMemberLookup
public struct JXBridgeBuilderClassFuncs<T> {
    let builder: JXBridgeBuilder<T>

    init(builder: JXBridgeBuilder<T>) {
        self.builder = builder
    }

    public subscript(dynamicMember name: String) -> Func {
        return Func(name: name, funcs: self)
    }

    public struct Func {
        let name: String
        let funcs: JXBridgeBuilderClassFuncs
        
        // MARK: 0 parameters

        // builder.class.func.xxx { $0.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping (T.Type) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // builder.class.func.xxx { await $0.xxx() }
        @discardableResult public func callAsFunction<R>(_ f: @escaping (T.Type) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // MARK: 1 parameter

        // builder.class.func.xxx { $0.xxx(p0: $1) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T.Type, P0) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // builder.class.func.xxx { await $0.xxx(p0: $1) }
        @discardableResult public func callAsFunction<P0, R>(_ f: @escaping (T.Type, P0) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // MARK: 2 parameters
        
        // builder.class.func.xxx { $0.xxx(p0: $1, p1: $2) }
        @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (T.Type, P0, P1) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // builder.class.func.xxx { await $0.xxx(p0: $1, p1: $2) }
        @discardableResult public func callAsFunction<P0, P1, R>(_ f: @escaping (T.Type, P0, P1) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // MARK: 3 parameters
        
        // builder.class.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3) }
        @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (T.Type, P0, P1, P2) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // builder.class.func.xxx { await $0.xxx(p0: $1, p1: $2, p2: $3) }
        @discardableResult public func callAsFunction<P0, P1, P2, R>(_ f: @escaping (T.Type, P0, P1, P2) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // MARK: 4 parameters
        
        // builder.class.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (T.Type, P0, P1, P2, P3) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // builder.class.func.xxx { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, R>(_ f: @escaping (T.Type, P0, P1, P2, P3) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // MARK: 5 parameters
        
        // builder.class.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // builder.class.func.xxx { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // MARK: 6 parameters
        
        // builder.class.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // builder.class.func.xxx { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // MARK: 7 parameters
        
        // builder.class.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // builder.class.func.xxx { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // MARK: 8 parameters
        
        // builder.class.func.xxx { $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7, p7: $8) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }
        
        // builder.class.func.xxx { await $0.xxx(p0: $1, p1: $2, p2: $3, p3: $4, p4: $5, p5: $6, p6: $7, p7: $8) }
        @discardableResult public func callAsFunction<P0, P1, P2, P3, P4, P5, P6, P7, R>(_ f: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) -> JXBridgeBuilder<T> {
            return add(FunctionBridge(name: name, classFunction: f))
        }

        private func add(_ functionBridge: FunctionBridge) -> JXBridgeBuilder<T> {
            funcs.builder.bridge.classFunctions.append(functionBridge)
            return funcs.builder
        }
    }
}

extension JXBridgeBuilder {
    /// Add properties and methods discovered via `JX*` property wrappers.
    @discardableResult public func reflect(_ mirror: Mirror) -> JXBridgeBuilder<T> {
        let builder = MirrorBuilder(mirror, bridge: bridge)
        builder.addReflectedMembers()
        bridge = builder.bridge
        return self
    }
}

#if canImport(ObjectiveC)

extension JXBridgeBuilder where T: NSObject {
    /// Add properties and methods discovered via ObjectiveC reflection.
    @discardableResult public func reflectObjectiveCMembers() -> JXBridgeBuilder<T> {
        let builder = ObjectiveCBuilder(bridge: bridge)
        builder.addObjectiveCPropertiesAndMethods()
        bridge = builder.bridge
        return self
    }
}

#endif
