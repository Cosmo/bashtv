import PackageDescription

let package = Package(
    name: "bashtv",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/onevcat/Rainbow", majorVersion: 1),
    ]
)