#if canImport(Foundation)

import Foundation
import JXKit

/// Load resources.
class ResourceLoader {
    /// Invoked when resources change.
    let didChange = ListenerCollection<ResourceListener>()
    
    /// Return the URL for the given resource.
    func resourceURL(resource: String, relativeTo: URL?, root: URL) throws -> URL {
        if resource.hasPrefix("/") {
            return root.appendingPathComponent(String(resource.dropFirst()), isDirectory: false).standardized
        } else if let relativeTo {
            return relativeTo.deletingLastPathComponent().appendingPathComponent(resource, isDirectory: false).standardized
        } else {
            throw JXError.unknownResourceRelativeTo(for: resource)
        }
    }

    /// Load the script from the given URL.
    func loadScript(from url: URL) throws -> String? {
        do {
            return try String(contentsOf: url)
        } catch {
            let urlError = error
            if url.pathExtension.isEmpty {
                let jsURL = url.appendingPathExtension("js")
                do {
                    return try String(contentsOf: jsURL)
                } catch {
                    throw urlError
                }
            } else {
                throw urlError
            }
        }
    }
    
    private func resourcesDidChange(urls: Set<URL>) {
        didChange.forEachListener { $0.handler(urls) }
    }
}

/// Listen for resource keys.
struct ResourceListener {
    let handler: (Set<URL>) -> Void
}

#endif
