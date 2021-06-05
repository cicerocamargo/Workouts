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
        ),
        .package(
            name: "Firebase",
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            .upToNextMajor(from: "8.1.0")
        )
    ],
    targets: [
        .target(
            name: "Modules",
            dependencies: [
                "Moya",
                "Kingfisher",
                .product(name: "FirebaseAnalytics", package: "Firebase")
            ]
        ),
        .testTarget(
            name: "ModulesTests",
            dependencies: ["Modules"]),
    ]
)
