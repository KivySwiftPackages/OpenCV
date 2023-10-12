

import Foundation
import opencv2
import PythonSwiftCore

public func imread(filename: String) -> Mat {
	let mat = Imgcodecs.imread(filename: filename)
	//print(mat)
	return mat
}

public func imshow(mat: Mat) -> Data? {
	let dst = Mat()
	Imgproc.cvtColor(src: mat, dst: dst, code: .COLOR_BGR2RGB)
	return dst.toUIImage().pngData()
}
///################## GaussianBlur ##########################
public func GaussianBlur(src: Mat, ksize: PyPointer, sigmaX: Double) -> Mat {
	let dst: Mat = .init()
	let ksize = try! Size2i(tuple: ksize)
	Imgproc.GaussianBlur(src: src, dst: dst, ksize: ksize, sigmaX: sigmaX)
	return dst
}

public func GaussianBlur(src: Mat, ksize: PyPointer, sigmaX: Double, sigmaY: Double)  -> Mat {
	let dst: Mat = .init()
	let ksize = try! Size2i(tuple: ksize)
	Imgproc.GaussianBlur(src: src, dst: dst, ksize: ksize, sigmaX: sigmaX, sigmaY: sigmaY)
	return dst
}

public func GaussianBlur(src: Mat, ksize: PyPointer, sigmaX: Double, sigmaY: Double, borderType: Int32) -> Mat {
	let dst: Mat = .init()
	let ksize = try! Size2i(tuple: ksize)
	Imgproc.GaussianBlur(src: src, dst: dst, ksize: ksize, sigmaX: sigmaX, sigmaY: sigmaY, borderType: .init(rawValue: borderType) ?? .BORDER_DEFAULT)
	return dst
}
// ###################################################

///################## blur ##########################
public func blur(src: Mat, ksize: PyPointer) throws -> Mat {
	let dst: Mat = .init()
	let ksize = try Size2i(tuple: ksize)
	Imgproc.blur(src: src, dst: dst, ksize: ksize)
	return dst
}

public func blur(src: Mat, ksize: PyPointer, anchor: PyPointer) throws -> Mat {
	let dst: Mat = .init()
	let ksize = try Size2i(tuple: ksize)
	let anchor = try Point2i(tuple: anchor)
	Imgproc.blur(src: src, dst: dst, ksize: ksize, anchor: anchor)
	return dst
}

public func blur(src: Mat, ksize: PyPointer, anchor: PyPointer, borderType: Int32) throws -> Mat {
	let dst: Mat = .init()
	let ksize = try Size2i(tuple: ksize)
	let anchor = try Point2i(tuple: anchor)
	Imgproc.blur(src: src, dst: dst, ksize: ksize, anchor: anchor, borderType: .init(rawValue: borderType) ?? .BORDER_DEFAULT)
	return dst
}
// ###################################################

///################## bilateralFilter ##########################



public func bilateralFilter(src: Mat, d: Int32, sigmaColor: Double, sigmaSpace: Double) -> Mat {
	let dst: Mat = .init()
	Imgproc.bilateralFilter(src: src, dst: dst, d: d, sigmaColor: sigmaColor, sigmaSpace: sigmaSpace)
	return dst
}

public func bilateralFilter(src: Mat, d: Int32, sigmaColor: Double, sigmaSpace: Double, borderType: Int32 ) -> Mat {
	let dst: Mat = .init()
	Imgproc.bilateralFilter(src: src, dst: dst, d: d, sigmaColor: sigmaColor, sigmaSpace: sigmaSpace, borderType: .init(rawValue: borderType) ?? .BORDER_DEFAULT)
	return dst
}

public func Canny(src: Mat, threshold1: Double, threshold2: Double) -> Mat {
	let dst = Mat()
	Imgproc.Canny(image: src, edges: dst, threshold1: threshold1, threshold2: threshold2)
	return dst
}

public func Canny(src: Mat, threshold1: Double, threshold2: Double, apertureSize: Int32) -> Mat {
	let dst = Mat()
	Imgproc.Canny(image: src, edges: dst, threshold1: threshold1, threshold2: threshold2, apertureSize: apertureSize)
	return dst
}



extension Mat: PyEncodable {
	public var pyObject: PythonSwiftCore.PythonObject {
		.init(getter: pyPointer)
	}
	
	public var pyPointer: PythonSwiftCore.PyPointer {
		create_pyMat(self)
	}
	
	public convenience init(pixels: Data) {
		self.init(uiImage: .init(data: pixels)!)
	}

}


extension Size2i {
	convenience init(tuple: PyPointer) throws {
		self.init(
			width: try PyTuple_GetItem(tuple, 0),
			height: try PyTuple_GetItem(tuple, 1)
		)
	}
}

extension Size2d {
	convenience init(tuple: PyPointer) throws {
		self.init(
			width: try PyTuple_GetItem(tuple, 0),
			height: try PyTuple_GetItem(tuple, 1)
		)
	}
}

extension Size2f {
	convenience init(tuple: PyPointer) throws {
		self.init(
			width: try PyTuple_GetItem(tuple, 0),
			height: try PyTuple_GetItem(tuple, 1)
		)
	}
}

extension Point2i {
	convenience init(tuple: PyPointer) throws {
		self.init(
			x: try PyTuple_GetItem(tuple, 0),
			y: try PyTuple_GetItem(tuple, 1)
		)
	}
}

extension Point2f {
	convenience init(tuple: PyPointer) throws {
		self.init(
			x: try PyTuple_GetItem(tuple, 0),
			y: try PyTuple_GetItem(tuple, 1)
		)
	}
}

extension Point2d {
	convenience init(tuple: PyPointer) throws {
		self.init(
			x: try PyTuple_GetItem(tuple, 0),
			y: try PyTuple_GetItem(tuple, 1)
		)
	}
}
