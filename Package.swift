// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if canImport(ObjectiveC)
let products: [Product] = [
    .library(name: "JXBridge", targets: ["JXBridge"]),
    .library(name: "JXBridgeObjC", targets: ["JXBridgeObjC"]),
]
let targets: [Target] = [
    .target(name: "JXBridge", dependencies: ["JXKit", "JXBridgeObjC"]),
    .testTarget(name: "JXBridgeTests", dependencies: ["JXBridge"]),
    .target(name: "JXBridgeObjC", dependencies: []),
    .testTarget(name: "JXBridgeObjCTests", dependencies: ["JXBridgeObjC"]),
]
#else
let products: [Product] = [
    .library(name: "JXBridge", targets: ["JXBridge"])
]
let targets: [Target] = [
    .target(name: "JXBridge", dependencies: ["JXKit"]),
    .testTarget(name: "JXBridgeTests", dependencies: ["JXBridge"]),
]
#endif

let package = Package(
    name: "JXBridge",
    platforms: [ .macOS(.v12), .iOS(.v15), .tvOS(.v15) ],
    products: products,
    dependencies: [
        .package(url: "https://github.com/jectivex/JXKit.git", from: "3.2.0"),
    ],
    targets: targets
)
