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
            default:
                return UInt32((value as! UInt32)).data
            }
        }
}

