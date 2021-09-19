// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Modules",
            targets: ["WorkoutPlayer", "Payment", "Profile"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WorkoutsCore",
            dependencies: []),
        .testTarget(
            name: "WorkoutsCoreTests",
            dependencies: ["WorkoutsCore"]
        ),

        .target(
            name: "WorkoutPlayer",
            dependencies: ["WorkoutsCore"]),
        .testTarget(
            name: "WorkoutPlayerTests",
            dependencies: ["WorkoutPlayer"]
        ),

        .target(
            name: "Payment",
            dependencies: ["WorkoutsCore"]),
        .testTarget(
            name: "PaymentTests",
            dependencies: ["Payment"]
        ),

        .target(
            name: "Profile",
            dependencies: ["WorkoutsCore"]),
        .testTarget(
            name: "ProfileTests",
            dependencies: ["Profile"]
        ),
    ]
)
