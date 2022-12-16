/// Represents JavaScript module content.
struct JSModuleScript: Equatable {
    var source: JSSource
    var namespace: JXNamespace
}

/// JavaScript source.
enum JSSource: Equatable {
    /// The resource from which this script was loaded.
    case resource(String)
    /// The JavaScript code.
    case js(String)
}
