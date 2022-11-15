/// Listen for registry additions.
protocol RegistryListener: AnyObject {
    func didAddNamespace(_ namespace: JXNamespace) throws
    func didAddModule(_ module: JXModule) throws
    func didAddUnnamespacedBridge(_ bridge: JXBridge) throws
}

class RegistryListeners {
    // Note: it would have been nice to use publishers for these events, but we want to be able to synchronously throw any listener errors
    private var listeners: [WeakListenerRef] = []
    
    func addListener(_ listener: RegistryListener) {
        listeners.compact()
        listeners.append(WeakListenerRef(listener: listener))
    }
    
    func removeListener(_ listener: RegistryListener) {
        listeners.compact()
        listeners.removeAll { $0.listener === listener }
    }
    
    func didAddNamespace(_ namespace: JXNamespace) throws {
        try listeners.forEach { try $0.listener?.didAddNamespace(namespace) }
    }
    
    func didAddModule(_ module: JXModule) throws {
        try listeners.forEach { try $0.listener?.didAddModule(module) }
    }
    
    func didAddUnnamespacedBridge(_ bridge: JXBridge) throws {
        try listeners.forEach { try $0.listener?.didAddUnnamespacedBridge(bridge) }
    }
}

private struct WeakListenerRef {
    weak var listener: RegistryListener?
}

extension Array where Element == WeakListenerRef {
    mutating func compact() {
        removeAll { $0.listener == nil }
    }
}
