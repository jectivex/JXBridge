#if canImport(Foundation)

import Foundation
import JXKit

/// Load JavaScript.
class JSLoader {
    /// Return the URL for the givne script resource.
    func scriptURL(resource: String, root: URL) -> URL {
        if #available(iOS 16.0, *) {
            return root.appending(path: resource, directoryHint: .notDirectory)
        } else {
            return root.appendingPathComponent(resource, isDirectory: false)
        }
    }
    
    /// Load the script from the given URL.
    func loadScript(from url: URL) throws -> String? {
        return try String(contentsOf: url)
    }
}

#endif
