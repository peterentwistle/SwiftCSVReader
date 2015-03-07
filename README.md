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
println(csv.row(1))
println(csv.row(1)["name"])
println(csv.numberOfColumns)
println(csv.numberOfRows)
```

## Output

```
[name, price]
[price: 1.29, name: water]
Optional("water")
2
5
```
