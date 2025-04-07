// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ComponentBox",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ComponentBox",
            targets: ["ComponentBox"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ComponentBox"),
        .testTarget(
            name: "ComponentBoxTests",
            dependencies: ["ComponentBox"]
        ),
    ]
)
