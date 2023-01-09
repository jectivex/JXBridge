public struct BridgeGeneratorError: Error {
    var message: String

    static func usage() -> BridgeGeneratorError {
        //~~~
        return BridgeGeneratorError(message: "usage")
    }
}
