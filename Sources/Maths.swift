import Foundation



/* From <https://victorqi.gitbooks.io/swift-algorithm/content/greatest_common_divisor.html>.
 * I added `abs` for `m` and `n`: apparently [`gcd(a, b) == gcd(abs(a), b) == gcd(a, abs(b)) == gcd(abs(a), abs(b))`](<https://math.stackexchange.com/a/1900775>). */
internal func gcd(_ m: Int, _ n: Int) -> Int {
	let m = abs(m), n = abs(n)
	
	var a: Int
	var b = max(m, n)
	var r = min(m, n)
	while r != 0 {
		a = b
		b = r
		r = a % b
	}
	
	return b
}
