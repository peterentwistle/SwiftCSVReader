# SwiftCSVReader
A simple CSV Reader for swift.

NOTE: This is currently an experimental project using Swift 2.0 and built using Xcode-beta 5.

## Usage
### Initialisation
```swift
import CSVReader
```
```swift
let csv = CSVReader(fileName: "test")
```

## Example
```swift
import CSVReader

let csv = CSVReader(fileName: "test")

print(csv.headers)
print(csv.rows[0])
print(csv.rows[1]["name"])
print(csv.rows[1]["price"])
print(csv.columns["name"])
print(csv.columns["price"])
print(csv.numberOfColumns)
print(csv.numberOfRows)
```

### test.csv
```
name,price
water,1.29
coffee,1.99
tea,1.89
orange,1.49
```

## Output

```
[name, price]
[price: 1.29, name: water]
Optional("coffee")
Optional("1.99")
Optional(["water", "coffee", "tea", "orange"])
Optional(["1.29", "1.99", "1.89", "1.49"])
2
4
```

## License
SwiftCSVReader is released under the MIT license. See LICENSE for details.
