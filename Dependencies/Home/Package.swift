// swift-tools-version: 5.9


import PackageDescription

let package = Package(
    name: "Home",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Home",
            targets: ["Home"]
        ),
        .library(
            name: "HomeInterface",
            targets: ["HomeInterface"]
        ),
        .library(
            name: "HomeMocks",
            targets: ["HomeMocks"]
        ),
    ],
    dependencies: [
        .package(path: "../Coin"),
        .package(path: "../Design"),
        .package(path: "../DependencyInjection")
    ],
    targets: [
        .target(
            name: "HomeInterface",
            dependencies: [ 
                .product(name: "DependencyInjection", package: "DependencyInjection")
            ]
        ),
        .target(
            name: "Home",
            dependencies: [ 
                "HomeInterface",
                .product(name: "Coin", package: "Coin"),
                .product(name: "Design", package: "Design")
            ]
        ),
        .target(
            name: "HomeMocks",
            dependencies: [ 
                "Home",
                .product(name: "CoinMocks", package: "Coin")
            ]
        ),
        .testTarget(
            name: "HomeTests",
            dependencies: ["Home"]
        ),
    ]
)
