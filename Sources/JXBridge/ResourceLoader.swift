#if canImport(Foundation)

import Foundation

/// Load resources.
protocol ResourceLoader {
    /// Invoked when resources change.
    var didChange: ListenerCollection<ResourceListener> { get }
    
    /// Return the URL for the given resource.
    func resourceURL(resource: String, relativeTo: URL?, root: URL) throws -> URL
    
    /// Load the script from the given URL.
    func loadScript(from url: URL) throws -> String?
}

/// Listen for resource keys.
struct ResourceListener {
    let handler: (Set<URL>) -> Void
}

#endif
