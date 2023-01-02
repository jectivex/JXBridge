// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if canImport(ObjectiveC)
let products: [Product] = [
    .library(name: "JXBridge", targets: ["JXBridge"]),
    .library(name: "JXBridgeObjC", targets: ["JXBridgeObjC"]),
]
var targets: [Target] = [
    .target(name: "JXBridge", dependencies: ["JXKit", "JXBridgeObjC"]),
    .target(name: "JXBridgeObjC", dependencies: []),
    .testTarget(name: "JXBridgeObjCTests", dependencies: ["JXBridgeObjC"]),
]
#else
let products: [Product] = [
    .library(name: "JXBridge", targets: ["JXBridge"])
]
var targets: [Target] = [
    .target(name: "JXBridge", dependencies: ["JXKit"]),
]
#endif

var dependencies: [Package.Dependency] = [
    .package(url: "https://github.com/jectivex/JXKit.git", from: "3.5.0"),
]

#if !canImport(Combine)
dependencies += [.package(url: "https://github.com/OpenCombine/OpenCombine.git", from: "0.13.0")]
targets[0].dependencies += [.product(name: "OpenCombineShim", package: "OpenCombine")]
#endif

let package = Package(
    name: "JXBridge",
    platforms: [ .macOS(.v12), .iOS(.v15), .tvOS(.v15) ],
    products: products + [
    	.library(name: "JXBridgeExtended", targets: ["JXBridgeExtended"]),
    ],
    dependencies: dependencies,
    targets: targets + [
        .testTarget(name: "JXBridgeTests", dependencies: ["JXBridge"], resources: [.copy("jsmodules")]),
    	.target(name: "JXBridgeExtended", dependencies: ["JXBridge"]),
        .plugin(name: "ArityGeneratorCommand",
                capability: .command(intent: .custom(verb: "generate-arity", description: "Generate arity support"),
                    permissions: [
                        .writeToPackageDirectory(reason: "Write arity source files")
                    ]), dependencies: [])
    ]
)
