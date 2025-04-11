// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Feature",
  platforms: [.iOS(.v17)],
  products: [
    .library(
      name: "Feature",
      targets: ["Feature"]),
  ],
  dependencies: [
    // ① 引用其他Swift package
    .package(name: "ComponentBox", path: "ComponentBox"),
  ],
  targets: [
    .target(
      name: "Feature",
      // ② 需要在這地方聲明，才能進行引用
      dependencies: [.product(name: "ComponentBox", package: "ComponentBox")],
      // 引用資源檔
      resources: [.process("Resources")]
    ),
    .testTarget(
      name: "FeatureTests",
      dependencies: ["Feature"]
    ),
  ]
)
