//~~~ used?
public struct BridgeGeneratorError: Error {
    var message: String

    static func `internal`(_ message: String) -> BridgeGeneratorError {
        return BridgeGeneratorError(message: "Internal error: \(message)")
    }
}
