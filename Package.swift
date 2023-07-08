// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "StateTreeWebsite",
  platforms: [.macOS(.v13)],
  products: [
    .executable(
      name: "StateTreeWebsite",
      targets: ["StateTreeWebsite"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/GoodHatsLLC/SwiftLintFix.git",
      from: "0.1.2"
    ),
    .package(
      url: "https://github.com/johnsundell/publish.git",
      from: "0.9.0"
    ),
    .package(
      url: "https://github.com/johnsundell/splashpublishplugin.git",
      from: "0.2.0"
    ),
  ],
  targets: [
    .executableTarget(
      name: "StateTreeWebsite",
      dependencies: [
        .product(name: "Publish", package: "publish"),
        .product(name: "SplashPublishPlugin", package: "SplashPublishPlugin"),
      ]
    ),
  ]
)
