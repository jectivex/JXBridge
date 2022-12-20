#if canImport(Foundation)
import Foundation
#endif

/// Represents a JavaScript module script integrated into a `JXModule`.
struct JXModuleScript: Equatable {
    var source: JXModuleScriptSource
    var namespace: JXNamespace
}

/// JavaScript source integrated into a `JXModule`.
enum JXModuleScriptSource: Equatable {
#if canImport(Foundation)
    /// The resource and its root URL from which this script was loaded.
    case resource(String, URL)
    /// The JavaScript code.
    case jsWithRoot(String, URL)
#endif
    /// The JavaScript code.
    case js(String)
}
