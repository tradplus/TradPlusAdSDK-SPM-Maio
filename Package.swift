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
            .exact("15.14.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Maio/releases/download/15.14.0/TPMaioAdapter-15.14.0.xcframework.zip",
            checksum: "b79d60f9170f4e765971ab14cbab57f5ae5d479549bf7c85ed05fbac1e526b42"
        ),
    ]
)
