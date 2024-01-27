// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Database",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Database",
            targets: ["Database"]
        ),
        .library(
            name: "DatabaseInterface",
            targets: ["DatabaseInterface"]
        ),
    ],
    dependencies: [
        .package(path: "../DependencyInjection")
    ],
    targets: [
        .target(
            name: "DatabaseInterface"
        ),
        .target(
            name: "Database",
            dependencies: [
                "DatabaseInterface",
                .product(
                    name: "DependencyInjection",
                    package: "DependencyInjection"
                )
            ],
            resources: [.process("Resources/")]
        ),
    ]
)
