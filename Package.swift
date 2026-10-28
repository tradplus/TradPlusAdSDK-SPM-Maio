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
            .exact("15.17.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Maio/releases/download/15.17.0/TPMaioAdapter-15.17.0.xcframework.zip",
            checksum: "9a5a960bfaac646b4966c2ed72d3a43e015f033c26134013df13c861c9830046"
        ),
    ]
)
