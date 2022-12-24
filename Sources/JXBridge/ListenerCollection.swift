/// An ordered collection of event listeners.
///
/// - Warning: Listeners are **strongly** held. This class should **not** be accessed concurrently.
final class ListenerCollection<T> {
    // Note: it would have been nice to use publishers for these events, but we want to synchronously throw any listener errors
    
    private var listeners: [Int: T] = [:]
    private var keyGenerator = 0
    
    /// Add a listener to be sent events.
    ///
    /// - Returns: A ``JX`Cancellable`` you can use to stop receiving events, and which you must retain to continue to receive them.
    func addListener(_ listener: T) -> JXCancellable {
        let key = keyGenerator
        keyGenerator += 1
        listeners[key] = listener
        return JXCancellable { [weak self] in self?.listeners[key] = nil }
    }
    
    func forEachListener(perform: (T) throws -> Void) rethrows {
        try listeners
            .sorted { $0.key < $1.key }
            .forEach { try perform($0.value) }
    }
}
