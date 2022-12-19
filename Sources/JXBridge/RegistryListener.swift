/// Listen for registry additions.
protocol RegistryListener: AnyObject {
    func didAddNamespace(_ namespace: JXNamespace) throws
    func didRegisterModule(_ module: JXModule) throws
    func didRegisterModuleScript(_ script: JSModuleScript) throws
    func didRegisterUnnamespacedBridge(_ bridge: JXBridge) throws
}
