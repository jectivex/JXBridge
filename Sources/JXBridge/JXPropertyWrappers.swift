#if canImport(Combine)
import Combine
#endif
import JXKit

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

#if canImport(Combine)

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

#endif

/// Property wrapper bridging an instance property to JavaScript.
///
///     @JXVar var jxcount = (get: { $0.count }, set: { $0.count = $0 })
///     var count = 1
///
/// - Note: Any `jx` prefix will be stripped in the bridged JavaScript property name.
/// - Seealso: `JXKeyPath`
@propertyWrapper
public struct JXVar<T, V> {
    private let propertyBridge: (String) -> PropertyBridge
    
    public init(wrappedValue: (get: (T) throws -> V, set: ((T, V) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init(wrappedValue: @escaping (T) throws -> V, _ type: T.Type) {
        self = JXVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
    
    public init(wrappedValue: @escaping (T) async throws -> V, _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, getter: wrappedValue) }
    }
    
    public var wrappedValue: (get: (T) throws -> V, set: ((T, V) -> Void)?) {
        get {
            return (get: { _ in throw JXBridgeErrors.internalError("Do not read or write @JXVar values") }, set: nil)
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
public struct JXStaticVar<V> {
    private let propertyBridge: (String) -> StaticPropertyBridge
    
    public init(wrappedValue: (get: () throws -> V, set: ((V) -> Void)?)) {
        propertyBridge = { StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init(wrappedValue: @escaping () throws -> V) {
        self = JXStaticVar(wrappedValue: (get: wrappedValue, set: nil))
    }
    
    public init(wrappedValue: @escaping () async throws -> V) {
        propertyBridge = { StaticPropertyBridge(name: $0, type: Any.self, getter: wrappedValue) }
    }
    
    public var wrappedValue: (get: () throws -> V, set: ((V) -> Void)?) {
        get {
            return (get: { throw JXBridgeErrors.internalError("Do not read or write @JXStaticVar values") }, set: nil)
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
public struct JXClassVar<T, V> {
    private let propertyBridge: (String) -> PropertyBridge
    
    public init(wrappedValue: (get: (T.Type) throws -> V, set: ((T.Type, V) -> Void)?), _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, classGetter: wrappedValue.get, setter: wrappedValue.set) }
    }
    
    public init(wrappedValue: @escaping (T.Type) throws -> V, _ type: T.Type) {
        self = JXClassVar(wrappedValue: (get: wrappedValue, set: nil), type)
    }
    
    public init(wrappedValue: @escaping (T.Type) async throws -> V, _ type: T.Type) {
        propertyBridge = { PropertyBridge(name: $0, classGetter: wrappedValue) }
    }
    
    public var wrappedValue: (get: (T.Type) throws -> V, set: ((T.Type, V) -> Void)?) {
        get {
            return (get: { _ in throw JXBridgeErrors.internalError("Do not read or write @JXClassVar values") }, set: nil)
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
public struct JXKeyPath<T, V> {
    private let propertyBridge: (String) -> PropertyBridge

    public init(wrappedValue: KeyPath<T, V>) {
        propertyBridge = { PropertyBridge(name: $0, keyPath: wrappedValue) }
        self.wrappedValue = wrappedValue
    }
    
    public var wrappedValue: KeyPath<T, V>
}

/// Property wrapper bridging a constructor to JavaScript.
///
///     @JXInit var jxinit = init
///     init(value: Int) { ... }
@propertyWrapper
public struct JXInit<T> {
    private let constructorBridge: ConstructorBridge

    public init(wrappedValue: @escaping () throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
    
    public init<P0>(wrappedValue: @escaping (P0) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
    
    public init<P0, P1>(wrappedValue: @escaping (P0, P1) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
    
    public init<P0, P1, P2>(wrappedValue: @escaping (P0, P1, P2) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
    
    public init<P0, P1, P2, P3>(wrappedValue: @escaping (P0, P1, P2, P3) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
    
    public init<P0, P1, P2, P3, P4>(wrappedValue: @escaping (P0, P1, P2, P3, P4) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
    
    public init<P0, P1, P2, P3, P4, P5>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
    
    public init<P0, P1, P2, P3, P4, P5, P6>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
    
    public init<P0, P1, P2, P3, P4, P5, P6, P7>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> T) {
        constructorBridge = ConstructorBridge(wrappedValue)
    }
    
    public var wrappedValue: () throws -> T {
        get {
            return { throw JXBridgeErrors.internalError("Do not read or write @JXInit values") }
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
public struct JXFunc<T, R> {
    private let functionBridge: (String) -> FunctionBridge

    // MARK: 0 parameters
    
    public init(wrappedValue: @escaping (T) -> () throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    public init(wrappedValue: @escaping (T) -> () async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    // MARK: 1 parameter
    
    public init<P0>(wrappedValue: @escaping (T) -> (P0) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    public init<P0>(wrappedValue: @escaping (T) -> (P0) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    // MARK: 2 parameters
    
    public init<P0, P1>(wrappedValue: @escaping (T) -> (P0, P1) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    public init<P0, P1>(wrappedValue: @escaping (T) -> (P0, P1) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    // MARK: 3 parameters
    
    public init<P0, P1, P2>(wrappedValue: @escaping (T) -> (P0, P1, P2) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    public init<P0, P1, P2>(wrappedValue: @escaping (T) -> (P0, P1, P2) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    // MARK: 4 parameters
    
    public init<P0, P1, P2, P3>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    // MARK: 5 parameters
    
    public init<P0, P1, P2, P3, P4>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3, P4>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    // MARK: 6 parameters
    
    public init<P0, P1, P2, P3, P4, P5>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3, P4, P5>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    // MARK: 7 parameters
    
    public init<P0, P1, P2, P3, P4, P5, P6>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3, P4, P5, P6>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    // MARK: 8 parameters
    
    public init<P0, P1, P2, P3, P4, P5, P6, P7>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3, P4, P5, P6, P7>(wrappedValue: @escaping (T) -> (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }

    public var wrappedValue: (T) -> () throws -> R {
        get {
            return { _ in { throw JXBridgeErrors.internalError("Do not read or write @JXFunc values") }}
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
public struct JXStaticFunc<R> {
    private let functionBridge: (String) -> StaticFunctionBridge

    // MARK: 0 parameters
    
    public init(wrappedValue: @escaping () throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    public init(wrappedValue: @escaping () async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    // MARK: 1 parameter
    
    public init<P0>(wrappedValue: @escaping (P0) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    public init<P0>(wrappedValue: @escaping (P0) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    // MARK: 2 parameters
    
    public init<P0, P1>(wrappedValue: @escaping (P0, P1) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    public init<P0, P1>(wrappedValue: @escaping (P0, P1) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    // MARK: 3 parameters
    
    public init<P0, P1, P2>(wrappedValue: @escaping (P0, P1, P2) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    public init<P0, P1, P2>(wrappedValue: @escaping (P0, P1, P2) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    // MARK: 4 parameters
    
    public init<P0, P1, P2, P3>(wrappedValue: @escaping (P0, P1, P2, P3) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3>(wrappedValue: @escaping (P0, P1, P2, P3) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    // MARK: 5 parameters
    
    public init<P0, P1, P2, P3, P4>(wrappedValue: @escaping (P0, P1, P2, P3, P4) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3, P4>(wrappedValue: @escaping (P0, P1, P2, P3, P4) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    // MARK: 6 parameters
    
    public init<P0, P1, P2, P3, P4, P5>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3, P4, P5>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    // MARK: 7 parameters
    
    public init<P0, P1, P2, P3, P4, P5, P6>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3, P4, P5, P6>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    // MARK: 8 parameters
    
    public init<P0, P1, P2, P3, P4, P5, P6, P7>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3, P4, P5, P6, P7>(wrappedValue: @escaping (P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R) {
        functionBridge = { StaticFunctionBridge(name: $0, type: Any.self, function: wrappedValue) }
    }

    public var wrappedValue: () throws -> R {
        get {
            return { throw JXBridgeErrors.internalError("Do not read or write @JXStaticFunc values") }
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
public struct JXClassFunc<T, R> {
    private let functionBridge: (String) -> FunctionBridge
    
    // MARK: 0 parameters

    public init(wrappedValue: @escaping (T.Type) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    public init(wrappedValue: @escaping (T.Type) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    // MARK: 1 parameter
    
    public init<P0>(wrappedValue: @escaping (T.Type, P0) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    public init<P0>(wrappedValue: @escaping (T.Type, P0) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    // MARK: 2 parameters
    
    public init<P0, P1>(wrappedValue: @escaping (T.Type, P0, P1) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    public init<P0, P1>(wrappedValue: @escaping (T.Type, P0, P1) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    // MARK: 3 parameters
    
    public init<P0, P1, P2>(wrappedValue: @escaping (T.Type, P0, P1, P2) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    public init<P0, P1, P2>(wrappedValue: @escaping (T.Type, P0, P1, P2) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    // MARK: 4 parameters
    
    public init<P0, P1, P2, P3>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    // MARK: 5 parameters
    
    public init<P0, P1, P2, P3, P4>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3, P4>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    // MARK: 6 parameters
    
    public init<P0, P1, P2, P3, P4, P5>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3, P4, P5>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    // MARK: 7 parameters
    
    public init<P0, P1, P2, P3, P4, P5, P6>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3, P4, P5, P6>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    // MARK: 8 parameters
    
    public init<P0, P1, P2, P3, P4, P5, P6, P7>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }
    
    public init<P0, P1, P2, P3, P4, P5, P6, P7>(wrappedValue: @escaping (T.Type, P0, P1, P2, P3, P4, P5, P6, P7) async throws -> R, _ type: T.Type) {
        functionBridge = { FunctionBridge(name: $0, classFunction: wrappedValue) }
    }

    public var wrappedValue: (T.Type, (T.Type) throws -> R) {
        get {
            return (T.self, { _ in throw JXBridgeErrors.internalError("Do not read or write @JXClassFunc values") })
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
        guard let bridging = instance as? any JXBridging else {
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
                throw JXBridgeErrors.unknownPropertyName(typeName, label)
            }
            return try context.convey(propertyWrapper.wrappedValue)
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            guard let propertyWrapper = Self.propertyWrapperObject(with: label, for: obj) else {
                throw JXBridgeErrors.unknownPropertyName(typeName, label)
            }
            let p0 = try value.convey(to: T.self)
            propertyWrapper.wrappedValue = p0
            return obj
        }
        bridge.properties.append(PropertyBridge(name: memberName(for: label), getter: getter, setter: setter))
    }
}

extension JXPublished: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        let typeName = bridge.typeName
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            guard let propertyWrapper = Self.propertyWrapperObject(with: label, for: obj) else {
                throw JXBridgeErrors.unknownPropertyName(typeName, label)
            }
            return try context.convey(propertyWrapper.value)
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            guard let propertyWrapper = Self.propertyWrapperObject(with: label, for: obj) else {
                throw JXBridgeErrors.unknownPropertyName(typeName, label)
            }
            let p0 = try value.convey(to: T.self)
            if let owner = obj as? (any ObservableObject) {
                propertyWrapper.updateValue(p0, owner: owner)
            } else {
                propertyWrapper.value = p0
            }
            return obj
        }
        bridge.properties.append(PropertyBridge(name: memberName(for: label), getter: getter, setter: setter))
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
