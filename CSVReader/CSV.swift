//
//  CSVReader.swift
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

import Foundation

public class CSV {
    let newLine: String = "\n"
    let csvData: String

    public let delimiter: String
    public var headers: [String]
    public var columns: [String: [String]]
    public var rows: [[String: String]]
    public var lines: [String]
    public var numberOfColumns: Int
    public var numberOfRows: Int

    // MARK: - Initialisers
    public init(with: String, delimiter: String = ",") {
        csvData = with.replacingOccurrences(of: "\r", with: "", options: NSString.CompareOptions.literal, range: nil)
        self.delimiter = delimiter
        headers = [String]()
        columns = [String: [String]]()
        rows = [[String: String]]()
        lines = [String]()
        numberOfColumns = 0
        numberOfRows = 0
        
        read()
    }

    public convenience init(path: String, delimiter: String = ",", encoding: String.Encoding = .utf8) throws {
        let contents = try String(contentsOfFile: path, encoding: encoding)
        self.init(with: contents, delimiter: delimiter)
    }
}
