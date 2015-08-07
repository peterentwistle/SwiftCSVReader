//  CSVReader.swift
//
//  Copyright (c) 2015 Peter Entwistle
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

import Foundation

public class CSVReader {
    
    private var _numberOfColumns: Int = 0
    private var _numberOfRows: Int = 0
    private var _delimiter: String
    private var _lines = [String]()
    public var headers = [String]()
    public var columns = [String: [String]]()
    public var rows = [[String: String]]()
    
    public var numberOfColumns: Int {
        get {
            return _numberOfColumns
        }
    }
    
    public var numberOfRows: Int {
        get {
            return _numberOfRows
        }
    }
    
    public init(fileName: String, delimiter: String) {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "csv")
        var csv = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        csv = csv.stringByReplacingOccurrencesOfString("\r", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        _delimiter = delimiter
        processLines(csv)
        _numberOfColumns = _lines[0].componentsSeparatedByString(_delimiter).count
        _numberOfRows = _lines.count - 1
        headers = _lines[0].componentsSeparatedByString(_delimiter)
        setRows()
        setColumns()
    }
    
    public convenience init(fileName: String) {
        self.init(fileName: fileName, delimiter: ",")
    }
    
    private func processLines(csv: String) {
        _lines = csv.componentsSeparatedByString("\n")
        // Remove blank lines
        var i = 0
        for line in _lines {
            if line.isEmpty {
                _lines.removeAtIndex(i--)
            }
            i++
        }
    }
    
    private func setRows() {
        var rows = [[String: String]]()
        for i in 1..._numberOfRows {
            var row = [String: String]()
            let vals = _lines[i].componentsSeparatedByString(_delimiter)
            var i = 0
            for header in headers {
                row[header] = vals[i++]
            }
            rows.append(row)
        }
        self.rows = rows
    }
    
    private func setColumns() {
        var columns = [String: [String]]()
        for header in headers {
            var colValue = [String]()
            for row in rows {
                colValue.append(row[header]!)
            }
            columns[header] = colValue
        }
        self.columns = columns
    }
    
}
