// swift-tools-version:5.3

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
            .exact("15.13.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Maio/releases/download/15.13.0/TPMaioAdapter-15.13.0.xcframework.zip",
            checksum: "9a939372dfdbba746837af7f322bde6d0acfc93541984884d34917e5c0e49978"
        ),
    ]
)
