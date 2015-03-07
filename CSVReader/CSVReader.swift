//
//  CSVReader.swift
//  CSVReader
//
//  Created by Peter Entwistle on 06/03/2015.
//  Copyright (c) 2015 Peter Entwistle. All rights reserved.
//

import Foundation

public class CSVReader {
    
    private var _numberOfColumns: Int
    private var _numberOfRows: Int
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
            return _numberOfRows - 1
        }
    }
    
    init(fileName: String) {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "csv")
        var csv = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)!
        csv = csv.stringByReplacingOccurrencesOfString("\r", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        _lines = csv.componentsSeparatedByString("\n")
        _numberOfColumns = _lines[0].componentsSeparatedByString(",").count
        _numberOfRows = _lines.count
        headers = _lines[0].componentsSeparatedByString(",")
        setRows()
        setColumns()
    }
    
    private func setRows() {
        var rows = [[String: String]]()
        for i in 1..<_numberOfRows {
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
