// swift-tools-version:5.1

import PackageDescription

let exclude = ["PMKCoreLocation.h"] + ["CLGeocoder", "CLLocationManager"].flatMap {
    ["\($0)+AnyPromise.m", "\($0)+AnyPromise.h"]
}

let package = Package(
    name: "PMKCoreLocation",
    platforms: [
        .macOS(.v10_10), .iOS(.v8), .tvOS(.v9), .watchOS(.v3)
    ],
    products: [
        .library(
            name: "PMKCoreLocation",
            targets: ["PMKCoreLocation"]),
    ],
    dependencies: [
	.package(url: "https://github.com/mxcl/PromiseKit", .upToNextMajor(from: "6.13.3"))
    ],
    targets: [
        .target(
            name: "PMKCoreLocation",
            dependencies: ["PromiseKit"],
            path: "Sources",
            exclude: exclude),
        .testTarget(
            name: "PMKCoreLocationTests",
            dependencies: ["PMKCoreLocation"],
            path: "Tests"),
    ]
)
