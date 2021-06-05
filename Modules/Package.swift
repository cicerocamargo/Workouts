// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Modules",
            targets: ["Modules"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Moya/Moya.git",
            .upToNextMajor(from: "14.0.0")
        ),
        .package(
            url: "https://github.com/onevcat/Kingfisher.git",
            .upToNextMajor(from: "6.1.1")
        )
    ],
    targets: [
        .target(
            name: "Modules",
            dependencies: ["Moya", "Kingfisher"]),
        .testTarget(
            name: "ModulesTests",
            dependencies: ["Modules"]),
    ]
)
