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
    private var _lines = [String]?()
    public var headers = [String]()
    
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
        var csv = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)!
        csv = csv.stringByReplacingOccurrencesOfString("\r", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        _lines = csv.componentsSeparatedByString("\n")
        _numberOfColumns = _lines?[0].componentsSeparatedByString(",").count ?? 0
        _numberOfRows = _lines?.count ?? 0
        headers = _lines?[0].componentsSeparatedByString(",") ?? [""]
    }
    
    public func row(rowId: Int) -> [String: String] {
        var row = [String: String]()
        let vals = _lines?[rowId].componentsSeparatedByString(",")
        var i = 0
        for header in headers {
            row[header] = vals?[i++]
        }
        return row
    }
    
    // To do
    public func column(columnId: Int) {
        
    }
    
}
