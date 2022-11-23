//
//  WriteConverters.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 04.09.2022.
//

import Foundation

extension UInt32 {
    
    var data: Data {
        var uint32 = self
        return Data(bytes: &uint32, count: MemoryLayout<UInt32>.size)
    }
    
    var arrayUInt8: [UInt8] {
        return Array(withUnsafePointer(to: self.littleEndian) {
            $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout<UInt32>.size) {
                UnsafeBufferPointer(start: $0, count: MemoryLayout<UInt32>.size)
            }
        })
   }
}

extension Int64 {
    
    var data: Data {
        var int64 = self
        return Data(bytes: &int64, count: MemoryLayout<Int64>.size)
    }
}

extension Float {
    
    var data: Data {
        var float = self
        return Data(bytes: &float, count: MemoryLayout<Float>.size)
    }
}

extension Date {
    
    var data: Data {
        let date = self
        var int64 = Int64(date.timeIntervalSince1970 * 1000 - millisecFrom1970To2000)
        return Data(bytes: &int64, count: MemoryLayout<Int64>.size)
    }
}

extension UInt8 {
    
    var data: Data {
        var uint8 = self
        return Data(bytes: &uint8, count: MemoryLayout<UInt8>.size)
    }
}

