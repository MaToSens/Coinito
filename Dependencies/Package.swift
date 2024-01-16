// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Dependencies",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Dependencies",
            targets: ["Dependencies"]
        ),
    ],
    dependencies: [
        .package(path: "Home")
    ],
    targets: [
        .target(
            name: "Dependencies",
            dependencies: [
                .product(name: "Home", package: "Home"),
                .product(name: "HomeMocks", package: "Home")
            ]
        )
    ]
)
