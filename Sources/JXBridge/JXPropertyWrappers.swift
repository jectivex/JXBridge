import JXKit

/// Property wrapper bridging a stored property to JavaScript.
///
///     @JX var count = 1
@propertyWrapper
public class JX<T> {
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    
    public var wrappedValue: T
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

    public init(wrappedValue: @escaping (T) -> () throws -> R) {
        functionBridge = { FunctionBridge(name: $0, function: wrappedValue) }
    }
    
    public init<P0>(wrappedValue: @escaping (T) -> (P0) throws -> R) {
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

protocol BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge)
}

extension BridgingPropertyWrapper {
    // Find the property wrapper with the given label for the given instance.
    static func propertyWrapper(with label: String, for instance: Any) -> Self? {
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
        return state.bridgingPropertyWrappers[label] as? Self
    }
    
    func memberName(for label: String) -> String {
        return String(label.dropFirst())
    }
}

extension JX: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        let typeName = bridge.typeName
        let getter: (Any, JXContext) throws -> JXValue = { obj, context in
            guard let propertyWrapper = Self.propertyWrapper(with: label, for: obj) else {
                throw JXBridgeErrors.unknownPropertyName(typeName, label)
            }
            return try context.convey(propertyWrapper.wrappedValue)
        }
        let setter: (Any, JXValue, JXContext) throws -> Any = { obj, value, context in
            guard let propertyWrapper = Self.propertyWrapper(with: label, for: obj) else {
                throw JXBridgeErrors.unknownPropertyName(typeName, label)
            }
            let p0 = try value.convey(to: T.self)
            propertyWrapper.wrappedValue = p0
            return obj
        }
        bridge.properties.append(PropertyBridge(name: memberName(for: label), getter: getter, setter: setter))
    }
}

extension JXFunc: BridgingPropertyWrapper {
    func addMembers(for label: String, to bridge: inout JXBridge) {
        var name = label.dropFirst()
        if name.hasPrefix("jx") {
            name = name.dropFirst(2)
        }
        bridge.functions.append(functionBridge(String(name)))
    }
}
