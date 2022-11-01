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
        bridge.includesInstanceInfo = true
    }

    private func addReflectedMembers(for child: Mirror.Child) {
        if let bridgingWrapper = child.value as? BridgingPropertyWrapper {
            bridgingWrapper.addMembers(for: child.label ?? "", to: &bridge)
        }
    }
}