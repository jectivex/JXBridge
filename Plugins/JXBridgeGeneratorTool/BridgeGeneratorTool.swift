import Foundation
import PackagePlugin

/// Built plugin to invoke our `BridgeGenerator` tool with source files.
@main struct BridgeGeneratorTool: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let inputDir = target.directory
        let outputDir = context.pluginWorkDirectory
        let bridgeGenerator = try context.tool(named: "JXBridgeGenerator").path
        return [
            .buildCommand(displayName: "JXBridgeBuilder", executable: bridgeGenerator, arguments: [inputDir, outputDir])
        ]
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

//~~~
extension BridgeGeneratorTool: XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
        let bridgeGenerator = try context.tool(named: "JXBridgeGenerator").path
        return [
            .buildCommand(displayName: "JXBridgeBuilder", executable: bridgeGenerator, arguments: ["Argument1", "Argument2"])
        ]
    }
}
#endif
