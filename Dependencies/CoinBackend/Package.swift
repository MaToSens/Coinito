// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CoinBackend",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "CoinBackend",
            targets: ["CoinBackend"]
        ),
        .library(
            name: "CoinBackendInterface",
            targets: ["CoinBackendInterface"]
        ),
    ],
    dependencies: [
        .package(path: "../DependencyInjection"),
        .package(path: "../Utilities")
    ],
    targets: [
        .target(
            name: "CoinBackendInterface",
            dependencies: [
                .product(name: "DependencyInjection", package: "DependencyInjection")
            ]
        ),
        .target(
            name: "CoinBackend",
            dependencies: [
                "CoinBackendInterface",
                .product(name: "Utilities", package: "Utilities")
            ]
        ),
        .testTarget(
            name: "CoinBackendTests",
            dependencies: ["CoinBackend"]),
    ]
)
