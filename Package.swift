import PackageDescription

let package = Package(
    name: "bashtv",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/benloong/TidyJSON.git", majorVersion: 1),
        .Package(url: "https://github.com/onevcat/Rainbow", majorVersion: 1),
        .Package(url: "https://github.com/czechboy0/Environment.git", majorVersion: 0)
    ]
)