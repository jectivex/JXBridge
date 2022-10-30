import JXKit

public protocol JXBridging {
    static func bridgeJX() -> JXBridge
}

extension JXBridging {
    public static func bridgeJX() -> JXBridge {
        return JXBridge(type: self)
    }
}

@propertyWrapper
public struct JXVar<T, V> {
    private let name: String?

    public init(wrappedValue: KeyPath<T, V>, as name: String? = nil) {
        self.wrappedValue = wrappedValue
        self.name = name
    }

    public let wrappedValue: KeyPath<T, V>
}

protocol BridgingPropertyWrapper {
    func addMembers(for child: String, to bridge: inout JXBridge)
}

extension BridgingPropertyWrapper {
    func memberName(for child: String, isSynthetic: Bool) -> String {
        // Property wrapper vars have a '_' prefix
        guard child.first == "_" else {
            return child
        }

        // Let users give property wrappers on synthetic vars an additional
        // '_' prefix so that they can mirror the name of the referenced var
        var dropCount = 1
        if (isSynthetic && child.hasPrefix("__")) {
            dropCount = 2
        }
        return String(child.dropFirst(dropCount))
    }
}

extension JXVar: BridgingPropertyWrapper {
    func addMembers(for child: String, to bridge: inout JXBridge) {
        let propertyBridge = PropertyBridge(name: self.name ?? memberName(for: child, isSynthetic: true), keyPath: self.wrappedValue)
        bridge.properties.append(propertyBridge)
    }
}

@propertyWrapper
public struct JXConstructor<T> {
    private let constructorBridge: () -> ConstructorBridge

    public init(wrappedValue: @escaping () throws -> T) {
        self.constructorBridge = { ConstructorBridge(wrappedValue) }
    }

    public init<P0>(wrappedValue: @escaping (P0) throws -> T) {
        self.constructorBridge = { ConstructorBridge(wrappedValue) }
    }

    public var wrappedValue: () throws -> T {
        get {
            fatalError("Do not read or write @JXConstructor vars")
        }
        set {
            fatalError("Do not read or write @JXConstructor vars")
        }
    }
}

extension JXConstructor: BridgingPropertyWrapper {
    func addMembers(for child: String, to bridge: inout JXBridge) {
        let constructorBridge = self.constructorBridge()
        bridge.constructors.append(constructorBridge)
    }
}

///// Types that bridge their API to JavaScript using JX property wrappers must conform to this protocol.
//public protocol JXBridgeable {
//    var jxbState: JXBridgeState { get }
//}
//
///// Opaque type used to track bridging state.
//public class JXBridgeState {
//    fileprivate var storedPropertiesByName: [String: StoredProperty] = [:]
//
//    fileprivate func initialize(enclosingInstance: Any) {
//        guard !isInitialized else {
//            return
//        }
//
//        isInitialized = true
//        let mirror = Mirror(reflecting: enclosingInstance)
//        for child in mirror.children {
//            if let label = child.label, let storedProperty = child.value as? StoredProperty {
//                storedPropertiesByName[label] = storedProperty
//            }
//        }
//    }
//    private var isInitialized = false
//}
//
///// Apply to stored properties to bridge them to JavaScript.
//@propertyWrapper
//public struct JX<V> {
//    public init(wrappedValue: V) {
//        self.wrappedValue = wrappedValue
//    }
//
//    public var wrappedValue: V
//}
//
//// MARK: -
//
//extension JXBridgeable {
//    fileprivate func jxbuildBridge() -> JXBridge {
//        var bridge = JXBridge(type(of: self))
//        let mirror = Mirror(reflecting: self)
//        for child in mirror.children {
//            if let label = child.label, let bridgingPropertyWrapper = child.value as? BridgingPropertyWrapper {
//                bridgingPropertyWrapper.add(to: &bridge, label: label)
//            }
//        }
//        bridge.prepareLookupCaches()
//        return bridge
//    }
//}
//
//fileprivate protocol BridgingPropertyWrapper {
//    func add(to bridge: inout JXBridge, label: String)
//}
//
//fileprivate protocol StoredProperty {
//    func get(in context: JXContext) throws -> JXValue
//    mutating func set(_ value: JXValue) throws
//}
//
//extension JX: BridgingPropertyWrapper, StoredProperty {
//    fileprivate func add(to bridge: inout JXBridge, label: String) {
//        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
//            return context.null()
//        }
//        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
//            guard let bridgeable = obj as? JXBridgeable else {
//                throw JXBridgeErrors.internalError(String(describing: type(of: obj)))
//            }
//            bridgeable.jxbState.initialize(enclosingInstance: bridgeable)
//            guard var storedProperty = bridgeable.jxbState.storedPropertiesByName[label] else {
//                throw JXBridgeErrors.unknownPropertyName(String(describing: type(of: obj)), label)
//            }
//            try storedProperty.set(value)
//            //~~~ OK we can reset it in the dict, but this won't affect reading the instance value directly
//            bridgeable.jxbState.storedPropertiesByName[label] = storedProperty // Mutated
//            return bridgeable
//        }
//        let propertyBridge = PropertyBridge(name: label, getter: getter, setter: setter)
//        bridge.properties.append(propertyBridge)
//    }
//
//    fileprivate func get(in context: JXContext) throws -> JXValue {
//        return try context.convey(wrappedValue)
//    }
//
//    fileprivate mutating func set(_ value: JXValue) throws {
//        wrappedValue = try value.convey()
//    }
//}
//
//extension JX: JXBridgePropertyWrapper {
//    func build(enclosingType: Any.Type, label: String, bridge: inout JXBridge) {
//        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
//
//        }
//        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
//            return obj
//        }
//        //let property = PropertyBridge(name: label, getter: , setter: <#T##((Any, JXValue, JXContext) throws -> Any)?##((Any, JXValue, JXContext) throws -> Any)?##(Any, JXValue, JXContext) throws -> Any#>)
//    }
//
//
//}
//
//@propertyWrapper
//public struct JXRef<T> {
//    private let builder: (String, JXBridgeBuilder<T>) -> Void
//
//    public init(wrappedValue: Any) {
//        self.builder = { label, builder in
//
//        }
//    }
//
//    public var wrappedValue: Any {
//        get { fatalError("Do not access JXRef annotated properties") }
//        set { fatalError("Do not access JXRef annotated properties") }
//    }
//}
//
//@propertyWrapper
//public struct JXFunc<O, U> {
//    private let builder: (String) -> String
//
//    public init(wrappedValue: Any) {
//        self.builder = { _ in fatalError("Unsupported JXFunc value: \(wrappedValue)") }
//    }
//
//    public var wrappedValue: Any {
//        get { fatalError() }
//        set { fatalError() }
//    }
//}
//
///// A property wrapper that contributes to building the owning type's `JXBridge`.
//protocol JXBridgePropertyWrapper {
//    func build(label: String, bridge: inout JXBridge)
//}
//
//
//
//extension JXFunc {
//    public init(wrappedValue f: @escaping (O) -> () throws -> U) {
//        self.builder = { "F LABEL: \($0)(Void) -> \(U.self)" }
//    }
//
//    public init<P0>(wrappedValue f: @escaping (O) -> (P0) throws -> U) {
//        self.builder = { "F LABEL: \($0)(\(P0.self)) -> \(U.self)" }
//    }
//
//    public init<P0, P1>(wrappedValue f: @escaping (O) -> (P0, P1) throws -> U) {
//        self.builder = { "F LABEL: \($0)(\(P0.self), \(P1.self)) -> \(U.self)" }
//    }
//}
//
//
//extension JXFunc: JXBridgePropertyWrapper {
//    func build(label: String) {
//        print("BRIDGE BUILDER: \(builder(label))")
//    }
//}
//
//extension JXVar: JXBridgePropertyWrapper {
//    func build(label: String) {
//        print("BRIDGE BUILDER: \(label): \(V.self)")
//    }
//}
//
//extension JXComputedVar: JXBridgePropertyWrapper {
//    func build(label: String) {
//        print("BRIDGE BUILDER: \(label): \(V.self)")
//    }
//}

