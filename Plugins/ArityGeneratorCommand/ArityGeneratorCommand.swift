#if canImport(Foundation)
import Foundation
#endif
import PackagePlugin
#if canImport(System)
import System
#endif

/// Command plugin to invoke our `ArityGenerator` tool with package `.arity` files.
///
///     swift package plugin generate-arity <options> <source_files>
///
/// - Note: The location of your Command Line Tools must be set in Xcode->Settings->Locations
@main struct ArityGeneratorCommand: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        if arguments.isEmpty {
            print(usage())
            return
        }
#if canImport(Foundation) && canImport(System)
        if #available(macOS 13.0, *) {
            let (options, files, outputDir) = try processArguments(arguments)
            for file in files {
                let inputPath = FilePath(file)
                let inputFileName = inputPath.lastComponent?.string ?? file
                print("Reading input file \(inputFileName)...", terminator: "")
                let input = try String(contentsOfFile: inputPath.string)
                guard let generator = try ArityGenerator(input: input, options: options) else {
                    print(" No arity comments found")
                    continue
                }
                print("\nGenerating arity variants...")
                let output = try generator.generate()
                
                let outputFileName = inputPath.stem! + "+Arity.swift"
                let outputDir = outputDir ?? inputPath.removingLastComponent()
                let outputPath = outputDir.appending(outputFileName)
                print("Writing output to \(outputPath)...")
                let fileContent = header(source: inputFileName, options: options) + output
                try fileContent.write(toFile: outputPath.string, atomically: false, encoding: .utf8)
            }
        } else {
            throw ArityGeneratorError(message: "\(String(describing: ArityGeneratorCommand.self)) requires macOS 13+")
        }
#else
        throw ArityGeneratorError(message: "\(String(describing: ArityGeneratorCommand.self)) requires System module")
#endif
    }
    
#if canImport(Foundation) && canImport(System)
    private func processArguments(_ arguments: [String]) throws -> (options: [ArityGenerator.Option: Int], files: [String], outputDir: FilePath?) {
        var options: [ArityGenerator.Option: Int] = [:]
        var files: [String] = []
        var skipValue = false
        var outputDir: String? = nil
        for i in 0..<arguments.count {
            guard !skipValue else {
                skipValue = false
                continue
            }
            if arguments[i] == "-o" && i < (arguments.count - 1) {
                outputDir = arguments[i + 1]
                skipValue = true
            } else if arguments[i].starts(with: "-") && i < (arguments.count - 1) {
                let optionString = String(arguments[i].dropFirst())
                let valueString = arguments[i + 1]
                guard let option = ArityGenerator.Option(rawValue: optionString) else {
                    throw ArityGeneratorError(message: "Unrecognized option '\(optionString)'")
                }
                guard let value = Int(valueString) else {
                    throw ArityGeneratorError(message: "Invalid option value '\(valueString)'. Expected an integer")
                }
                options[option] = value
                skipValue = true
            } else if arguments[i].starts(with: "-") {
                throw ArityGeneratorError(message: "Missing value for option '\(arguments[i])'")
            } else {
                files.append(arguments[i])
            }
        }
        return (options, files, outputDir.map { FilePath($0) })
    }
    
    private func header(source: String, options: [ArityGenerator.Option: Int]) -> String {
        var header = "// THIS FILE IS AUTO GENERATED FROM \(source). DO NOT EDIT\n"
        header.append("//\n//\t\tswift package plugin generate-arity \(source)\n")
        for option in ArityGenerator.Option.allCases {
            header.append("//\t\t\t-\(option.rawValue) \(option.value(in: options))\n")
        }
        if ArityGenerator.Option.beyondDefaults.value(in: options) > 0 {
            header.append("\nimport JXBridge")
        }
        header.append("\nimport JXKit\n")
        return header
    }
    
    private func usage() -> String {
        var usage = "swift package plugin generate-arity [-o <output dir>] [-<option> <number>] <files>"
        usage.append("\nOptions:")
        for option in ArityGenerator.Option.allCases {
            usage.append("\n\t\(option.rawValue): Default value \(option.default)")
        }
        return usage
    }
#endif
}
