// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Components",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Components",
            targets: ["Components"]
        ),
    ],
    dependencies: [
        .package(path: "../Coin"),
        .package(path: "../Design"),
        .package(path: "../Utilities")
    ],
    targets: [
        .target(
            name: "Components",
            dependencies: [
                .product(name: "Coin", package: "Coin"),
                .product(name: "Design", package: "Design"),
                .product(name: "Utilities", package: "Utilities")
            ],
            resources: [.process("Resources/")]
        ),
    ]
)
