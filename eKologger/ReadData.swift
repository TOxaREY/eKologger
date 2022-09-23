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
        default:
            break
        }
        return nil
    }
}

