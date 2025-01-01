// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "PhotoFramer",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "PhotoFramer",
            targets: ["PhotoFramer"]
        ),
    ],
    targets: [
        .target(
            name: "PhotoFramer",
            dependencies: []
        ),
        .testTarget(
            name: "PhotoFramerTests",
            dependencies: ["PhotoFramer"]
        ),
    ]
)