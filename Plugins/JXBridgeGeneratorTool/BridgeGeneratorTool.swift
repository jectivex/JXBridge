import Foundation
import PackagePlugin

/// Built plugin to invoke our `BridgeGenerator` tool with source files.
@main struct BridgeGeneratorTool: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let name = target.name
        let outputFile = context.pluginWorkDirectory.appending(subpath: "JXGenerated.swift")
        let inputDir = target.directory
        let bridgeGenerator = try context.tool(named: "JXBridgeGenerator").path
        return [
            .buildCommand(displayName: "JXBridgeBuilder", executable: bridgeGenerator, arguments: [name, outputFile, "-d", inputDir], outputFiles: [outputFile])
        ]
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension BridgeGeneratorTool: XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
        let name = target.product?.name ?? ""
        let outputFile = context.pluginWorkDirectory.appending(subpath: "JXGenerated.swift")
        let bridgeGenerator = try context.tool(named: "JXBridgeGenerator").path
        let arguments = target.inputFiles
            .filter { $0.type == .source }
            .map { $0.path.string }
        return [
            .buildCommand(displayName: "JXBridgeBuilder", executable: bridgeGenerator, arguments: [name, outputFile] + arguments, outputFiles: [outputFile])
        ]
    }
}
#endif
