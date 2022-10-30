#if canImport(Foundation)
import Foundation
#endif

//~~~
public struct JXBridgeAutoRegistration {
    public static let related = JXBridgeAutoRegistration(RelatedTypesRegistering(processReachable: false))
    static let reachable = JXBridgeAutoRegistration(RelatedTypesRegistering(processReachable: true))
#if canImport(ObjectiveC)
    static let objc = JXBridgeAutoRegistration(ObjectiveCRegistering())
#endif

    static func mapped(_ types: [String: Any]) -> JXBridgeAutoRegistration {
        return JXBridgeAutoRegistration(MappedTypeNameRegistering(types: types))
    }

    static func custom(_ registering: JXBridgeRegistering) -> JXBridgeAutoRegistration {
        return JXBridgeAutoRegistration(registering)
    }

    public let registering: JXBridgeRegistering

    init(_ registering: JXBridgeRegistering) {
        self.registering = registering
    }
}

public protocol JXBridgeRegistering {
    func addBridge(for typeName: String, to registry: JXBridgeRegistry) -> Bool
    func addBridge(for type: Any.Type, to registry: JXBridgeRegistry) -> Bool
    func didAdd(bridge: JXBridge, to registry: JXBridgeRegistry)
}

class RelatedTypesRegistering: JXBridgeRegistering {
    private let processReachable: Bool
    private var recursionDepth = 0

    init(processReachable: Bool) {
        self.processReachable = processReachable
    }

    func addBridge(for typeName: String, to registry: JXBridgeRegistry) -> Bool {
        return false
    }

    func addBridge(for type: Any.Type, to registry: JXBridgeRegistry) -> Bool {
        return add(for: type, to: registry)
    }

    func didAdd(bridge: JXBridge, to registry: JXBridgeRegistry) {
        guard processReachable || recursionDepth == 0 else {
            return
        }
        recursionDepth += 1
        for type in bridge.relatedTypes {
            if !registry.hasBridge(for: type) {
                add(for: type, to: registry)
            }
        }
        recursionDepth -= 1
    }

    private func add(for type: Any.Type, to registry: JXBridgeRegistry) -> Bool {
        if let bridgingType = type as? JXBridging.Type {
            registry.add(forBridgingType: bridgingType)
            return true
        }
#if canImport(ObjectiveC)
        if let nsobjectType = type as? NSObject.Type {
            registry.add(forObjectiveCType: nsobjectType)
            return true
        }
#endif
        return false
    }
}

struct MappedTypeNameRegistering: JXBridgeRegistering {
    let types: [String: Any]

    func addBridge(for typeName: String, to registry: JXBridgeRegistry) -> Bool {

    }

    func addBridge(for type: Any.Type, to registry: JXBridgeRegistry) -> Bool {
        return false
    }

    func didAdd(bridge: JXBridge, to registry: JXBridgeRegistry) {
    }
}

#if canImport(ObjectiveC)

struct ObjectiveCRegistering: JXBridgeRegistering {
    func addBridge(for typeName: String, to registry: JXBridgeRegistry) -> Bool {
        guard let cls = NSClassFromString(typeName), let nsobjectType = cls as? NSObject.Type else {
            return false
        }
        registry.add(forObjectiveCType: nsobjectType)
        return true
    }

    func addBridge(for type: Any.Type, to registry: JXBridgeRegistry) -> Bool {
        guard let nsobjectType = type as? NSObject.Type else {
            return false
        }
        registry.add(forObjectiveCType: nsobjectType)
        return true
    }

    func didAdd(bridge: JXBridge, to registry: JXBridgeRegistry) {
    }
}

#endif
