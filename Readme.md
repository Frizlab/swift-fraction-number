# FractionNumber

This package provides a new type: `FractionNumber` that allows representing fractions precisely instead of using a `Double` or a `Float`.

## Example of Usage
```swift
var fraction: FractionNumber = 1
print(fraction) // “1/1”

fraction /= 3
print(fraction) // “1/3”
print(fraction.doubleValue) // “0.3333333333333333”

...
```
