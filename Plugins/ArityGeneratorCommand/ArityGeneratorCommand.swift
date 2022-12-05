import PackagePlugin
#if canImport(System)
import System
#endif

/// Command plugin to invoke our `ArityGenerator` tool with package `.arity` files.
///
///     swift package plugin generate-arity <source_files>
///
/// - Note: The location of your Command Line Tools must be set in Xcode->Settings->Locations
@main struct ArityGeneratorCommand: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
#if canImport(Foundation) && canImport(System)
        if #available(macOS 13.0, *) {
            for argument in arguments {
                let inputPath = FilePath(argument)
                print("Reading input file \(inputPath.lastComponent?.string ?? argument)...", terminator: "")
                let input = try String(contentsOfFile: inputPath.string)
                guard let generator = try ArityGenerator(input: input) else {
                    print(" No arity comments found")
                    continue
                }
                print("\nGenerating arity variants...")
                let output = try generator.generate()
                
                let outputFileName = inputPath.stem! + "+Arity.swift"
                let outputPath = inputPath.removingLastComponent().appending(outputFileName)
                print("Writing output to \(outputPath)...")
                try output.write(toFile: outputPath.description, atomically: false, encoding: .utf8)
            }
        } else {
            throw ArityGeneratorError(message: "\(String(describing: ArityGeneratorCommand.self)) requires macOS 13+")
        }
#else
        throw ArityGeneratorError(message: "\(String(describing: ArityGeneratorCommand.self)) requires System and Foundation modules")
#endif
    }
}
