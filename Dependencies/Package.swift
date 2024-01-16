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
        .package(path: "Coin")
    ],
    targets: [
        .target(
            name: "Dependencies",
            dependencies: [
                .product(name: "Coin", package: "Coin"),
                .product(name: "CoinMocks", package: "Coin")
            ]
        )
    ]
)
