//
//  CSV+Read.swift
//  CSVReader
//
//  Copyright © 2017 Peter Entwistle. All rights reserved.
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
                if let value = row[header] {
                    colValue.append(value)
                }
            }
            columns[header] = colValue
        }
        self.columns = columns
    }

}
