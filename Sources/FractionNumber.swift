import Foundation



/**
 A fraction number (e.g. 2/3, which is almost equal to 0.666666666666666667 will be represented properly using a fraction number).
 
 - Note: Two fractions are equal iif their value is equal.
 The comparisons are done on `Int`s, so there will never be a precision issue.
 See Equatable and Hashable implementation of the struct for more info.*/
public struct FractionNumber : Sendable {
	
	public static var zero: FractionNumber {
		return 0
	}
	
	public static var one: FractionNumber {
		return 1
	}
	
	public static var oneHalf: FractionNumber {
		return FractionNumber(numerator: 1, denominator: 2)!
	}
	
	public static func percentage(_ value: Int) -> FractionNumber {
		return FractionNumber(numerator: value, denominator: 100)!
	}
	
	public var numerator: Int
	public private(set) var denominator: Int
	
	public init?(numerator: Int, denominator: Int) {
		guard denominator != 0 else {
			return nil
		}
		self.numerator = numerator
		self.denominator = denominator
	}
	
	public func signum() -> Int {
		return numerator.signum() * denominator.signum()
	}
	
	/**
	 The exact sign of the fraction.
	 
	 This will be `1` or `-1`.
	 
	 - Important: Contrary to `signum()` on an `Int`, this _cannot be 0_.
	 If the fraction is equal to 0 (numerator == 0), the signum will be the one of the denominator, which cannot be 0 for a well formed fraction. */
	public func signumNoZero() -> Int {
		guard numerator != 0 else {return denominator.signum()}
		return numerator.signum() * denominator.signum()
	}
	
	/**
	 The `Float` value for this fraction (`numerator/denominator`).
	 
	 Due to `Float` precision, in some extreme cases, the value of the fraction and the normalized fraction might not be equal.
	 
	 Example:
	 ```swift
	 let f = FractionNumber(numerator: 418950000000000000*3, denominator: 10000000000000000*3)!
	 print(f.floatValue)              /* <- 41.894997 */
	 print(f.normalized().floatValue) /* <- 41.895 */
	 ``` */
	public var floatValue: Float {
		return Float(numerator)/Float(denominator)
	}
	
	/** The `Float` value of the normalized fraction. */
	public func normalizedFloatValue() -> Float {
		return normalized().floatValue
	}
	
	/**
	 The `Double` value for this fraction (`numerator/denominator`).
	 
	 Due to `Double` precision, in some extreme cases, the value of the fraction and the normalized fraction might not be equal. */
	public var doubleValue: Double {
		return Double(numerator)/Double(denominator)
	}
	
	/** The `Double` value of the normalized fraction. */
	public func normalizedDoubleValue() -> Double {
		return normalized().doubleValue
	}
	
	public func roundedValue() -> Int {
		return roundedValue(roundingRule: .toNearestOrAwayFromZero)
	}
	
	public func roundedValue(roundingRule: FloatingPointRoundingRule) -> Int {
		let normalized = normalized()
		assert(normalized.denominator > 0)
		
		/* Check for the trivial case first. */
		if normalized.denominator == 1 {
			return normalized.numerator
		}
		
		/* Treat generic cases. */
		let truncated = normalized.numerator / normalized.denominator
		switch roundingRule {
			case .towardZero: return truncated
			case .up:
				if normalized.numerator >= 0 {return truncated + 1}
				else                         {return truncated}
			case .down:
				if normalized.numerator >= 0 {return truncated}
				else                         {return truncated - 1}
			case .awayFromZero:
				if normalized.numerator >= 0 {return truncated + 1}
				else                         {return truncated - 1}
			case .toNearestOrAwayFromZero:
				/* Note: We re-normalize when calling rounded value. */
				if normalized.numerator >= 0 {return (normalized + .oneHalf).roundedValue(roundingRule: .towardZero)}
				else                         {return (normalized - .oneHalf).roundedValue(roundingRule: .towardZero)}
			case .toNearestOrEven:
				switch normalized.denominator {
					case 1: fatalError("Internal logic error (got denominator == 1 but this should already have been treated).")
					case 2:
						/* Our fraction represents a *.5 value, exactly between two numbers: we have to check the even number. */
						if truncated.isMultiple(of: 2) {
							return truncated
						} else {
							if normalized.numerator >= 0 {return truncated + 1}
							else                         {return truncated - 1}
						}
					default:
						/* Note: We re-normalize twice when calling rounded value (the toNearestOrAwayFromZero also re-call rounded…). */
						return normalized.roundedValue(roundingRule: .toNearestOrAwayFromZero)
				}
				
			@unknown default:
				fatalError("Unsupported rounding method")
		}
	}
	
	public var nextUp: FractionNumber {
		return .init(numerator: numerator + denominator.signum(), denominator: denominator)!
	}
	
	public var nextDown: FractionNumber {
		return .init(numerator: numerator - denominator.signum(), denominator: denominator)!
	}
	
	/**
	 The same fraction, but with the numerator and denominator inversed.
	 `nil` if the `numerator` of the receiver is `0`. */
	public var inversed: FractionNumber? {
		return .init(numerator: denominator, denominator: numerator)
	}
	
	public func normalized() -> FractionNumber {
		let gcd = gcd(numerator, denominator) * denominator.signum()
		return .init(numerator: numerator/gcd, denominator: denominator/gcd)!
	}
	
	public var isGreaterThanZero: Bool {
		assert(denominator != 0)
		return (numerator > 0) == (numerator == 0 || denominator > 0)
	}
	
	public var isGreaterOrEqualToZero: Bool {
		assert(denominator != 0)
		return (numerator >= 0) == (numerator == 0 || denominator > 0)
	}
	
	public var isLowerThanZero: Bool {
		assert(denominator != 0)
		return (numerator > 0) != (numerator != 0 && denominator > 0)
	}
	
	public var isLowerOrEqualToZero: Bool {
		assert(denominator != 0)
		return (numerator >= 0) != (numerator != 0 && denominator > 0)
	}
	
	public static prefix func -(_ n: FractionNumber) -> FractionNumber {
		return FractionNumber(numerator: -n.numerator, denominator: n.denominator)!
	}
	
	public static func +(_ lhs: FractionNumber, _ rhs: FractionNumber) -> FractionNumber {
		let gcd = gcd(lhs.denominator, rhs.denominator)
		let lhsMultiplier = rhs.denominator / gcd
		let rhsMultiplier = lhs.denominator / gcd
		assert(lhs.denominator * lhsMultiplier == rhs.denominator * rhsMultiplier)
		return FractionNumber(
			numerator:   lhs.numerator * lhsMultiplier + rhs.numerator * rhsMultiplier,
			denominator: lhs.denominator * lhsMultiplier
		)!
	}
	
	public static func -(_ lhs: FractionNumber, _ rhs: FractionNumber) -> FractionNumber {
		return lhs + -rhs
	}
	
	public static func *(_ lhs: FractionNumber, _ rhs: FractionNumber) -> FractionNumber {
		return FractionNumber(numerator: lhs.numerator * rhs.numerator, denominator: lhs.denominator * rhs.denominator)!
	}
	
	public static func *(_ lhs: FractionNumber, _ rhs: Int) -> FractionNumber {
		return FractionNumber(numerator: lhs.numerator * rhs, denominator: lhs.denominator)!
	}
	
	/** We crash when there is a division by 0. */
	public static func /(_ lhs: FractionNumber, _ rhs: FractionNumber) -> FractionNumber {
		assert(rhs.numerator != 0, "Division by 0.")
		return FractionNumber(numerator: lhs.numerator * rhs.denominator, denominator: lhs.denominator * rhs.numerator)!
	}
	
	/** We crash when there is a division by 0. */
	public static func /(_ lhs: FractionNumber, _ rhs: Int) -> FractionNumber {
		assert(rhs != 0, "Division by 0.")
		return FractionNumber(numerator: lhs.numerator, denominator: lhs.denominator * rhs)!
	}
	
}


extension FractionNumber : ExpressibleByIntegerLiteral {
	
	public init(integerLiteral value: Int) {
		self.init(numerator: value, denominator: 1)!
	}
	
}


extension FractionNumber : Equatable {
	
	public static func ==(_ lhs: FractionNumber, _ rhs: FractionNumber) -> Bool {
		guard lhs.signum() == rhs.signum() else {
			return false
		}
		
		let lgcd = gcd(lhs.numerator, lhs.denominator)
		let rgcd = gcd(rhs.numerator, rhs.denominator)
		assert(lhs.numerator % lgcd == 0 && lhs.denominator % lgcd == 0)
		assert(rhs.numerator % rgcd == 0 && rhs.denominator % rgcd == 0)
		return (
			abs(lhs.numerator)   / lgcd == abs(rhs.numerator)   / rgcd &&
			abs(lhs.denominator) / lgcd == abs(rhs.denominator) / rgcd
		)
	}
	
}


extension FractionNumber : Hashable {
	
	public func hash(into hasher: inout Hasher) {
		let gcd = gcd(numerator, denominator)
		assert(numerator % gcd == 0 && denominator % gcd == 0)
		
		hasher.combine(signum())
		hasher.combine(abs(numerator)   / gcd)
		hasher.combine(abs(denominator) / gcd)
	}
	
}


extension FractionNumber : Comparable {
	
	public static func <(_ lhs: FractionNumber, _ rhs: FractionNumber) -> Bool {
		/* Note: We could optimize away the case where one fraction is negative and the other is not, but in practice it’s not really useful and makes the algo less elegant. */
		let gcd = gcd(lhs.denominator, rhs.denominator) * lhs.denominator.signum() * rhs.denominator.signum()
		let lhsMultiplier = rhs.denominator / gcd
		let rhsMultiplier = lhs.denominator / gcd
		assert(lhs.denominator * lhsMultiplier == rhs.denominator * rhsMultiplier)
		return lhs.numerator * lhsMultiplier < rhs.numerator * rhsMultiplier
	}
	
}


extension FractionNumber : SignedNumeric {
	
	public typealias Magnitude = FractionNumber
	
	public init?<T>(exactly source: T) where T : BinaryInteger {
		guard let n = Int(exactly: source) else {
			return nil
		}
		self = FractionNumber(numerator: n, denominator: 1)!
	}
	
	public var magnitude: FractionNumber {
		return .init(numerator: abs(numerator), denominator: abs(denominator))!
	}
	
	public static func *=(lhs: inout FractionNumber, rhs: FractionNumber) {
		lhs = lhs * rhs
	}
	
}


extension FractionNumber : RawRepresentable, Codable {
	
	public var rawValue: String {
		return String(numerator) + "/" + String(denominator)
	}
	
	public init?<S : StringProtocol>(rawValue: S) {
		/* I’m not sure the `RawRepresentable` technically allows lax parsing of the raw values, so we don’t allow them by default, but leave a hatch. */
		self.init(rawValue: rawValue, strict: true)
	}
	
	public init?<S : StringProtocol>(rawValue: S, strict: Bool) {
		let parts = rawValue.split(separator: "/", omittingEmptySubsequences: false)
		let nParts = parts.count
		guard nParts == 2 || (!strict && nParts == 1) else {
			return nil
		}
		guard let numerator = strict ? Int(parts[0]) : Int(parts[0].trimmingCharacters(in: Self.leniencyCharacterSet)) else {
			return nil
		}
		guard nParts == 2 else {
			assert(!strict)
			self.init(numerator: numerator, denominator: 1)
			return
		}
		guard let denominator = strict ? Int(parts[1]) : Int(parts[1].trimmingCharacters(in: Self.leniencyCharacterSet)) else {
			return nil
		}
		self.init(numerator: numerator, denominator: denominator)
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let lenientRawValue = try container.decode(String.self)
		guard let ret = Self(rawValue: lenientRawValue, strict: false) else {
			throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid string value.")
		}
		self = ret
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(rawValue)
	}
	
	/* This is the set of characters we ignore when parsing the FractionNumber (we only ignore a normal space). */
	private static let leniencyCharacterSet = CharacterSet(charactersIn: " ")
	
}


extension FractionNumber : CustomStringConvertible {
	
	public var description: String {
		return rawValue
	}
	
}


extension FractionNumber : CustomDebugStringConvertible {
	
	public var debugDescription: String {
		return "\(self) = \(self.normalized()) = \(self.normalizedDoubleValue())"
	}
	
}
