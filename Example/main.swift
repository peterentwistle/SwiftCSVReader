//
//  main.swift
//  Example
//
//  Created by Peter Entwistle on 06/08/2015.
//  Copyright © 2015 Peter Entwistle. All rights reserved.
//

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