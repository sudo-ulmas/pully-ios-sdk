// swift-tools-version: 5.9
// Public distribution manifest for the Pully SDK (binary).
//
// This file is published in the partner-facing distribution repo — NOT this
// source repo: https://github.com/sudo-ulmas/pully-ios-sdk
// Partners add that repo's URL in Xcode and get:
//   - Pully.xcframework  (closed-source binary, attached to the GitHub release
//     of the same version, integrity-pinned by SwiftPM via the checksum below)
//   - MyIdSDK            (resolved transitively from MyID's public SwiftPM repo)
//
// Per release: update the binary target `url` + `checksum` (checksum printed by
// Scripts/build-xcframework.sh), copy to the distribution repo, attach the zip
// to a GitHub release tagged with the same version.
import PackageDescription

let package = Package(
    name: "Pully",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "Pully", targets: ["PullyWrapper"]),
    ],
    dependencies: [
        .package(url: "https://gitlab.myid.uz/myid-public-code/myid-ios-sdk.git", from: "3.1.3"),
    ],
    targets: [
        .binaryTarget(
            name: "Pully",
            url: "https://github.com/sudo-ulmas/pully-ios-sdk/releases/download/1.1.1/Pully.xcframework.zip",
            checksum: "eb74e35da151e1f82caa165a003ff617f3828ef8e3cf54e8865b6fd0cdf3b7ef"
        ),
        // Binary targets cannot declare dependencies, so this thin wrapper
        // links MyIdSDK for the partner. Its single source file re-exports
        // the Pully module; partners just `import Pully`.
        .target(
            name: "PullyWrapper",
            dependencies: [
                "Pully",
                .product(name: "MyIdSDK", package: "myid-ios-sdk"),
            ],
            path: "Wrapper"
        ),
    ]
)
