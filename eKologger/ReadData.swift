//
//  ReadData.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 04.09.2022.
//

import UIKit
import CoreBluetooth


class ReadData {
    
    @discardableResult func readData(data: Data, char: CBCharacteristic, per: CBPeripheral, bluetoothManager: BluetoothManager) -> Any? {
        switch char.characteristicDescriptionReadWriteMetods(characteris: char)!.read {
        case "datetime":
            return data.datetime
        case "float":
            return data.float
        case "array":
            return data.array
        case "uint32":
            return data.uint32
        case "uint8":
            return data.uint8
        case "string":
            return data.string
        default:
            break
        }
        return nil
    }
}

