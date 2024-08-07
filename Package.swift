// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "STKComponents",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "STKComponents",
            targets: ["STKComponents"]),
    ],
    dependencies: [
        // External dependencies here with the format as explained bellow
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "STKComponents"),
        .testTarget(
            name: "STKComponentsTests",
            dependencies: ["STKComponents"]),
    ]
)
