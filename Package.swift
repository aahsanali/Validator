// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoginFramework",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LoginFramework",
            targets: ["LoginFramework"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "LoginFramework",
            url: "https://raw.githubusercontent.com/aahsanali/Validator/main/demoshop/LoginFramework.xcframework.zip",
            checksum: "8f0db3077aa077b730fa51002123f4379340f88d62cacbfa6e70f19bc688fb8c"
        ),
        .testTarget(
            name: "LoginFrameworkTests",
            dependencies: ["LoginFramework"]),
    ]
)
