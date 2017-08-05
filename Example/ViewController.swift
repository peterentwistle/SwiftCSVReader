//
//  ViewController.swift
//  Example
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

import Cocoa
import CSVReader

class ViewController: NSViewController {

    @IBOutlet weak var headers: NSTextField!
    @IBOutlet weak var row1: NSTextField!
    @IBOutlet weak var row2Name: NSTextField!
    @IBOutlet weak var row2price: NSTextField!
    @IBOutlet weak var columnsName: NSTextField!
    @IBOutlet weak var columnsPrice: NSTextField!
    @IBOutlet weak var numColumns: NSTextField!
    @IBOutlet weak var numRows: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let path = Bundle.main.path(forResource: "test", ofType: "csv")

        let csv = try! CSV(path: path!)
        
        //headers.stringValue = headers.stringValue.replacingOccurrences(of: "(value)", with: csv.headers.description)
        replaceStringValue(textField: headers, value: csv.headers.description)
        replaceStringValue(textField: row1, value: csv.rows[0].description)
        replaceStringValue(textField: row2Name, value: csv.rows[1]["name"]!.description)
        replaceStringValue(textField: row2price, value: csv.rows[1]["price"]!.description)
        replaceStringValue(textField: columnsName, value: csv.columns["name"]!.description)
        replaceStringValue(textField: columnsPrice, value: csv.columns["price"]!.description)
        replaceStringValue(textField: numColumns, value: csv.numberOfColumns.description)
        replaceStringValue(textField: numRows, value: csv.numberOfRows.description)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func replaceStringValue(textField: NSTextField, value: String) {
        textField.stringValue = textField.stringValue.replacingOccurrences(of: "(value)", with: value)
    }

}
