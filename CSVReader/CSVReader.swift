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
        let csv = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)!
        _lines = csv.componentsSeparatedByString("\n")
        _numberOfColumns = _lines?[0].componentsSeparatedByString(",").count ?? 0
        _numberOfRows = _lines?.count ?? 0
        headers = row(0)
    }
    
    public func row(rowId: Int) -> [String] {
        return _lines?[rowId].componentsSeparatedByString(",") ?? [""]
    }
    
    // To do
    public func column(columnId: Int) {
        
    }
    
}