import JXKit
#if canImport(Combine)
import Combine
#else
import OpenCombine
#endif

/// Property wrapper bridging a stored property to JavaScript.
///
///     @JX var count = 1
///
/// - Note: Any `jx` prefix will be stripped in the bridged JavaScript property name.
@propertyWrapper
public final class JX<T> {
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    
    public var wrappedValue: T
}

/// Property wrapper bridging a `@Published` stored property to JavaScript.
///
///     @JXPublished var count = 1
///
/// - Note: Any `jx` prefix will be stripped in the bridged JavaScript property name.
@propertyWrapper
public final class JXPublished<T> {
    private var value: T
    private let valueSubject: CurrentValueSubject<T, Never>
    
    public init(wrappedValue: T) {
        value = wrappedValue
        valueSubject = CurrentValueSubject(wrappedValue)
        projectedValue = valueSubject.eraseToAnyPublisher()
    }
    
    // WARNING: This is an UNOFFICIAL alternate mechanism for property wrappers.
    public static subscript<O: ObservableObject>(_enclosingInstance owner: O, wrapped wrappedKeyPath: ReferenceWritableKeyPath<O, T>, storage storageKeyPath: ReferenceWritableKeyPath<O, JXPublished<T>>) -> T {
        get {
            owner[keyPath: storageKeyPath].value
        }
        set {
            let published = owner[keyPath: storageKeyPath]
            published.updateValue(newValue, owner: owner)
        }
    }
    
    private func updateValue<O: ObservableObject>(_ value: T, owner: O) {
        valueSubject.send(value)
        if let publisher = owner.objectWillChange as? ObservableObjectPublisher {
            publisher.send()
        }
        self.value = value
    }

    @available(*, unavailable, message: "@JXPublished can only be applied to classes")
    public var wrappedValue: T {
        get {
            fatalError()
        }
        set {
            fatalError()
        }
    }
    
    public var projectedValue: AnyPublisher<T, Never>
}

/// Property wrapper bridging an instance property to JavaScript.
///
///     @JXVar var jxcount = (get: { $0.count }, set: { $0.count = $0 })
///     var count = 1
///
/// - Note: Any `jx` prefix will be stripped in the bridged JavaScript property name.
/// - Seealso: ``JXKeyPath``
@propertyWrapper
public struct JXVar {
    let propertyBridge: (String) -> JXBridge.PropertyBridge
    
    public init(_ propertyBridge: @escaping (String) -> JXBridge.PropertyBridge) {
        self.propertyBridge = propertyBridge
    }
    
/*ARITY:PROPERTY
extension JXVar {
    public init<T, ${VALUE_TYPES}>(wrappedValue: (get: (T) throws -> ${VALUE}, set: ((T, ${VALUE}) -> Void)?), _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, ${VALUE_TYPES}>(wrappedValue: @escaping (T) throws -> ${VALUE}, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}
ARITY*/
    
/*ARITY:ASYNC_PROPERTY
extension JXVar {
    public init<T, ${VALUE_TYPES}>(wrappedValue: @escaping (T) async throws -> ${VALUE}, _ type: T.Type) {
        self = JXVar({ JXBridge.PropertyBridge(name: $0, getter: wrappedValue) })
    }
}
ARITY*/
    
    public var wrappedValue: Any? {
        get {
            return nil
        }
        set {
        }
    }
}

/// Property wrapper bridging a static property to JavaScript.
///
///     @JXStaticVar var jxcount = (get: { Counter.count }, set: { Counter.count = $0 })
///     static var count = 1
///
/// - Note: Any `jx` prefix will be stripped in the bridged JavaScript property name.
@propertyWrapper
public struct JXStaticVar {
    let propertyBridge: (String) -> JXBridge.StaticPropertyBridge
    
    public init(_ propertyBridge: @escaping (String) -> JXBridge.StaticPropertyBridge) {
        self.propertyBridge = propertyBridge
    }
    
/*ARITY:PROPERTY
extension JXStaticVar {
    public init<${VALUE_TYPES}>(wrappedValue: (get: () throws -> ${VALUE}, set: ((${VALUE}) -> Void)?)) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<${VALUE_TYPES}>(wrappedValue: @escaping () throws -> ${VALUE}) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
}
ARITY*/
     
/*ARITY:ASYNC_PROPERTY
extension JXStaticVar {
    public init<${VALUE_TYPES}>(wrappedValue: @escaping () async throws -> ${VALUE}) {
        self = JXStaticVar({ JXBridge.StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue) })
    }
}
ARITY*/
    
    public var wrappedValue: Any? {
        get {
            return nil
        }
        set {
        }
    }
}

/// Property wrapper bridging a class property to JavaScript.
///
///     @JXClassVar class var jxcount = (Counter.self, { $0.count })
///     class var count: Int { return ... }
///
/// - Note: Any `jx` prefix will be stripped in the bridged JavaScript property name.
@propertyWrapper
public struct JXClassVar {
    let propertyBridge: (String) -> JXBridge.PropertyBridge
    
    public init(_ propertyBridge: @escaping (String) -> JXBridge.PropertyBridge) {
        self.propertyBridge = propertyBridge
    }
    
/*ARITY:PROPERTY
extension JXClassVar {
    public init<T, ${VALUE_TYPES}>(wrappedValue: (get: (T.Type) throws -> ${VALUE}, set: ((T.Type, ${VALUE}) -> Void)?), _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) })
    }
    
    public init<T, ${VALUE_TYPES}>(wrappedValue: @escaping (T.Type) throws -> ${VALUE}, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
}
ARITY*/
     
/*ARITY:ASYNC_PROPERTY
extension JXClassVar {
    public init<T, ${VALUE_TYPES}>(wrappedValue: @escaping (${VALUE}.Type) async throws -> ${VALUE}, _ type: T.Type) {
        self = JXClassVar({ JXBridge.PropertyBridge(name: $0, classGetter: wrappedValue) })
    }
}
ARITY*/
    
    public var wrappedValue: Any? {
        get {
            return nil
        }
        set {
        }
    }
}

/// Property wrapper bridging a key path value to a JavaScript property.
///
///     @JXKeyPath var jxcomputedTotal = \Counter.computedTotal
///     var total: Int { return ... }
@propertyWrapper
public struct JXKeyPath {
    let propertyBridge: (String) -> JXBridge.PropertyBridge
    
    public init(_ propertyBridge: @escaping (String) -> JXBridge.PropertyBridge) {
        self.propertyBridge = propertyBridge
    }

/*ARITY:PROPERTY
extension JXKeyPath {
    public init<T, ${VALUE_TYPES}>(wrappedValue: KeyPath<T, ${VALUE}>) {
        self = JXKeyPath({ JXBridge.PropertyBridge(name: $0, keyPath: wrappedValue) })
    }
}
ARITY*/
    
    public var wrappedValue: Any? {
        get {
            return nil
        }
        set {
        }
    }
}

/// Property wrapper bridging a constructor to JavaScript.
///
///     @JXInit var jxinit = init
///     init(value: Int) { ... }
@propertyWrapper
public struct JXInit {
    let constructorBridge: JXBridge.ConstructorBridge
    
    public init(_ constructorBridge: JXBridge.ConstructorBridge) {
        self.constructorBridge = constructorBridge
    }

/*ARITY:INIT
extension JXInit {
    public init<T${PARAM_COMMA}${PARAM_TYPES_LIST}>(wrappedValue: @escaping (${PARAM_LIST}) throws -> T) {
        self = JXInit(JXBridge.ConstructorBridge(wrappedValue))
    }
}
ARITY*/
    
    public var wrappedValue: Any? {
        get {
            return nil
        }
        set {
        }
    }
}

/// Property wrapper bridging an instance function to JavaScript.
///
///     @JXFunc var jxincrement = increment
///     func increment(by: Int) -> Int { ... }
///
/// - Note: Any `jx` prefix will be stripped in the bridged JavaScript function name.
@propertyWrapper
public struct JXFunc {
    let functionBridge: (String) -> JXBridge.FunctionBridge
    
    public init(_ functionBridge: @escaping (String) -> JXBridge.FunctionBridge) {
        self.functionBridge = functionBridge
    }

/*ARITY:FUNCTION
extension JXFunc {
    public init<T, ${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(wrappedValue: @escaping (T) -> (${PARAM_LIST}) throws -> ${RETURN}) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}
ARITY*/

/*ARITY:ASYNC_FUNCTION
 extension JXFunc {
    public init<T, ${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(wrappedValue: @escaping (T) -> (${PARAM_LIST}) async throws -> ${RETURN}) {
        self = JXFunc({ JXBridge.FunctionBridge(name: $0, function: wrappedValue) })
    }
}
ARITY*/

    public var wrappedValue: Any? {
        get {
            return nil
        }
        set {
        }
    }
}

/// Property wrapper bridging a static function to JavaScript.
///
///     @JXStaticFunc var jxfactory = factory
///     static func factory() -> Type { ... }
///
/// - Note: Any `jx` prefix will be stripped in the bridged JavaScript function name.
@propertyWrapper
public struct JXStaticFunc {
    public let functionBridge: (String) -> JXBridge.StaticFunctionBridge
    
    public init(_ functionBridge: @escaping (String) -> JXBridge.StaticFunctionBridge) {
        self.functionBridge = functionBridge
    }

/*ARITY:FUNCTION
extension JXStaticFunc {
    public init<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(wrappedValue: @escaping (${PARAM_LIST}) throws -> ${RETURN}) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}
ARITY*/

/*ARITY:ASYNC_FUNCTION
extension JXStaticFunc {
    public init<${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(wrappedValue: @escaping (${PARAM_LIST}) async throws -> ${RETURN}) {
        self = JXStaticFunc({ JXBridge.StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) })
    }
}
ARITY*/
    
    public var wrappedValue: Any? {
        get {
            return nil
        }
        set {
        }
    }
}

/// Property wrapper bridging a class function to JavaScript.
///
///     @JXClassFunc var jxfactory = (Counter.self, { $0.factory() })
///     class func factory() -> Self { ... }
///
/// - Note: Any `jx` prefix will be stripped in the bridged JavaScript function name.
@propertyWrapper
public struct JXClassFunc {
    public let functionBridge: (String) -> JXBridge.FunctionBridge
    
    public init(_ functionBridge: @escaping (String) -> JXBridge.FunctionBridge) {
        self.functionBridge = functionBridge
    }
    
/*ARITY:FUNCTION
extension JXClassFunc {
    public init<T, ${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(wrappedValue: @escaping (T.Type${PARAM_COMMA}${PARAM_LIST}) throws -> ${RETURN}, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}
ARITY*/

/*ARITY:ASYNC_FUNCTION
extension JXClassFunc {
    public init<T, ${PARAM_TYPES_LIST}${PARAM_COMMA}${RETURN_TYPES}>(wrappedValue: @escaping (T.Type${PARAM_COMMA}${PARAM_LIST}) async throws -> ${RETURN}, _ type: T.Type) {
        self = JXClassFunc({ JXBridge.FunctionBridge(name: $0, classFunction: wrappedValue) })
    }
}
ARITY*/

    public var wrappedValue: Any? {
        get {
            return nil
        }
        set {
        }
    }
}

// MARK: -

protocol BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge)
}

extension BridgingPropertyWrapper {
    func memberName(for label: String) -> String {
        var name = label.dropFirst()
        if name.hasPrefix("jx") {
            name = name.dropFirst(2)
        }
        return String(name)
    }
    
    // Find the property wrapper with the given label for the given instance. The property wrapper type must be an object type.
    static func propertyWrapperObject(with label: String, for instance: Any) -> Self? {
        guard let bridging = instance as? JXBridging else {
            return nil
        }
        
        let state: JXState
        if let bridgingState = bridging.jxState {
            state = bridgingState
        } else {
            state = JXState(instance: instance)
            bridging.jxState = state
        }
        return state.propertyWrapperObjects[label] as? Self
    }
}

extension JX: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        let typeName = bridge.typeName
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            guard let propertyWrapper = Self.propertyWrapperObject(with: label, for: obj) else {
                throw JXError(message: "Unable to access @JX property wrapper")
            }
            return try context.convey(propertyWrapper.wrappedValue)
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            guard let propertyWrapper = Self.propertyWrapperObject(with: label, for: obj) else {
                throw JXError(message: "Unable to access @JX property wrapper")
            }
            let p0 = try value.convey(to: T.self)
            propertyWrapper.wrappedValue = p0
            return obj
        }
        bridge.properties.append(JXBridge.PropertyBridge(owningTypeName: typeName, name: memberName(for: label), getter: getter, setter: setter))
    }
}

extension JXPublished: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        let typeName = bridge.typeName
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            guard let propertyWrapper = Self.propertyWrapperObject(with: label, for: obj) else {
                throw JXError(message: "Unable to access @JXPublished property wrapper")
            }
            return try context.convey(propertyWrapper.value)
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            guard let propertyWrapper = Self.propertyWrapperObject(with: label, for: obj) else {
                throw JXError(message: "Unable to access @JXPublished property wrapper")
            }
            let p0 = try value.convey(to: T.self)
            if let owner = obj as? (any ObservableObject) {
                propertyWrapper.updateValue(p0, owner: owner)
            } else {
                propertyWrapper.value = p0
            }
            return obj
        }
        bridge.properties.append(JXBridge.PropertyBridge(owningTypeName: typeName, name: memberName(for: label), getter: getter, setter: setter))
    }
}

extension JXVar: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        bridge.properties.append(propertyBridge(memberName(for: label)))
    }
}

extension JXStaticVar: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        bridge.staticProperties.append(propertyBridge(memberName(for: label)))
    }
}

extension JXClassVar: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        bridge.classProperties.append(propertyBridge(memberName(for: label)))
    }
}

extension JXKeyPath: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        bridge.properties.append(propertyBridge(memberName(for: label)))
    }
}

extension JXInit: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        bridge.constructors.append(constructorBridge)
    }
}

extension JXFunc: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        bridge.functions.append(functionBridge(memberName(for: label)))
    }
}

extension JXStaticFunc: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        bridge.staticFunctions.append(functionBridge(memberName(for: label)))
    }
}

extension JXClassFunc: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        bridge.classFunctions.append(functionBridge(memberName(for: label)))
    }
}
