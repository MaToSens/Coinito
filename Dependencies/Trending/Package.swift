// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Trending",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Trending",
            targets: ["Trending"]
        ),
        .library(
            name: "TrendingInterface",
            targets: ["Trending"]
        ),
        .library(
            name: "TrendingMocks",
            targets: ["Trending"]
        ),
    ],
    dependencies: [
        .package(path: "../CoinBackend"),
        .package(path: "../Database"),
        .package(path: "../DependencyInjection")
    ],
    targets: [
        .target(
            name: "TrendingInterface",
            dependencies: [
                .product(name: "DependencyInjection", package: "DependencyInjection")
            ]
        ),
        .target(
            name: "Trending",
            dependencies: [
                "TrendingInterface",
                .product(name: "CoinBackend", package: "CoinBackend"),
                .product(name: "Database", package: "Database")
            ]
        ),
        .target(
            name: "TrendingMocks",
            dependencies: ["Trending"],
            resources: [.process("Resources/")]
        ),
        .testTarget(
            name: "TrendingTests",
            dependencies: ["Trending"]
        ),
    ]
)
