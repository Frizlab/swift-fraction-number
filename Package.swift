// swift-tools-version:5.8
import PackageDescription



let commonSwiftSettings: [SwiftSetting] = [
	.enableExperimentalFeature("StrictConcurrency")
]


let package = Package(
	name: "swift-fraction-number",
	products: [
		.library(name: "FractionNumber", targets: ["FractionNumber"]),
	],
	targets: [
		.target(name: "FractionNumber", path: "Sources", swiftSettings: commonSwiftSettings),
		.testTarget(name: "FractionNumberTests", dependencies: ["FractionNumber"], path: "Tests", swiftSettings: commonSwiftSettings),
	]
)
