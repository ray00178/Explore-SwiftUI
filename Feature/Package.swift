// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Feature",
  platforms: [.iOS(.v17)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "Feature",
      targets: ["Feature"]),
  ],
  dependencies: [
    // ① 引用其他Swift package
    .package(name: "Magical", path: "Magical"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "Feature",
      // ② 需要在這地方聲明，才能進行引用
      dependencies: [.product(name: "Magical", package: "Magical")]
    ),
    .testTarget(
      name: "FeatureTests",
      dependencies: ["Feature"]
    ),
  ]
)
