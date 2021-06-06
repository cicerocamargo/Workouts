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
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CoreDomain",
            dependencies: []
        ),
        .target(
            name: "CoreUI",
            dependencies: []
        ),
        .target(
            name: "BrowseWorkouts",
            dependencies: ["CoreDomain", "CoreUI"]
        ),
        .target(
            name: "Paywall",
            dependencies: ["CoreDomain"]
        ),
        .target(
            name: "Settings",
            dependencies: ["CoreDomain"]
        ),
        .target(
            name: "WorkoutPlayer",
            dependencies: ["CoreDomain"]
        ),

        .testTarget(
            name: "BrowseWorkoutsTests",
            dependencies: ["BrowseWorkouts"]
        ),
    ]
)
