import Foundation

public struct JXBridgeAutoRegistration {

}

public protocol JXBridgeAutoRegistering {
    func addBridge(typeName: String, type: Any.Type?, to registry: JXBridgeRegistry) -> Bool
    func didAdd(bridge: JXBridge, to registry: JXBridgeRegistry)
}

class RelatedTypesAutoRegistering: JXBridgeAutoRegistering {
    private let processReachable: Bool
    private var recursionDepth = 0

    init(processReachable: Bool) {
        self.processReachable = processReachable
    }

    func addBridge(typeName: String, type: Any.Type?, to registry: JXBridgeRegistry) -> Bool {
        guard let type else {
            return false
        }
        registry.add(for: type)
        return true
    }

    func didAdd(bridge: JXBridge, to registry: JXBridgeRegistry) {
        guard processReachable || recursionDepth == 0 else {
            return
        }
        recursionDepth += 1
        for type in bridge.relatedTypes {
            if let bridgingType = type as? JXBridging.Type {

            } else {
#if canImport(ObjectiveC)
                if nsobjectType = type as? NSObject.Type {
                    registry.add(forObjectiveCType: <#T##T.Type#>)
                }
#endif
            }
            if !registry.hasBridge(for: type) {
                registry.add(for: type)
            }
        }
        recursionDepth -= 1
    }
}

#if canImport(ObjectiveC)

struct ObjectiveCAutoRegistering: JXBridgeAutoRegistering {
    func addBridge(typeName: String, type: Any.Type?, to registry: JXBridgeRegistry) -> Bool {
        var objcClass: AnyClass? = nil
        if type is NSObject.Type, let cls = type as? AnyClass {
            objcClass = cls
        } else if type == nil, let cls = NSClassFromString(typeName), cls is NSObject.Type {
            objcClass = cls
        }
        guard let objcClass else {
            return false
        }
        registry.add(for: objcClass)
        return true
    }

    func didAdd(bridge: JXBridge, to registry: JXBridgeRegistry) {
    }
}

#endif
