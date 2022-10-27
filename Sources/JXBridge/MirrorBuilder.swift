/// Use reflection to detect our property wrappers and add the corresponding members to a bridge.
class MirrorBuilder {
    init(_ mirror: Mirror, bridge: JXBridge) {
        self.mirror = mirror
        self.bridge = bridge
    }

    let mirror: Mirror
    var bridge: JXBridge

    func addReflectedMembers() {
        if bridge.superclass == nil {
            bridge.superclass = mirror.superclassMirror?.subjectType
        }
        for child in mirror.children {
            addReflectedMembers(for: child)
        }
    }

    private func addReflectedMembers(for child: Mirror.Child) {
        if let bridgingWrapper = child.value as? MirrorBridgingPropertyWrapper {
            bridgingWrapper.addReflectedMembers(for: child, to: &bridge)
        }
    }
}

protocol MirrorBridgingPropertyWrapper {
    func addReflectedMembers(for child: Mirror.Child, to bridge: inout JXBridge)
}

extension MirrorBridgingPropertyWrapper {
    func memberName(for child: Mirror.Child) -> String {
        guard let name = child.label else {
            return ""
        }
        guard name.first == "_" else {
            return name
        }
        return String(name.dropFirst())
    }
}
