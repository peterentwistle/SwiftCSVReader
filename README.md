# SwiftCSVReader
A simple CSV Reader for swift.

[![Build Status](https://travis-ci.org/peterentwistle/SwiftCSVReader.svg?branch=master)](https://travis-ci.org/peterentwistle/SwiftCSVReader)
[![Licence](https://img.shields.io/badge/Licence-MIT-lightgrey.svg)](https://github.com/peterentwistle/SwiftCSVReader/blob/master/LICENSE)

## Usage
### Initialisation
```swift
import CSVReader
```
```swift
let csvData = "name,price\n" +
              "water,1.29\n" +
              "coffee,1.99\n" +
              "tea,1.89\n" +
              "orange,1.49\n"

let csv = CSVReader(with: csvData)
```

## Example
```swift
import CSVReader

// Load csv
let path = Bundle.main.path(forResource: "test", ofType: "csv")
let testCsvFile = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)

let csv = CSVReader(with: testCsvFile)

print(csv.headers)
print(csv.rows[0])
print(csv.rows[1]["name"]!)
print(csv.rows[1]["price"]!)
print(csv.columns["name"]!)
print(csv.columns["price"]!)
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
