//
//  WriteData.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 04.09.2022.
//

import UIKit
import CoreBluetooth


class WriteData {
    
        func writeData<T>(value: T, char: CBCharacteristic) -> Data {
            switch char.characteristicDescriptionReadWriteMetods(characteris: char)!.write {
            case "datetime":
                return (value as! Date).data
            case "uint32":
                return UInt32((value as! UInt32)).data
            case "uint8":
                return UInt8((value as! UInt8)).data
            case "int64":
                return Int64((value as! Int64)).data
            case "float":
                return Float((value as! Float)).data
            default:
                return UInt8((value as! UInt8)).data
            }
        }
}

