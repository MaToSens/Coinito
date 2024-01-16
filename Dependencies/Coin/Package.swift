// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Coin",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Coin",
            targets: ["Coin"]
        ),
        .library(
            name: "CoinInterface",
            targets: ["CoinInterface"]
        ),
        .library(
            name: "CoinMocks",
            targets: ["CoinMocks"]
        ),
    ],
    dependencies: [ 
        .package(path: "../DependencyInjection")
    ],
    targets: [
        .target(
            name: "CoinInterface",
            dependencies: [
                .product(name: "DependencyInjection", package: "DependencyInjection")
            ]
        ),
        .target(
            name: "Coin",
            dependencies: [
                "CoinInterface"
            ]
        ),
        .target(
            name: "CoinMocks",
            dependencies: ["Coin"]
        ),
        .testTarget(
            name: "CoinTests",
            dependencies: ["Coin"]
        ),
    ]
)
