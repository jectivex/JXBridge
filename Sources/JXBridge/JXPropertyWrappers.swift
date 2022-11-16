import JXKit

/// Property wrapper bridging a stored property.
@propertyWrapper
public class JX<T> {
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    
    public var wrappedValue: T
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
