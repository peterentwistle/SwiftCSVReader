//
//  CSVReaderTests.swift
//
//  Copyright (c) 2016 Peter Entwistle
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import XCTest
@testable import CSVReader

class CSVReaderTests: XCTestCase {
    
    var csvReader: CSVReader!
    let csvData = "name,price\n" +
                  "water,1.29\n" +
                  "coffee,1.99\n" +
                  "tea,1.89\n" +
                  "orange,1.49\n"
    
    override func setUp() {
        super.setUp()
        csvReader = CSVReader(with: csvData)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCSVHasCorrectNumberOfRows() {
        XCTAssert(csvReader.numberOfRows == 4)
    }
    
    func testCSVHasCorrectNumberOfColumns() {
        XCTAssert(csvReader.numberOfColumns == 2)
    }
    
    func testFirstRowHasCorrectValue() {
        print(csvReader.rows[0])
        XCTAssert(csvReader.rows[0] == ["name":"water", "price":"1.29"])
    }
    
    func testHeadersAreCorrect() {
        XCTAssertTrue(csvReader.headers == ["name","price"])
    }
    
    func testRowValuesForNameHasCorrectValue() {
        XCTAssertTrue(csvReader.rows[0]["name"] == "water")
        XCTAssertTrue(csvReader.rows[1]["name"] == "coffee")
        XCTAssertTrue(csvReader.rows[2]["name"] == "tea")
        XCTAssertTrue(csvReader.rows[3]["name"] == "orange")
    }

    func testRowValuesForPriceHasCorrectValue() {
        XCTAssertTrue(csvReader.rows[0]["price"] == "1.29")
        XCTAssertTrue(csvReader.rows[1]["price"] == "1.99")
        XCTAssertTrue(csvReader.rows[2]["price"] == "1.89")
        XCTAssertTrue(csvReader.rows[3]["price"] == "1.49")
    }
    
    func testColumnValuesForName() {
        XCTAssertTrue(csvReader.columns["name"]! == ["water","coffee","tea","orange"])
    }
    
    func testColumnValuesForPrice() {
        XCTAssertTrue(csvReader.columns["price"]! == ["1.29","1.99","1.89","1.49"])
    }
}
