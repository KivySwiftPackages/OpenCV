// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "PyOpenCV",
	platforms: [.iOS(.v13)],
	products: [
		// Products define the executables and libraries a package produces, making them visible to other packages.
//		.library(
//			name: "SwiftOpenCV",
//			targets: ["SwiftOpenCV"]),
		.library(name: "PyOpenCV", targets: ["PyOpenCV"])
	],
	dependencies: [
        .package(url: "https://github.com/PythonSwiftLink/KivySwiftLink", branch: "master"),
        .package(url: "https://github.com/PythonSwiftLink/SwiftonizePlugin", from: .init(0, 0, 0))
	],
	targets: [
		// Targets are the basic building blocks of a package, defining a module or a test suite.
		// Targets can depend on other targets in this package and products from dependencies.
		.target(
			name: "PyOpenCV",
			dependencies: [
                .product(name: "PythonSwiftCore", package: "KivySwiftLink"),
                .product(name: "PySwiftObject", package: "KivySwiftLink"),
				//"SwiftOpenCV",
				"opencv2",
			],
			plugins: [ .plugin(name: "Swiftonize", package: "SwiftonizePlugin") ]
		),
//		.target(
//			name: "SwiftOpenCV",
//			dependencies: [
//				"opencv2",
//                .product(name: "PythonSwiftCore", package: "KivySwiftLink"),
//			],
//			
//			swiftSettings: [
//				
//			]
//			
//		),
		
			.binaryTarget(name: "opencv2", url: "https://github.com/PythonSwiftLink/SwiftOpenCV/releases/download/opencv4.8.0/opencv2.zip", checksum: "b7259d3b9151f9d806356c2f38c1edaa16ab696e1c85be44606e8711be12b3ae")
	]
)
