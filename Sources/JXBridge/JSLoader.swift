#if canImport(Foundation)
import Foundation
#endif
import JXKit

/// Load JavaScript.
class JSLoader {
    /// Load the script from the given resource.
    func loadScript(resource: String) throws -> String? {
        //~~~
//#if canImport(Foundation)
//        let (root, ext) = Self.parsePath(resource)
//        let resourceURL = Bundle.module.url(forResource: root, withExtension: ext)
//        return try String(contentsOf: resourceURL)
//#else
        throw JXError(message: "JavaScript resource loading is not available on platforms without Foundation support")
//#endif
    }
    
    private static func parsePath(_ path: String) -> (root: String, `extension`: String?) {
        guard let dotIndex = path.lastIndex(of: ".") else {
            return (path, nil)
        }
        let root = String(path.prefix(upTo: dotIndex))
        let ext = String(path.suffix(from: path.index(after: dotIndex)))
        return (root, ext)
    }
}
