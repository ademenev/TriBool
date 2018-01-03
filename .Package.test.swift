import PackageDescription
import Foundation

var dependencies: [Package.Dependency] = [
  .Package(url: "https://github.com/Quick/Quick.git", majorVersion: 1, minor: 1),
	.Package(url: "https://github.com/Quick/Nimble.git", majorVersion: 7),
];

let package = Package(
    name: "TriBool",
	targets: [
		Target(name: "TriBool"),
	],
  dependencies: dependencies
)
