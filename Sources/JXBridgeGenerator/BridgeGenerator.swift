#if os(macOS)
import SourceKittenFramework

@main
public class BridgeGenerator {
    static func main() throws {
        let argumentsString = CommandLine.arguments.joined(separator: ",")
        //throw BridgeGeneratorError(message: "Run on \(argumentsString)")
        print("RUN 2 ON: \(argumentsString)")
    }
}
#else
@main
public class BridgeGenerator {
    static func main() throws {
        let argumentsString = CommandLine.arguments.joined(separator: ",")
        throw BridgeGeneratorError(message: "SHIT BAD RUN ON \(argumentsString)")
    }
}
#endif
