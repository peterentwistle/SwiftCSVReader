//
//  CSV+Parse.swift
//  CSVReader
//
//  Created by Peter Entwistle on 01/08/2017.
//  Copyright © 2017 Peter Entwistle. All rights reserved.
//

extension CSV: Readable {

    func read() {
        processLines(csvData)
        numberOfColumns = lines[0].components(separatedBy: delimiter).count
        numberOfRows = lines.count - 1
        headers = lines[0].components(separatedBy: delimiter)
        setRows()
        setColumns()
    }
    
    fileprivate func processLines(_ csv: String) {
        lines = csv.components(separatedBy: "\n")
        // Remove blank lines
        var i = 0
        for line in lines {
            if line.isEmpty {
                lines.remove(at: i)
                i -= 1
            }
            i += 1
        }
    }
    
    fileprivate func setRows() {
        var rows = [[String: String]]()
        for i in 1...numberOfRows {
            var row = [String: String]()
            let vals = lines[i].components(separatedBy: delimiter)
            var i = 0
            for header in headers {
                row[header] = vals[i]
                i+=1
            }
            rows.append(row)
        }
        self.rows = rows
    }
    
    fileprivate func setColumns() {
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
