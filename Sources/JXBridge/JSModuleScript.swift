#if canImport(Foundation)
import Foundation
#endif

/// Represents JavaScript module content.
struct JSModuleScript: Equatable {
    var source: JSSource
    var namespace: JXNamespace
}

/// JavaScript source.
enum JSSource: Equatable {
#if canImport(Foundation)
    /// The resource and its root URL from which this script was loaded.
    case resource(String, URL)
    /// The JavaScript code.
    case jsWithRoot(String, URL)
#endif
    /// The JavaScript code.
    case js(String)
}
