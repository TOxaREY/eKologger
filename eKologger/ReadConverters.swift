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
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            return dateFormatter.string(from: Date(timeIntervalSince1970: (millisecFrom1970To2000 + Double(self)) / 1000))
        }
    }
    
    var dateToString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            return dateFormatter.string(from: Date(timeIntervalSince1970: (millisecFrom1970To2000 + Double(self)) / 1000))
        }
    }
}

extension Int {
    
    var datetimeToString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            return dateFormatter.string(from: Date(timeIntervalSince1970: (millisecFrom1970To2000 + Double(self)) / 1000))
        }
    }
    
    var dateToString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            return dateFormatter.string(from: Date(timeIntervalSince1970: (millisecFrom1970To2000 + Double(self)) / 1000))
        }
    }
}

extension Date {
    
    var dateToString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            return dateFormatter.string(from: self)
        }
    }
}

extension Array {
    
    var convertArrayToUInt16: UInt16 {
        get {
            assert(self.count * MemoryLayout<UInt8>.stride >= MemoryLayout<UInt16>.size)
            let uint16 = self.withUnsafeBytes({$0.load(as: UInt16.self)})
            return uint16
        }
    }
    
    var convertArrayToInt64: Int64 {
        get {
            assert(self.count * MemoryLayout<UInt8>.stride >= MemoryLayout<Int64>.size)
            let int64 = self.withUnsafeBytes({$0.load(as: Int64.self)})
            return int64
        }
    }
    
    var convertArrayToInt32: Int32 {
        get {
            assert(self.count * MemoryLayout<UInt8>.stride >= MemoryLayout<Int32>.size)
            let int32 = self.withUnsafeBytes({$0.load(as: Int32.self)})
            return int32
        }
    }
    
    var convertArrayToFloat: Float {
        get {
            assert(self.count * MemoryLayout<UInt8>.stride >= MemoryLayout<Float>.size)
            let float = self.withUnsafeBytes({$0.load(as: Float.self)})
            return float
        }
    }
}

extension String {
    
    var nameStringEKolloger: Bool {
        get {
            let range = NSRange(location: 0, length: self.utf16.count)
            let regex = try! NSRegularExpression(pattern: "eKologger")
            if regex.firstMatch(in: self, options: [], range: range) != nil {
                return true
            } else {
                return false
            }
        }
    }
}




