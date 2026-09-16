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
            .exact("15.15.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Maio/releases/download/15.15.0/TPMaioAdapter-15.15.0.xcframework.zip",
            checksum: "2cb788f011ffedf4b4bd0b95b591e8f13cd397960fd3dca6dd1305e84e0e7bc5"
        ),
    ]
)
