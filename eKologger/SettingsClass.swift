//
//  SettingsClass.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 04.09.2022.
//

import Foundation
import UIKit
import CoreBluetooth

class SettingsClass {
    
    func readTest(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == Test.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addTest(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == Test.characteristicUUID {
            bluetoothManager.test = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! [UInt8])
            print(bluetoothManager.test.count)
        }
    }
    
    func readDateTime(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == DateTime.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addDateTime(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == DateTime.characteristicUUID {
            bluetoothManager.dateTime = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! Int64)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getTime"), object: nil)
        }
    }
    
    func writeDateTime(bluetoothManager: BluetoothManager) {
        for characteristic in bluetoothManager.allCharacteristics {
            if characteristic.uuid == DateTime.characteristicUUID {
                bluetoothManager.successfulConnectPeripheral[0].writeValue(bluetoothManager.writeData.writeData(value: Date(), char: characteristic), for: characteristic, type: .withResponse)
                bluetoothManager.successfulConnectPeripheral[0].readValue(for: characteristic)
            }
        }
    }
    
    func readTemp(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == Temp.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addTemp(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == Temp.characteristicUUID {
            bluetoothManager.temp = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! Float)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getTemp"), object: nil)
        }
    }
    
    func readHum(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == Hum.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addHum(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == Hum.characteristicUUID {
            bluetoothManager.hum = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! Float)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getHum"), object: nil)
        }
    }
    
    func readPress(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == Press.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addPress(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == Press.characteristicUUID {
            bluetoothManager.press = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! Float)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getPress"), object: nil)
        }
    }
    
    func readTemp2(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == Temp2.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addTemp2(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == Temp2.characteristicUUID {
            bluetoothManager.temp2 = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! Float)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getTemp2"), object: nil)
        }
    }
    
    func readHum2(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == Hum2.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addHum2(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == Hum2.characteristicUUID {
            bluetoothManager.hum2 = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! Float)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getHum2"), object: nil)
        }
    }
    
    func readPress2(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == Press2.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addPress2(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == Press2.characteristicUUID {
            bluetoothManager.press2 = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! Float)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getPress2"), object: nil)
        }
    }
}
