//
//  CSVReader.swift
//  CSVReader
//
//  Created by Peter Entwistle on 06/03/2015.
//  Copyright (c) 2015 Peter Entwistle. All rights reserved.
//

import Foundation

public class CSVReader {
    
    private var _numberOfColumns: Int = 0
    private var _numberOfRows: Int = 0
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
    
    init(fileName: String) {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "csv")
        var csv = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        csv = csv.stringByReplacingOccurrencesOfString("\r", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        processLines(csv)
        _numberOfColumns = _lines[0].componentsSeparatedByString(",").count
        _numberOfRows = _lines.count - 1
        headers = _lines[0].componentsSeparatedByString(",")
        setRows()
        setColumns()
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
            let vals = _lines[i].componentsSeparatedByString(",")
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
