//
//  Writable.swift
//  CSVReader
//
//  Created by Peter Entwistle on 05/08/2017.
//  Copyright © 2017 Peter Entwistle. All rights reserved.
//

protocol Writable {
    func write(url: URL, delimiter: String, atomically: Bool, encoding: String.Encoding)
}
