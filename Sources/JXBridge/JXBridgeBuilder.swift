#if canImport(ObjectiveC)
import Foundation
#endif
import JXKit

/// Build the bridge for scripting a native type.
public final class JXBridgeBuilder<T> {
    /// Supply the type to bridge.
    public convenience init(type: T.Type, as typeName: String? = nil, namespace: JXNamespace = .none) {
        self.init(type: type, bridge: JXBridge(type: type, as: typeName, namespace: namespace))
    }
    
    /// Supply an existing bridge to modify.
    public init(type: T.Type, bridge: JXBridge) {
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
    public var `var`: Vars<T> {
        return Vars(builder: self)
    }
    
    /// Add bridged instance functions.
    public var `func`: Funcs<T> {
        return Funcs(builder: self)
    }
    
    /// Add bridged mutating functions to value types.
    public var `mutating`: JXBridgeBuilderMutating<T> {
        return JXBridgeBuilderMutating(builder: self)
    }
    
    /// Add bridged static members.
    public var `static`: Statics<T> {
        return Statics(builder: self)
    }
    
    /// Add bridged class members.
    public var `class`: ClassMembers<T> {
        return ClassMembers(builder: self)
    }
    
    /// Set the mapped superclass.
    @discardableResult public func superclass(_ superclass: Any.Type?) -> JXBridgeBuilder<T> {
        bridge.superclass = superclass
        return self
    }
    
/*ARITY:INIT
extension JXBridgeBuilder {
    // builder.constructor { Type.init(p0:...) }
    @discardableResult public func constructor${PARAM_TYPES_DEC}(_ cons: @escaping () -> (${PARAM_LIST}) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons()))
    }
    
    // builder.constructor { Type(p0: $1...) }
    @discardableResult public func constructor${PARAM_TYPES_DEC}(_ cons: @escaping (${PARAM_LIST}) throws -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.ConstructorBridge(cons))
    }
}
ARITY*/
    
    public func add(_ constructorBridge: JXBridge.ConstructorBridge) -> JXBridgeBuilder<T> {
        bridge.constructors.append(constructorBridge)
        return self
    }
    
    @dynamicMemberLookup
    public struct Vars<T> {
        var builder: JXBridgeBuilder<T>
        
        init(builder: JXBridgeBuilder<T>) {
            self.builder = builder
        }
        
        public subscript(dynamicMember name: String) -> Var<T> {
            return Var(name: name, vars: self)
        }
        
        public struct Var<T> {
            public let name: String
            let vars: Vars<T>
            
/*ARITY:PROPERTY
extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { \.xxx }
    @discardableResult public func callAsFunction<${VALUE_TYPES}>(_ accessor: () -> KeyPath<T, ${VALUE}>) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, keyPath: accessor()))
    }
             
    // builder.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<${VALUE_TYPES}>(_ getter: @escaping (T) throws -> ${VALUE}) -> JXBridgeBuilder<T> {
        return callAsFunction(get: getter, set: nil)
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<${VALUE_TYPES}>(get getterFunc: @escaping (T) throws -> ${VALUE}, set setterFunc: ((T, ${VALUE}) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
             
    // builder.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<${VALUE_TYPES}>(get getterFunc: @escaping (T) throws -> ${VALUE}, set setterFunc: @escaping (T, ${VALUE}) -> T) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getterFunc, setter: setterFunc))
    }
}
ARITY*/

/*ARITY:ASYNC_PROPERTY
extension JXBridgeBuilder.Vars.Var {
    // builder.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<${VALUE_TYPES}>(_ getter: @escaping (T) async throws -> ${VALUE}) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, getter: getter))
    }
}
ARITY*/
            public func add(_ propertyBridge: JXBridge.PropertyBridge) -> JXBridgeBuilder<T> {
                vars.builder.bridge.properties.append(propertyBridge)
                return vars.builder
            }
        }
    }
    
    @dynamicMemberLookup
    public struct Funcs<T> {
        let builder: JXBridgeBuilder<T>
        
        init(builder: JXBridgeBuilder<T>) {
            self.builder = builder
        }
        
        public subscript(dynamicMember name: String) -> Func<T> {
            return Func(name: name, funcs: self)
        }
        
        public struct Func<T> {
            public let name: String
            let funcs: Funcs<T>
            
/*ARITY:FUNCTION
extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(_ f: @escaping () -> (T) -> (${PARAM_LIST}) throws -> ${RETURN}) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
                        
    // builder.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(_ f: @escaping (T${PARAM_COMMA}${PARAM_LIST}) throws -> ${RETURN}) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}
ARITY*/

/*ARITY:ASYNC_FUNCTION
extension JXBridgeBuilder.Funcs.Func {
    // builder.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(_ f: @escaping () -> (T) -> (${PARAM_LIST}) async throws -> ${RETURN}) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f()))
    }
            
    // builder.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(_ f: @escaping (T${PARAM_COMMA}${PARAM_LIST}) async throws -> ${RETURN}) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, function: f))
    }
}
ARITY*/
            public func add(_ functionBridge: JXBridge.FunctionBridge) -> JXBridgeBuilder<T> {
                funcs.builder.bridge.functions.append(functionBridge)
                return funcs.builder
            }
        }
    }
    
    public struct JXBridgeBuilderMutating<T> {
        init(builder: JXBridgeBuilder<T>) {
            self.func = MutatingFuncs(builder: builder)
        }
        
        public let `func`: MutatingFuncs<T>
    }
    
    @dynamicMemberLookup
    public struct MutatingFuncs<T> {
        let builder: JXBridgeBuilder<T>
        
        init(builder: JXBridgeBuilder<T>) {
            self.builder = builder
        }
        
        public subscript(dynamicMember name: String) -> Func<T> {
            return Func(name: name, funcs: self)
        }
        
        public struct Func<T> {
            public let name: String
            let funcs: MutatingFuncs<T>
            
/*ARITY:FUNCTION
extension JXBridgeBuilder.MutatingFuncs.Func {
    // builder.mutating.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(_ f: @escaping (inout T${PARAM_COMMA}${PARAM_LIST}) throws -> ${RETURN}) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, mutatingFunction: f))
    }
}
ARITY*/
            
            public func add(_ functionBridge: JXBridge.FunctionBridge) -> JXBridgeBuilder<T> {
                funcs.builder.bridge.functions.append(functionBridge)
                return funcs.builder
            }
        }
    }
    
    public struct Statics<T> {
        init(builder: JXBridgeBuilder<T>) {
            self.var = StaticVars(builder: builder)
            self.func = StaticFuncs(builder: builder)
        }
        
        public let `var`: StaticVars<T>
        public let `func`: StaticFuncs<T>
    }
    
    @dynamicMemberLookup
    public struct StaticVars<T> {
        let builder: JXBridgeBuilder<T>
        
        init(builder: JXBridgeBuilder<T>) {
            self.builder = builder
        }
        
        public subscript(dynamicMember name: String) -> Var<T> {
            return Var(name: name, vars: self)
        }
        
        public struct Var<T> {
            public let name: String
            let vars: StaticVars<T>
            
/*ARITY:PROPERTY
extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<${VALUE_TYPES}>(_ getterFunc: @escaping () throws -> ${VALUE}) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: nil))
    }
 
    // builder.static.var.xxx { Type.xxx } set: { ... }
    @discardableResult public func callAsFunction<${VALUE_TYPES}>(get getterFunc: @escaping () throws -> ${VALUE}, set setterFunc: ((${VALUE}) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc, setter: setterFunc))
    }
}
ARITY*/
      
/*ARITY:ASYNC_PROPERTY
extension JXBridgeBuilder.StaticVars.Var {
    // builder.static.var.xxx { Type.xxx }
    @discardableResult public func callAsFunction<${VALUE_TYPES}>(_ getterFunc: @escaping () async throws -> ${VALUE}) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
 
    // builder.static.var.xxx { await Type.xxx }
    @discardableResult public func callAsFunction<${VALUE_TYPES}>(get getterFunc: @escaping () async throws -> ${VALUE}) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticPropertyBridge(name: name, type: T.self, getter: getterFunc))
    }
}
ARITY*/
            
            public func add(_ propertyBridge: JXBridge.StaticPropertyBridge) -> JXBridgeBuilder<T> {
                vars.builder.bridge.staticProperties.append(propertyBridge)
                return vars.builder
            }
        }
    }
    
    @dynamicMemberLookup
    public struct StaticFuncs<T> {
        let builder: JXBridgeBuilder<T>
        
        init(builder: JXBridgeBuilder<T>) {
            self.builder = builder
        }
        
        public subscript(dynamicMember name: String) -> Func {
            return Func(name: name, funcs: self)
        }
        
        public struct Func {
            public let name: String
            let funcs: StaticFuncs
            
/*ARITY:FUNCTION
extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(_ f: @escaping () -> (${PARAM_LIST}) throws -> ${RETURN}) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(_ f: @escaping (${PARAM_LIST}) throws -> ${RETURN}) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}
ARITY*/
        
/*ARITY:ASYNC_FUNCTION
extension JXBridgeBuilder.StaticFuncs.Func {
    // builder.static.func.xxx { Type.xxx(p0:...) }
    @discardableResult public func callAsFunction<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(_ f: @escaping () -> (${PARAM_LIST}) async throws -> ${RETURN}) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f()))
    }
 
    // builder.static.func.xxx { Type.xxx(p0: $0...) }
    @discardableResult public func callAsFunction<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(_ f: @escaping (${PARAM_LIST}) async throws -> ${RETURN}) -> JXBridgeBuilder<T> {
        return add(JXBridge.StaticFunctionBridge(name: name, type: T.self, function: f))
    }
}
ARITY*/

            public func add(_ functionBridge: JXBridge.StaticFunctionBridge) -> JXBridgeBuilder<T> {
                funcs.builder.bridge.staticFunctions.append(functionBridge)
                return funcs.builder
            }
        }
    }
    
    public struct ClassMembers<T> {
        init(builder: JXBridgeBuilder<T>) {
            self.var = ClassVars(builder: builder)
            self.func = ClassFuncs(builder: builder)
        }
        
        public let `var`: ClassVars<T>
        public let `func`: ClassFuncs<T>
    }
    
    @dynamicMemberLookup
    public struct ClassVars<T> {
        let builder: JXBridgeBuilder<T>
        
        init(builder: JXBridgeBuilder<T>) {
            self.builder = builder
        }
        
        public subscript(dynamicMember name: String) -> Var<T> {
            return Var(name: name, vars: self)
        }
        
        public struct Var<T> {
            public let name: String
            let vars: ClassVars<T>
            
/*ARITY:PROPERTY
extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { $0.xxx }
    @discardableResult public func callAsFunction<${VALUE_TYPES}>(_ getter: @escaping (T.Type) throws -> ${VALUE}) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter, setter: nil))
    }
 
    // builder.class.var.xxx { $0.xxx ) set: { ... }
    @discardableResult public func callAsFunction<${VALUE_TYPES}>(get getterFunc: @escaping (T.Type) throws -> ${VALUE}, set setterFunc: ((T.Type, ${VALUE}) -> Void)?) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getterFunc, setter: setterFunc))
    }
}
ARITY*/
            
/*ARITY:ASYNC_PROPERTY
extension JXBridgeBuilder.ClassVars.Var {
    // builder.class.var.xxx { await $0.xxx }
    @discardableResult public func callAsFunction<${VALUE_TYPES}>(_ getter: @escaping (T.Type) async throws -> ${VALUE}) -> JXBridgeBuilder<T> {
        return add(JXBridge.PropertyBridge(name: name, classGetter: getter))
    }
}
ARITY*/
            
            public func add(_ propertyBridge: JXBridge.PropertyBridge) -> JXBridgeBuilder<T> {
                vars.builder.bridge.classProperties.append(propertyBridge)
                return vars.builder
            }
        }
    }
    
    @dynamicMemberLookup
    public struct ClassFuncs<T> {
        let builder: JXBridgeBuilder<T>
        
        init(builder: JXBridgeBuilder<T>) {
            self.builder = builder
        }
        
        public subscript(dynamicMember name: String) -> Func {
            return Func(name: name, funcs: self)
        }
        
        public struct Func {
            public let name: String
            let funcs: ClassFuncs
            
/*ARITY:FUNCTION
extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(_ f: @escaping (T.Type${PARAM_COMMA}${PARAM_LIST}) throws -> ${RETURN}) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}
ARITY*/

/*ARITY:ASYNC_FUNCTION
extension JXBridgeBuilder.ClassFuncs.Func {
    // builder.class.func.xxx { await $0.xxx(p0: $1...) }
    @discardableResult public func callAsFunction<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(_ f: @escaping (T.Type${PARAM_COMMA}${PARAM_LIST}) async throws -> ${RETURN}) -> JXBridgeBuilder<T> {
        return add(JXBridge.FunctionBridge(name: name, classFunction: f))
    }
}
ARITY*/
            
            public func add(_ functionBridge: JXBridge.FunctionBridge) -> JXBridgeBuilder<T> {
                funcs.builder.bridge.classFunctions.append(functionBridge)
                return funcs.builder
            }
        }
    }
}

#if canImport(ObjectiveC)
extension JXBridgeBuilder where T: NSObject {
    /// Add properties and methods discovered via ObjectiveC reflection.
    ///
    /// - Parameters:
    ///   - prefixes: The ObjectiveC reflector excludes members that use underscores in their name. It is common, however, to prefix category API with a short string followed by an underscore. Pass any category prefixes you'd like to allow. Include the underscore in each prefix.
    @discardableResult public func reflectObjectiveCMembers(prefixes: [String] = []) -> JXBridgeBuilder<T> {
        let builder = ObjectiveCBuilder(bridge: bridge)
        builder.addObjectiveCPropertiesAndMethods(prefixes: prefixes)
        bridge = builder.bridge
        return self
    }
}
#endif
