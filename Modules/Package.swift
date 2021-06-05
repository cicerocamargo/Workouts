// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Modules",
            targets: [
                "BrowseWorkouts",
                "Paywall",
                "Settings",
                "WorkoutPlayer"
            ]
        )
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
            name: "Core",
            dependencies: []
        ),
        .target(
            name: "BrowseWorkouts",
            dependencies: ["Core", "Moya", "Kingfisher"]
        ),
        .target(
            name: "Paywall",
            dependencies: [
                "Core",
                .product(name: "FirebaseAnalytics", package: "Firebase")
            ]
        ),
        .target(
            name: "Settings",
            dependencies: ["Core"]
        ),
        .target(
            name: "WorkoutPlayer",
            dependencies: ["Core"]
        ),
        .testTarget(
            name: "ModulesTests",
            dependencies: ["BrowseWorkouts", "Paywall", "Settings", "WorkoutPlayer"]
        ),
    ]
)
