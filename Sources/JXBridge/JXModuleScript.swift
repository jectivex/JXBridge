import struct Foundation.URL

/// Represents a JavaScript module script integrated into a `JXModule`.
struct JXModuleScript: Equatable {
    var source: JXModuleScriptSource
    var namespace: JXNamespace
}

/// JavaScript source integrated into a `JXModule`.
enum JXModuleScriptSource: Equatable {
    /// The resource and its root URL from which this script was loaded.
    case resource(String, URL)
    /// The JavaScript code.
    case jsWithRoot(String, URL)
    /// The JavaScript code.
    case js(String)
}
