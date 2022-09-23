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
}

extension Date {
    
    var data: Data {
        let date = self
        var int64 = Int64(date.timeIntervalSince1970 * 1000 - millisecFrom1970To2000)
        return Data(bytes: &int64, count: MemoryLayout<Int64>.size)
    }
}
