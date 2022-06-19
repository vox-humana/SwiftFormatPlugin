// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftFormatPlugin",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        .plugin(name: "SwiftFormatPlugin", targets: ["Reformat Source Code"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.49.9"),
    ],
    targets: [
        .executableTarget(
            name: "TestTarget",
            path: "TestTarget"
        ),
        .plugin(
            name: "Reformat Source Code",
            capability: .command(
                intent: .sourceCodeFormatting(),
                permissions: [
                    .writeToPackageDirectory(reason: "Format source code in Swift files"),
                ]
            ),
            dependencies: [
                .product(name: "swiftformat", package: "SwiftFormat"),
            ],
            path: "Sources"
        ),
    ]
)
