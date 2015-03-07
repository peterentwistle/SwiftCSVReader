# SwiftCSVReader
A simple CSV Reader for swift

## Usage
### test.csv
```
name,price
water,1.29
coffee,1.99
tea,1.89
orange,1.49
```
### test.swift
```swift
let csv = CSVReader(fileName: "test")

println(csv.headers)
println(csv.rows[0])
println(csv.rows[1]["name"])
println(csv.rows[1]["price"])
println(csv.columns["name"])
println(csv.columns["price"])
println(csv.numberOfColumns)
println(csv.numberOfRows)
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
