import Foundation
import PackagePlugin

/// Command plugin to invoke our `BridgeGenerator` tool.
///
///     swift package plugin generate-bridges [-o <output file>] <-d <input dir> | file>+
///     
/// - Note: The location of your Command Line Tools must be set in Xcode->Settings->Locations
@main struct BridgeGeneratorCommand: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        guard !arguments.isEmpty else {
            print("swift package plugin generate-bridges [-o <output file>] <-d <input dir> | file>+")
            return
        }
        let bridgeGenerator = try context.tool(named: "JXBridgeGenerator")
        let process = Process()
        process.executableURL = URL(fileURLWithPath: bridgeGenerator.path.string)
        process.arguments = arguments
        try process.run()
        process.waitUntilExit()
    }
}

