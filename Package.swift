// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "TradPlusMaioAdapter",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "TradPlusMaioAdapter",
            targets: ["TradPlusMaioAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.18.0")
        ),
        .package(
            url: "https://github.com/imobile/MaioSDK-v2-iOS.git",
            .exact("2.1.6")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusMaioAdapter",
            dependencies: [
                .target(name: "TPMaioAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "MaioSDK", package: "MaioSDK-v2-iOS"),
            ],
            path: ".",
            sources: ["Sources/TradPlusMaioAdapter/TradPlusMaioAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPMaioAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Maio/releases/download/15.18.0/TPMaioAdapter-15.18.0.xcframework.zip",
            checksum: "fbc9d59a1271bf5e9bdac0b8b26440b0c62585514d2c0fe9645f4943a058b944"
        ),
    ]
)
