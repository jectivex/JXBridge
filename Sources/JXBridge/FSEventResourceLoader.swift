#if canImport(Foundation)

import Foundation
import JXKit

/// Load resources and track changes using `FSEvents`.
class FSEventResourceLoader: ResourceLoader {
    let didChange = ListenerCollection<ResourceListener>()
    
    func resourceURL(resource: String, relativeTo: URL?, root: URL) throws -> URL {
        if resource.hasPrefix("/") {
            return root.appendingPathComponent(String(resource.dropFirst()), isDirectory: false).standardized
        } else if let relativeTo {
            return relativeTo.deletingLastPathComponent().appendingPathComponent(resource, isDirectory: false).standardized
        } else {
            throw JXError.unknownResourceRelativeTo(for: resource)
        }
    }

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

#endif
