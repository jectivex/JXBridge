/// An unordered collection of weakly-held event listeners.
public final class ListenerCollection {
    // Note: it would have been nice to use publishers for these events, but we want to avoid Combine
    // dependencies where possible and be able to synchronously throw any listener errors
    
    /// You must retain this object to receive events.
    public final class Cancellable {
        private let collection: ListenerCollection
        private var key: Int?
        
        fileprivate init(collection: ListenerCollection, key: Int) {
            self.collection = collection
            self.key = key
        }
        
        deinit {
            cancel()
        }
        
        /// Stop receiving events.
        public func cancel() {
            if let key {
                self.key = nil
                collection.listeners[key] = nil
            }
        }
    }
    
    private var listeners: [Int: WeakRef] = [:]
    private var keyGenerator = 0
    
    /// Add a listener to be sent events.
    ///
    /// - Returns: A `Cancellable` you can use to stop receiving events, and which you must retain to continue to receive them.
    public func addListener(_ listener: AnyObject) -> Cancellable {
        let key = keyGenerator
        keyGenerator += 1
        listeners[key] = WeakRef(listener: listener)
        return Cancellable(collection: self, key: key)
    }
    
    func forEachListener<T>(as: T.Type, perform: (T) throws -> Void) rethrows {
        try listeners.values.forEach {
            if let listener = $0.listener as? T {
                try perform(listener)
            }
        }
    }
    
    private struct WeakRef {
        weak var listener: AnyObject?
    }
}
