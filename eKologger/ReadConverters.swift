//
//  ReadConverters.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 04.09.2022.
//

import Foundation

let millisecFrom1970To2000: Double = 946674000000

extension Data {
    
    var datetime: Int64 {
        get {
            let int64 = self.withUnsafeBytes {$0.load(as: Int64.self)}
            return int64
        }
    }
    
    var float: Float {
            get {
                return Float(bitPattern: UInt32(littleEndian: self.withUnsafeBytes {$0.load(as: UInt32.self)}))
            }
        }
    
    var array: [UInt8] { return Array(self) }
}

extension Int64 {
    
    var datetimeToString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            return dateFormatter.string(from: Date(timeIntervalSince1970: (millisecFrom1970To2000 + Double(self)) / 1000))
        }
    }
}

