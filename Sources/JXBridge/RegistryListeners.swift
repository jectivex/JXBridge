/// Listen for registry additions.
protocol RegistryListener: AnyObject {
    func didAddNamespace(_ namespace: JXNamespace) throws
    func didRegisterModule(_ module: JXModule) throws
    func didRegisterModuleScript(_ script: JSModuleScript) throws
    func didRegisterUnnamespacedBridge(_ bridge: JXBridge) throws
}

final class RegistryListeners {
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
    
    func didRegisterModule(_ module: JXModule) throws {
        try listeners.forEach { try $0.listener?.didRegisterModule(module) }
    }
    
    func didRegisterModuleScript(_ script: JSModuleScript) throws {
        try listeners.forEach { try $0.listener?.didRegisterModuleScript(script) }
    }
    
    func didRegisterUnnamespacedBridge(_ bridge: JXBridge) throws {
        try listeners.forEach { try $0.listener?.didRegisterUnnamespacedBridge(bridge) }
    }
}

private struct WeakListenerRef {
    weak var listener: RegistryListener?
}

extension Array where Element == WeakListenerRef {
    fileprivate mutating func compact() {
        removeAll { $0.listener == nil }
    }
}
