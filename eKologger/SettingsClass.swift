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
    
    func readSpeed(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == Speed.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addSpeed(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == Speed.characteristicUUID {
            bluetoothManager.speed = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! Float)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getSpeed"), object: nil)
        }
    }
    
    func writeSpeed(bluetoothManager: BluetoothManager, value: UInt8) {
        for characteristic in bluetoothManager.allCharacteristics {
            if characteristic.uuid == Speed.characteristicUUID {
                    bluetoothManager.successfulConnectPeripheral[0].writeValue(bluetoothManager.writeData.writeData(value: value, char: characteristic), for: characteristic, type: .withResponse)
            }
        }
    }
    
    func readSpeed2(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == Speed2.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addSpeed2(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == Speed2.characteristicUUID {
            bluetoothManager.speed2 = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! Float)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getSpeed2"), object: nil)
        }
    }
    
    func writeSpeed2(bluetoothManager: BluetoothManager, value: UInt8) {
        for characteristic in bluetoothManager.allCharacteristics {
            if characteristic.uuid == Speed2.characteristicUUID {
                    bluetoothManager.successfulConnectPeripheral[0].writeValue(bluetoothManager.writeData.writeData(value: value, char: characteristic), for: characteristic, type: .withResponse)
            }
        }
    }
    
    func readTns(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == Tns.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addTns(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == Tns.characteristicUUID {
            bluetoothManager.tns = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! Float)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getTns"), object: nil)
        }
    }
    
    func writeNODE_ACCESS_INDEX(bluetoothManager: BluetoothManager) {
        for characteristic in bluetoothManager.allCharacteristics {
            if characteristic.uuid == NODE_ACCESS_INDEX.characteristicUUID {
                for i in 1...250 {
                    bluetoothManager.successfulConnectPeripheral[0].writeValue(bluetoothManager.writeData.writeData(value: UInt32(i), char: characteristic), for: characteristic, type: .withResponse)
                    for characteristic in bluetoothManager.allCharacteristics {
                        if characteristic.uuid == CURRENT_NODE_READ.characteristicUUID {
                            print(i)
                            bluetoothManager.successfulConnectPeripheral[0].readValue(for: characteristic)
                        }
                    }
                }
            }
        }
    }
    
    func addCURRENT_NODE_READ(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == CURRENT_NODE_READ.characteristicUUID {
            let arrayUInt8 = bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! [UInt8]
            bluetoothManager.insertDataToDB.insertMeasurement(db: bluetoothManager.sqliteDB, data: DataDB(dateTime: arraySlice(m: 4, n: 11, arrayIn: arrayUInt8).convertArrayToInt64, flagError: arraySlice(m: 12, n: 15, arrayIn: arrayUInt8).convertArrayToInt32, tempAir: arraySlice(m: 25, n: 28, arrayIn: arrayUInt8).convertArrayToFloat, hum: arraySlice(m: 29, n: 32, arrayIn: arrayUInt8).convertArrayToFloat, dewPoint: arraySlice(m: 33, n: 36, arrayIn: arrayUInt8).convertArrayToFloat, tempWetBall: arraySlice(m: 37, n: 40, arrayIn: arrayUInt8).convertArrayToFloat, windSpeed: arraySlice(m: 41, n: 44, arrayIn: arrayUInt8).convertArrayToFloat, tempBlackBall: arraySlice(m: 45, n: 48, arrayIn: arrayUInt8).convertArrayToFloat, tnsWithoutSun: arraySlice(m: 49, n: 52, arrayIn: arrayUInt8).convertArrayToFloat, tnsWithSun: arraySlice(m: 53, n: 56, arrayIn: arrayUInt8).convertArrayToFloat, tempRadio: arraySlice(m: 57, n: 60, arrayIn: arrayUInt8).convertArrayToFloat, density: arraySlice(m: 61, n: 64, arrayIn: arrayUInt8).convertArrayToFloat, pressure: arraySlice(m: 65, n: 68, arrayIn: arrayUInt8).convertArrayToFloat, tempResult: arraySlice(m: 69, n: 72, arrayIn: arrayUInt8).convertArrayToFloat, flagChange: arraySlice(m: 81, n: 84, arrayIn: arrayUInt8).convertArrayToInt32, dateTime2: arraySlice(m: 89, n: 96, arrayIn: arrayUInt8).convertArrayToInt64, flagError2: arraySlice(m: 97, n: 100, arrayIn: arrayUInt8).convertArrayToInt32, tempAir2: arraySlice(m: 110, n: 113, arrayIn: arrayUInt8).convertArrayToFloat, hum2: arraySlice(m: 114, n: 117, arrayIn: arrayUInt8).convertArrayToFloat, dewPoint2: arraySlice(m: 118, n: 121, arrayIn: arrayUInt8).convertArrayToFloat, tempWetBall2: arraySlice(m: 122, n: 125, arrayIn: arrayUInt8).convertArrayToFloat, windSpeed2: arraySlice(m: 126, n: 129, arrayIn: arrayUInt8).convertArrayToFloat, tempBlackBall2: arraySlice(m: 130, n: 133, arrayIn: arrayUInt8).convertArrayToFloat, tnsWithoutSun2: arraySlice(m: 134, n: 137, arrayIn: arrayUInt8).convertArrayToFloat, tnsWithSun2: arraySlice(m: 138, n: 141, arrayIn: arrayUInt8).convertArrayToFloat, tempRadio2: arraySlice(m: 142, n: 145, arrayIn: arrayUInt8).convertArrayToFloat, density2: arraySlice(m: 146, n: 149, arrayIn: arrayUInt8).convertArrayToFloat, pressure2: arraySlice(m: 150, n: 153, arrayIn: arrayUInt8).convertArrayToFloat, tempResult2: arraySlice(m: 154, n: 157, arrayIn: arrayUInt8).convertArrayToFloat, flagChange2: arraySlice(m: 166, n: 169, arrayIn: arrayUInt8).convertArrayToInt32))

            iterCount -= 1
            processingCount += 1
        }
    }
    
    func writeCURRENT_NODE_READ(bluetoothManager: BluetoothManager, value: Int64) {
        for characteristic in bluetoothManager.allCharacteristics {
            if characteristic.uuid == CURRENT_NODE_READ.characteristicUUID {
                    bluetoothManager.successfulConnectPeripheral[0].writeValue(bluetoothManager.writeData.writeData(value: value, char: characteristic), for: characteristic, type: .withResponse)
            }
        }
    }
    
    func addNODES_DATE(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == NODES_DATE.characteristicUUID {
            let arrayUInt8 = bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! [UInt8]
            if arrayUInt8 != [0,0,0,0,0,0,0,0,0,0,0,0] {
                dateCountArray.append(DateCount(date: arraySlice(m: 0, n: 7, arrayIn: arrayUInt8).convertArrayToInt64, count: arraySlice(m: 8, n: 11, arrayIn: arrayUInt8).convertArrayToInt32))
            } else {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stopInd"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "daysMeasurementTableViewLoad"), object: nil)
            }
        }
    }
    
    func writeNODES_DATE(bluetoothManager: BluetoothManager) {
        for characteristic in bluetoothManager.allCharacteristics {
            if characteristic.uuid == NODES_DATE.characteristicUUID {
                    bluetoothManager.successfulConnectPeripheral[0].writeValue(bluetoothManager.writeData.writeData(value: UInt8(1), char: characteristic), for: characteristic, type: .withResponse)
            }
        }
    }
    
//    func readENABLE_LOGGING(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
//        if characteristic.uuid == ENABLE_LOGGING.characteristicUUID {
//            peripheral.readValue(for: characteristic)
//        }
//    }
//
//    func addENABLE_LOGGING(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
//        if characteristic.uuid == ENABLE_LOGGING.characteristicUUID {
//            bluetoothManager.enable_logging = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! UInt8)
//        }
//    }
//
//    func writeENABLE_LOGGING(bluetoothManager: BluetoothManager, value: UInt8) {
//        for characteristic in bluetoothManager.allCharacteristics {
//            if characteristic.uuid == ENABLE_LOGGING.characteristicUUID {
//                    bluetoothManager.successfulConnectPeripheral[0].writeValue(bluetoothManager.writeData.writeData(value: value, char: characteristic), for: characteristic, type: .withResponse)
//            }
//        }
//    }
    
//    func readLOGGING_INTERVAL(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
//        if characteristic.uuid == LOGGING_INTERVAL.characteristicUUID {
//            peripheral.readValue(for: characteristic)
//        }
//    }
//
//    func addLOGGING_INTERVAL(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
//        if characteristic.uuid == LOGGING_INTERVAL.characteristicUUID {
//            bluetoothManager.logging_interval = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! UInt32)
//        }
//    }
//
//    func writeLOGGING_INTERVAL(bluetoothManager: BluetoothManager, value: UInt32) {
//        for characteristic in bluetoothManager.allCharacteristics {
//            if characteristic.uuid == LOGGING_INTERVAL.characteristicUUID {
//                    bluetoothManager.successfulConnectPeripheral[0].writeValue(bluetoothManager.writeData.writeData(value: value, char: characteristic), for: characteristic, type: .withResponse)
//            }
//        }
//    }
    
    func writePERSISTENT_NODE_COUNT(bluetoothManager: BluetoothManager) {
        for characteristic in bluetoothManager.allCharacteristics {
            if characteristic.uuid == PERSISTENT_NODE_COUNT.characteristicUUID {
                    bluetoothManager.successfulConnectPeripheral[0].writeValue(bluetoothManager.writeData.writeData(value: UInt8(0), char: characteristic), for: characteristic, type: .withResponse)
            }
        }
    }
    
//    func readDISPLAY_SLEEP(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
//        if characteristic.uuid == DISPLAY_SLEEP.characteristicUUID {
//            peripheral.readValue(for: characteristic)
//        }
//    }
//
//    func addDISPLAY_SLEEP(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
//        if characteristic.uuid == DISPLAY_SLEEP.characteristicUUID {
//            bluetoothManager.display_sleep = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! UInt8)
//        }
//    }
//
//    func writeDISPLAY_SLEEP(bluetoothManager: BluetoothManager, value: UInt8) {
//        for characteristic in bluetoothManager.allCharacteristics {
//            if characteristic.uuid == DISPLAY_SLEEP.characteristicUUID {
//                    bluetoothManager.successfulConnectPeripheral[0].writeValue(bluetoothManager.writeData.writeData(value: value, char: characteristic), for: characteristic, type: .withResponse)
//            }
//        }
//    }
    
    func readManufacturerNameString(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == ManufacturerNameString.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addManufacturerNameString(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == ManufacturerNameString.characteristicUUID {
            bluetoothManager.manufacturerNameString = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! String)
        }
    }
    
    func readSerialNumberString(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == SerialNumberString.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addSerialNumberString(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == SerialNumberString.characteristicUUID {
            bluetoothManager.serialNumberString = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! String)
        }
    }
    
    func readFirmwareRevisionString(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == FirmwareRevisionString.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addFirmwareRevisionString(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == FirmwareRevisionString.characteristicUUID {
            bluetoothManager.firmwareRevisionString = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! String)
        }
    }
    
    func readModelNumberString(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
        if characteristic.uuid == ModelNumberString.characteristicUUID {
            peripheral.readValue(for: characteristic)
        }
    }
    
    func addModelNumberString(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == ModelNumberString.characteristicUUID {
            bluetoothManager.modelNumberString = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! String)
        }
    }
    
    func addPOWER_STATE(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
        if characteristic.uuid == POWER_STATE.characteristicUUID {
            bluetoothManager.powerState = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! [UInt8]).last!
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "batt"), object: nil)
        }
    }
    
        func readDEVICE_WORKMODE(characteristic: CBCharacteristic, peripheral: CBPeripheral) {
            if characteristic.uuid == DEVICE_WORKMODE.characteristicUUID {
                peripheral.readValue(for: characteristic)
            }
        }
    
        func addDEVICE_WORKMODE(characteristic: CBCharacteristic, peripheral: CBPeripheral, bluetoothManager: BluetoothManager, valueCharacterictic: Data) {
            if characteristic.uuid == DEVICE_WORKMODE.characteristicUUID {
                bluetoothManager.device_workmode = (bluetoothManager.readData.readData(data: valueCharacterictic, char: characteristic, per: peripheral, bluetoothManager: bluetoothManager) as! UInt32)
                bluetoothManager.enable_logging = deviceWorkmodeRead(setting: bluetoothManager.device_workmode!).log_enabl
                bluetoothManager.logging_interval = deviceWorkmodeRead(setting: bluetoothManager.device_workmode!).log_inter
                bluetoothManager.display_sleep = deviceWorkmodeRead(setting: bluetoothManager.device_workmode!).dis_sle
                bluetoothManager.heater_enabled1 = deviceWorkmodeRead(setting: bluetoothManager.device_workmode!).heat_enabl1
                bluetoothManager.heater_enabled2 = deviceWorkmodeRead(setting: bluetoothManager.device_workmode!).heat_enabl2
            }
        }
    
        func writeDEVICE_WORKMODE(bluetoothManager: BluetoothManager) {
            for characteristic in bluetoothManager.allCharacteristics {
                if characteristic.uuid == DEVICE_WORKMODE.characteristicUUID {
                    bluetoothManager.successfulConnectPeripheral[0].writeValue(bluetoothManager.writeData.writeData(value: deviceWorkmodeWrite(logging_enabled: bluetoothManager.enable_logging!, loggging_interval: bluetoothManager.logging_interval!, display_sleep: bluetoothManager.display_sleep!, heater_enabled1: bluetoothManager.heater_enabled1!, heater_enabled2: bluetoothManager.heater_enabled2!), char: characteristic), for: characteristic, type: .withResponse)
                }
            }
        }

    private func arraySlice(m: Int, n: Int, arrayIn: [UInt8]) -> [UInt8] {
        return [UInt8](arrayIn[m...n])
    }
    
    private func pad(string : String, toSize: Int) -> String {
        var padded = string
        for _ in 0..<(toSize - string.count) {
            padded = "0" + padded
        }
        return padded
    }
    
    private func deviceWorkmodeRead(setting: UInt32) -> (log_enabl: Int, log_inter: Int, dis_sle: Int, heat_enabl1: Int, heat_enabl2: Int) {
        let b: String = pad(string: String(setting, radix: 2), toSize: 32)
        let logging_enabled = Int(String(b.last!))!
        let start = b.index(b.startIndex, offsetBy: 3)
        let end = b.index(b.endIndex, offsetBy: -1)
        let range = start..<end
        let substring = b[range]
        let loggging_interval = Int(String(substring), radix: 2)!
        let display_sleep = Int(String(Array(b)[2]))!
        let heater_enabled1 = Int(String(Array(b)[1]))!
        let heater_enabled2 = Int(String(Array(b)[0]))!
        
        return (logging_enabled, loggging_interval, display_sleep, heater_enabled1, heater_enabled2)
    }
    
    private func deviceWorkmodeWrite(logging_enabled: Int, loggging_interval: Int, display_sleep: Int, heater_enabled1: Int, heater_enabled2: Int) -> UInt32 {
        var uint32String = ""
        uint32String.append(String(heater_enabled2))
        uint32String.append(String(heater_enabled1))
        uint32String.append(String(display_sleep))
        uint32String.append(pad(string: String(loggging_interval, radix: 2), toSize: 28))
        uint32String.append(String(logging_enabled))
        
        return UInt32(strtoul(uint32String, nil, 2))
    }
}
