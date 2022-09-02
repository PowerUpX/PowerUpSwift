// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "PowerUpSwift",
    platforms: [.iOS(.v9)],
    products: [
        .library(name: "PowerUpSwift", targets: ["PowerUpSwift"])
    ],
    targets: [
      .target(
        name: "PowerUpSwift",
        path: "PowerUpSwift"
      )
    ]
)
