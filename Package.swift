// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "StateTreeWebsite",
  platforms: [.macOS(.v13)],
  products: [
    .library(
      name: "StateTreeWebsite",
      targets: ["StateTreeWebsite"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/GoodHatsLLC/SwiftLintFix.git", from: "0.1.0"),
  ],
  targets: [
    .target(
      name: "StateTreeWebsite"
    ),
  ]
)
