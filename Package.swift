// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProjectI",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ProjectI",
            targets: ["ProjectI"]),
    ],
    dependencies: [
        // Here you can add dependencies to other packages that your package depends on.
        // For example, if you need a testing framework, you can add it here:
        // .package(url: "https://github.com/Quick/Quick.git", from: "3.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ProjectI",
            dependencies: []),
        .testTarget(
            name: "ProjectITests",
            dependencies: ["ProjectI"]),
    ]
)
