// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if canImport(ObjectiveC)
var coreProducts: [Product] = [
    .library(name: "JXBridge", targets: ["JXBridge"]),
    .library(name: "JXBridgeObjC", targets: ["JXBridgeObjC"]),
]
var coreTargets: [Target] = [
    .target(name: "JXBridge", dependencies: ["JXKit", "JXBridgeObjC"]),
    .target(name: "JXBridgeObjC", dependencies: []),
    .testTarget(name: "JXBridgeObjCTests", dependencies: ["JXBridgeObjC"]),
]
#else
var coreProducts: [Product] = [
    .library(name: "JXBridge", targets: ["JXBridge"]),
]
var coreTargets: [Target] = [
    .target(name: "JXBridge", dependencies: ["JXKit"]),
]
#endif
var coreDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/jectivex/JXKit.git", from: "3.5.0"),
]

#if !canImport(Combine)
coreDependencies += [.package(url: "https://github.com/OpenCombine/OpenCombine.git", from: "0.13.0")]
coreTargets[0].dependencies += [.product(name: "OpenCombineShim", package: "OpenCombine")]
#endif

let package = Package(
    name: "JXBridge",
    platforms: [ .macOS(.v12), .iOS(.v15), .tvOS(.v15) ],
    products: coreProducts + [
    	.library(name: "JXBridgeExtended", targets: ["JXBridgeExtended"]),
        .plugin(name: "JXBridgeGeneratorTool", targets: ["JXBridgeGeneratorTool"])
    ],
    dependencies: coreDependencies + [
        .package(url: "https://github.com/apple/swift-syntax.git", branch: "main")
    ],
    targets: coreTargets + [
        .testTarget(name: "JXBridgeTests", dependencies: ["JXBridge"], resources: [.copy("jsmodules")]),
        .testTarget(name: "JXBridgeGeneratorTests", dependencies: ["JXBridge"], plugins: ["JXBridgeGeneratorTool"]),
    	.target(name: "JXBridgeExtended", dependencies: ["JXBridge"]),
        .executableTarget(name: "JXBridgeGenerator", dependencies: [
            .product(name: "SwiftParser", package: "swift-syntax", condition: .when(platforms: [.macOS, .linux])),
            .product(name: "SwiftSyntax", package: "swift-syntax", condition: .when(platforms: [.macOS, .linux])),
        ]),
        .plugin(name: "JXArityGeneratorCommand",
                capability: .command(intent: .custom(verb: "generate-arity", description: "Generate arity support"), permissions: [
                    .writeToPackageDirectory(reason: "Write arity source files")
                ]),
                dependencies: []),
        .plugin(name: "JXBridgeGeneratorTool", capability: .buildTool(), dependencies: ["JXBridgeGenerator"]),
        .plugin(name: "JXBridgeGeneratorCommand",
                capability: .command(intent: .custom(verb: "generate-bridges", description: "Generate bridging support")),
                dependencies: ["JXBridgeGenerator"]),
    ]
)
