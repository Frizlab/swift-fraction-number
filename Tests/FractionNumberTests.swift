import Foundation
import XCTest

@testable import FractionNumber



final class FractionNumberTests : XCTestCase {
	
	func testEquality() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator:  2, denominator: -4))
		let n2 = try XCTUnwrap(FractionNumber(numerator: -4, denominator:  8))
		let n3 = try XCTUnwrap(FractionNumber(numerator:  1, denominator:  2))
		let n4 = try XCTUnwrap(FractionNumber(numerator: -2, denominator: -4))
		let n5 = try XCTUnwrap(FractionNumber(numerator:  1, denominator:  3))
		let n6 = try XCTUnwrap(FractionNumber(numerator: -2, denominator:  4))
		XCTAssertEqual   (n1, n1)
		XCTAssertEqual   (n1, n2)
		XCTAssertNotEqual(n1, n3)
		XCTAssertNotEqual(n1, n4)
		XCTAssertNotEqual(n1, n5)
		XCTAssertEqual   (n1, n6)
		XCTAssertEqual   (n2, n2)
		XCTAssertNotEqual(n2, n3)
		XCTAssertNotEqual(n2, n4)
		XCTAssertNotEqual(n2, n5)
		XCTAssertEqual   (n2, n6)
		XCTAssertEqual   (n3, n3)
		XCTAssertEqual   (n3, n4)
		XCTAssertNotEqual(n3, n5)
		XCTAssertNotEqual(n3, n6)
		XCTAssertEqual   (n4, n4)
		XCTAssertNotEqual(n4, n5)
		XCTAssertNotEqual(n4, n6)
		XCTAssertEqual   (n5, n5)
		XCTAssertNotEqual(n5, n6)
		XCTAssertEqual   (n6, n6)
	}
	
	func testEqualityFor0() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator: 0, denominator:  1))
		let n2 = try XCTUnwrap(FractionNumber(numerator: 0, denominator: -1))
		let n3 = try XCTUnwrap(FractionNumber(numerator: 0, denominator: -2))
		let n4 = try XCTUnwrap(FractionNumber(numerator: 1, denominator: -2))
		XCTAssertEqual(n1, n1)
		XCTAssertEqual(n1, n2)
		XCTAssertEqual(n1, n3)
		XCTAssertNotEqual(n1, n4)
		XCTAssertNotEqual(n2, n4)
		XCTAssertNotEqual(n3, n4)
	}
	
	func testGreaterOrEqualTo0() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator:  0, denominator: -1))
		let n2 = try XCTUnwrap(FractionNumber(numerator:  0, denominator:  1))
		let n3 = try XCTUnwrap(FractionNumber(numerator:  1, denominator:  1))
		let n4 = try XCTUnwrap(FractionNumber(numerator:  1, denominator: -1))
		let n5 = try XCTUnwrap(FractionNumber(numerator: -1, denominator:  1))
		let n6 = try XCTUnwrap(FractionNumber(numerator: -1, denominator: -1))
		XCTAssertTrue (n1.isGreaterOrEqualToZero)
		XCTAssertTrue (n2.isGreaterOrEqualToZero)
		XCTAssertTrue (n3.isGreaterOrEqualToZero)
		XCTAssertFalse(n4.isGreaterOrEqualToZero)
		XCTAssertFalse(n5.isGreaterOrEqualToZero)
		XCTAssertTrue (n6.isGreaterOrEqualToZero)
	}
	
	func testGreaterThan0() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator:  0, denominator: -1))
		let n2 = try XCTUnwrap(FractionNumber(numerator:  0, denominator:  1))
		let n3 = try XCTUnwrap(FractionNumber(numerator:  1, denominator:  1))
		let n4 = try XCTUnwrap(FractionNumber(numerator:  1, denominator: -1))
		let n5 = try XCTUnwrap(FractionNumber(numerator: -1, denominator:  1))
		let n6 = try XCTUnwrap(FractionNumber(numerator: -1, denominator: -1))
		XCTAssertFalse(n1.isGreaterThanZero)
		XCTAssertFalse(n2.isGreaterThanZero)
		XCTAssertTrue (n3.isGreaterThanZero)
		XCTAssertFalse(n4.isGreaterThanZero)
		XCTAssertFalse(n5.isGreaterThanZero)
		XCTAssertTrue (n6.isGreaterThanZero)
	}
	
	func testLowerOrEqualTo0() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator:  0, denominator: -1))
		let n2 = try XCTUnwrap(FractionNumber(numerator:  0, denominator:  1))
		let n3 = try XCTUnwrap(FractionNumber(numerator:  1, denominator:  1))
		let n4 = try XCTUnwrap(FractionNumber(numerator:  1, denominator: -1))
		let n5 = try XCTUnwrap(FractionNumber(numerator: -1, denominator:  1))
		let n6 = try XCTUnwrap(FractionNumber(numerator: -1, denominator: -1))
		XCTAssertTrue (n1.isLowerOrEqualToZero)
		XCTAssertTrue (n2.isLowerOrEqualToZero)
		XCTAssertFalse(n3.isLowerOrEqualToZero)
		XCTAssertTrue (n4.isLowerOrEqualToZero)
		XCTAssertTrue (n5.isLowerOrEqualToZero)
		XCTAssertFalse(n6.isLowerOrEqualToZero)
	}
	
	func testLowerThan0() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator:  0, denominator: -1))
		let n2 = try XCTUnwrap(FractionNumber(numerator:  0, denominator:  1))
		let n3 = try XCTUnwrap(FractionNumber(numerator:  1, denominator:  1))
		let n4 = try XCTUnwrap(FractionNumber(numerator:  1, denominator: -1))
		let n5 = try XCTUnwrap(FractionNumber(numerator: -1, denominator:  1))
		let n6 = try XCTUnwrap(FractionNumber(numerator: -1, denominator: -1))
		XCTAssertFalse(n1.isLowerThanZero)
		XCTAssertFalse(n2.isLowerThanZero)
		XCTAssertFalse(n3.isLowerThanZero)
		XCTAssertTrue (n4.isLowerThanZero)
		XCTAssertTrue (n5.isLowerThanZero)
		XCTAssertFalse(n6.isLowerThanZero)
	}
	
	func testNormalized() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator:  2, denominator: -4))
		let n2 = try XCTUnwrap(FractionNumber(numerator: -4, denominator:  8))
		let n3 = try XCTUnwrap(FractionNumber(numerator:  1, denominator: -2))
		let n4 = try XCTUnwrap(FractionNumber(numerator: -1, denominator:  2))
		XCTAssertEqual(n1.normalized().numerator,   n4.numerator)
		XCTAssertEqual(n1.normalized().denominator, n4.denominator)
		XCTAssertEqual(n2.normalized().numerator,   n4.numerator)
		XCTAssertEqual(n2.normalized().denominator, n4.denominator)
		XCTAssertEqual(n3.normalized().numerator,   n4.numerator)
		XCTAssertEqual(n3.normalized().denominator, n4.denominator)
		XCTAssertEqual(n4.normalized().numerator,   n4.numerator)
		XCTAssertEqual(n4.normalized().denominator, n4.denominator)
	}

	func testNextUp() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator:  1, denominator: -2))
		let n2 = try XCTUnwrap(FractionNumber(numerator: -1, denominator:  2))
		let ref = try XCTUnwrap(FractionNumber(numerator: 0, denominator: -2))
		XCTAssertEqual(n1.nextUp, ref)
		XCTAssertEqual(n2.nextUp, ref)
	}
	
	func testNextDown() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator:  1, denominator: -2))
		let n2 = try XCTUnwrap(FractionNumber(numerator: -1, denominator:  2))
		let ref = try XCTUnwrap(FractionNumber(numerator: 2, denominator: -2))
		XCTAssertEqual(n1.nextDown, ref)
		XCTAssertEqual(n2.nextDown, ref)
	}
	
	func testMultiplication1() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 2))
		let n2 = try XCTUnwrap(FractionNumber(numerator: 4, denominator: 2))
		let res = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 1))
		XCTAssertEqual(n1 * n2, res)
	}
	
	func testMultiplication2() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 2))
		let n2 = try XCTUnwrap(FractionNumber(numerator: 3, denominator: 3))
		let res = try XCTUnwrap(FractionNumber(numerator: 3, denominator: 6))
		XCTAssertEqual(n1 * n2, res)
	}
	
	func testAddition1() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 2))
		let n2 = try XCTUnwrap(FractionNumber(numerator: 4, denominator: 2))
		let res = try XCTUnwrap(FractionNumber(numerator: 5, denominator: 2))
		XCTAssertEqual(n1 + n2, res)
	}
	
	func testAddition2() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 2))
		let n2 = try XCTUnwrap(FractionNumber(numerator: 4, denominator: 6))
		let res = try XCTUnwrap(FractionNumber(numerator: 7, denominator: 6))
		XCTAssertEqual(n1 + n2, res)
	}
	
	func testAddition3() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator: 2, denominator: 2))
		let n2 = try XCTUnwrap(FractionNumber(numerator: 4, denominator: 6))
		let res = try XCTUnwrap(FractionNumber(numerator: 15, denominator: 9))
		XCTAssertEqual(n1 + n2, res)
	}
	
	func testAddition4() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator: -2, denominator: 5))
		let n2 = try XCTUnwrap(FractionNumber(numerator:  4, denominator: 6))
		let res = try XCTUnwrap(FractionNumber(numerator: -2*6 + 4*5, denominator: 5*6))
		XCTAssertEqual(n1 + n2, res)
	}
	
	func testAddition5() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator: 2, denominator: -5))
		let n2 = try XCTUnwrap(FractionNumber(numerator: 4, denominator:  6))
		let res = try XCTUnwrap(FractionNumber(numerator: -2*6 + 4*5, denominator: 5*6))
		XCTAssertEqual(n1 + n2, res)
	}
	
	func testComparison1() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 2))
		let n2 = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 3))
		XCTAssertTrue(n1 > n2)
	}
	
	func testComparison2() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 3))
		let n2 = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 3))
		XCTAssertTrue(n1 == n2)
		XCTAssertFalse(n1 < n2)
		XCTAssertFalse(n1 > n2)
	}
	
	func testComparison3() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator: 1, denominator:  3))
		let n2 = try XCTUnwrap(FractionNumber(numerator: 1, denominator: -3))
		XCTAssertNotEqual(n1, n2)
		XCTAssertTrue(n1 > n2)
	}
	
	func testComparison4() throws {
		let n1 = try XCTUnwrap(FractionNumber(numerator:  1, denominator:  3))
		let n2 = try XCTUnwrap(FractionNumber(numerator: -1, denominator: -3))
		XCTAssertEqual(n1, n2)
	}
	
	func testRounding1() throws {
		let n = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 3))
		XCTAssertEqual(n.roundedValue(roundingRule: .up),                      1)
		XCTAssertEqual(n.roundedValue(roundingRule: .awayFromZero),            1)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrAwayFromZero), 0)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrEven),         0)
		XCTAssertEqual(n.roundedValue(roundingRule: .towardZero),              0)
		XCTAssertEqual(n.roundedValue(roundingRule: .down),                    0)
	}
	
	func testRounding2() throws {
		let n = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 1))
		XCTAssertEqual(n.roundedValue(roundingRule: .up),                      1)
		XCTAssertEqual(n.roundedValue(roundingRule: .awayFromZero),            1)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrAwayFromZero), 1)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrEven),         1)
		XCTAssertEqual(n.roundedValue(roundingRule: .towardZero),              1)
		XCTAssertEqual(n.roundedValue(roundingRule: .down),                    1)
	}
	
	func testRounding3() throws {
		let n = try XCTUnwrap(FractionNumber(numerator: 0, denominator: 1))
		XCTAssertEqual(n.roundedValue(roundingRule: .up),                      0)
		XCTAssertEqual(n.roundedValue(roundingRule: .awayFromZero),            0)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrAwayFromZero), 0)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrEven),         0)
		XCTAssertEqual(n.roundedValue(roundingRule: .towardZero),              0)
		XCTAssertEqual(n.roundedValue(roundingRule: .down),                    0)
	}
	
	func testRounding4() throws {
		let n = try XCTUnwrap(FractionNumber(numerator: 2, denominator: 2))
		XCTAssertEqual(n.roundedValue(roundingRule: .up),                      1)
		XCTAssertEqual(n.roundedValue(roundingRule: .awayFromZero),            1)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrAwayFromZero), 1)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrEven),         1)
		XCTAssertEqual(n.roundedValue(roundingRule: .towardZero),              1)
		XCTAssertEqual(n.roundedValue(roundingRule: .down),                    1)
	}
	
	func testRounding5() throws {
		let n = try XCTUnwrap(FractionNumber(numerator: 6, denominator: 3))
		XCTAssertEqual(n.roundedValue(roundingRule: .up),                      2)
		XCTAssertEqual(n.roundedValue(roundingRule: .awayFromZero),            2)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrAwayFromZero), 2)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrEven),         2)
		XCTAssertEqual(n.roundedValue(roundingRule: .towardZero),              2)
		XCTAssertEqual(n.roundedValue(roundingRule: .down),                    2)
	}
	
	func testRounding6() throws {
		let n = try XCTUnwrap(FractionNumber(numerator: 4, denominator: 3))
		XCTAssertEqual(n.roundedValue(roundingRule: .up),                      2)
		XCTAssertEqual(n.roundedValue(roundingRule: .awayFromZero),            2)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrAwayFromZero), 1)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrEven),         1)
		XCTAssertEqual(n.roundedValue(roundingRule: .towardZero),              1)
		XCTAssertEqual(n.roundedValue(roundingRule: .down),                    1)
	}
	
	func testRounding7() throws {
		let n = try XCTUnwrap(FractionNumber(numerator: 4, denominator: -3))
		XCTAssertEqual(n.roundedValue(roundingRule: .up),                      -1)
		XCTAssertEqual(n.roundedValue(roundingRule: .awayFromZero),            -2)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrAwayFromZero), -1)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrEven),         -1)
		XCTAssertEqual(n.roundedValue(roundingRule: .towardZero),              -1)
		XCTAssertEqual(n.roundedValue(roundingRule: .down),                    -2)
	}
	
	func testRounding8() throws {
		let n = try XCTUnwrap(FractionNumber(numerator: -6, denominator: 4))
		XCTAssertEqual(n.roundedValue(roundingRule: .up),                      -1)
		XCTAssertEqual(n.roundedValue(roundingRule: .awayFromZero),            -2)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrAwayFromZero), -2)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrEven),         -2)
		XCTAssertEqual(n.roundedValue(roundingRule: .towardZero),              -1)
		XCTAssertEqual(n.roundedValue(roundingRule: .down),                    -2)
	}
	
	func testRounding9() throws {
		let n = try XCTUnwrap(FractionNumber(numerator: -10, denominator: 4))
		XCTAssertEqual(n.roundedValue(roundingRule: .up),                      -2)
		XCTAssertEqual(n.roundedValue(roundingRule: .awayFromZero),            -3)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrAwayFromZero), -3)
		XCTAssertEqual(n.roundedValue(roundingRule: .toNearestOrEven),         -2)
		XCTAssertEqual(n.roundedValue(roundingRule: .towardZero),              -2)
		XCTAssertEqual(n.roundedValue(roundingRule: .down),                    -3)
	}
	
	func testRawValueInitValid() throws {
		let rawValue = "1/2"
		let ref = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 2))
		XCTAssertEqual(FractionNumber(rawValue: rawValue), ref)
	}
	
	func testRawValueInitInvalids() throws {
		XCTAssertNil(FractionNumber(rawValue: "1"))
		XCTAssertNil(FractionNumber(rawValue: "1/0"))
		XCTAssertNil(FractionNumber(rawValue: "1/2."))
		XCTAssertNil(FractionNumber(rawValue: "1/2.0"))
		XCTAssertNil(FractionNumber(rawValue: "1 / 2"))
		XCTAssertNil(FractionNumber(rawValue: "1 / 2"))
	}
	
	func testDecodeValid1() throws {
		let data = Data(#""1/2""#.utf8)
		let ref = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 2))
		XCTAssertEqual(try JSONDecoder().decode(FractionNumber.self, from: data), ref)
	}
	
	func testDecodeValid2() throws {
		let data = Data(#""  1 / 2""#.utf8)
		let ref = try XCTUnwrap(FractionNumber(numerator: 1, denominator: 2))
		XCTAssertEqual(try JSONDecoder().decode(FractionNumber.self, from: data), ref)
	}
	
	func testDecodeValid3() throws {
		let data = Data(#""  4   ""#.utf8)
		let ref = try XCTUnwrap(FractionNumber(numerator: 8, denominator: 2))
		XCTAssertEqual(try JSONDecoder().decode(FractionNumber.self, from: data), ref)
	}
	
	func testDecodeValid4() throws {
		let data = Data(#""  -4  ""#.utf8)
		let ref = try XCTUnwrap(FractionNumber(numerator: 8, denominator: -2))
		XCTAssertEqual(try JSONDecoder().decode(FractionNumber.self, from: data), ref)
	}
	
	func testDecodeValid5() throws {
		let data = Data(#"" 2/ -4  ""#.utf8)
		let ref = try XCTUnwrap(FractionNumber(numerator: -1, denominator: 2))
		XCTAssertEqual(try JSONDecoder().decode(FractionNumber.self, from: data), ref)
	}
	
	func testDecodeInvalids() throws {
		XCTAssertThrowsError(try JSONDecoder().decode(FractionNumber.self, from: Data(#""1/0""#.utf8)))
		XCTAssertThrowsError(try JSONDecoder().decode(FractionNumber.self, from: Data(#""1/2.""#.utf8)))
		XCTAssertThrowsError(try JSONDecoder().decode(FractionNumber.self, from: Data(#""1/2.0""#.utf8)))
		XCTAssertThrowsError(try JSONDecoder().decode(FractionNumber.self, from: Data(#""1 / 2""#.utf8)))
		XCTAssertThrowsError(try JSONDecoder().decode(FractionNumber.self, from: Data(#""- 1/2""#.utf8)))
	}
	
}
