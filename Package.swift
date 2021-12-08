// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "EasyConfetti",
    platforms: [
        .macOS(.v11),
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "EasyConfetti",
            targets: ["EasyConfetti"]),
    ],
    targets: [
        .target(
            name: "EasyConfetti",
            path: "Sources"
        )
    ],
    swiftLanguageVersions: [.v5]
)
