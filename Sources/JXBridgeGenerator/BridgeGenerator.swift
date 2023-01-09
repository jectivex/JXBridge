import Foundation
#if os(macOS) || os(Linux)
import SourceKittenFramework

@main
public class BridgeGenerator {
    static func main() throws {
        let arguments = CommandLine.arguments
        guard arguments.count == 3 else {
            throw BridgeGeneratorError.usage()
        }

        setenv("IN_PROCESS_SOURCEKIT", "YES", 1) // Don't do this when running in Xcode?
        let inputDirectory = URL(fileURLWithPath: arguments[1], isDirectory: true)
        let outputDirectory = URL(fileURLWithPath: arguments[2], isDirectory: true)
        try BridgeGenerator(inputDirectory: inputDirectory, outputDirectory: outputDirectory).run()
    }

    let inputDirectory: URL
    let outputDirectory: URL

    init(inputDirectory: URL, outputDirectory: URL) {
        self.inputDirectory = inputDirectory
        self.outputDirectory = outputDirectory
    }

    func run() throws {
        guard let directoryEnumerator = FileManager.default.enumerator(at: inputDirectory, includingPropertiesForKeys: [.isRegularFileKey], options: [.skipsHiddenFiles]) else {
            return
        }
        for case let fileURL as URL in directoryEnumerator {
            guard fileURL.pathExtension == "swift", let resourceValues = try? fileURL.resourceValues(forKeys: [.isRegularFileKey]),
                  resourceValues.isRegularFile == true else {
                continue
            }
            guard let file = File(path: fileURL.path) else {
                continue
            }
            print("FILE: \(fileURL)") //~~~
            let structure = try Structure(file: file)
            //print("STRUCTURE: \(structure.description)")
            //print("========================================")
            processCandidate(dictionary: structure.dictionary)

        }
    }

    private func processCandidate(dictionary: [String: SourceKitRepresentable]) {
        if let inheritedTypes = dictionary["key.inheritedtypes"] as? [[String: SourceKitRepresentable]], let name = dictionary["key.name"] as? String {
            if inheritedTypes.contains(where: { $0["key.name"] as? String == "JXStaticBridging" }) {
                print("FOUND NAME: \(name)")
            }
        }
        if let substructures = dictionary["key.substructure"] as? [[String: SourceKitRepresentable]] {
            for substructure in substructures {
                processCandidate(dictionary: substructure)
            }
        }
    }
}
#else
//~~~
@main
public class BridgeGenerator {
    static func main() throws {
        let argumentsString = CommandLine.arguments.joined(separator: ",")
        throw BridgeGeneratorError(message: "SHIT BAD RUN ON \(argumentsString)")
    }
}
#endif
