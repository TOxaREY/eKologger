//
//  BluetoothConnect.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 04.09.2022.
//

import Foundation
import CoreBluetooth
import UIKit

extension BluetoothManager: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("central.state is .unknown")
        case .resetting:
            print("central.state is .resetting")
        case .unsupported:
            print("central.state is .unsupported")
        case .unauthorized:
            print("central.state is .unauthorized")
        case .poweredOff:
            print("central.state is .poweredOff")
        case .poweredOn:
            print("central.state is .poweredOn")
            centralManager.scanForPeripherals(withServices: nil)
        @unknown default:
            print("fatalError")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi: NSNumber) {
        peripheral.delegate = self
        guard let nameString = peripheral.name else { return }
        
        
        if (nameString.nameStringEKolloger) && !discoverPeripheral.contains(peripheral) && !successfulConnectPeripheral.contains(peripheral) {
            discoverPeripheral.append(peripheral)
        }
        while discoverPeripheral.count != 0 {
            centralManager.connect(discoverPeripheral[0])
            allCharacteristics = []
            successfulConnectPeripheral.append(discoverPeripheral[0])
            successfulUiid.append(discoverPeripheral[0].identifier.uuidString)
            discoverPeripheral.remove(at: 0)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("connect \(peripheral.identifier)")
        peripheral.discoverServices(nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "connect"), object: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("disconnect \(peripheral.identifier)")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "disconnect"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "readButtonHidden"), object: nil)
        print(error ?? "нет описания")
        //Убираем жесткую ссылку на соединение чтобы начать рескан
        successfulConnectPeripheral = successfulConnectPeripheral.filter({$0 != peripheral})
        successfulUiid = successfulUiid.filter({$0 != peripheral.identifier.uuidString})
        allCharacteristics = []
        sleep(3)
        centralManager.scanForPeripherals(withServices: nil)
    }
}


extension BluetoothManager: CBPeripheralDelegate  {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
//        print("\(peripheral) service")
            guard  let services = peripheral.services else { return }
            for service in services {
                peripheral.discoverCharacteristics(nil, for: service)
            }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
//        print("сервис \(service) прочитан для перифериала \(peripheral.identifier.description)")
        guard let characteristics = service.characteristics else { return }
        for characteristic in characteristics {
            allCharacteristics.append(characteristic)
            settingsClass.readDateTime(characteristic: characteristic, peripheral: peripheral)
            if characteristic.uuid == Temp.characteristicUUID {
                peripheral.setNotifyValue(true, for: characteristic)
            }
//            settingsClass.readTemp(characteristic: characteristic, peripheral: peripheral)
            if characteristic.uuid == Hum.characteristicUUID {
                peripheral.setNotifyValue(true, for: characteristic)
            }
//            settingsClass.readHum(characteristic: characteristic, peripheral: peripheral)
            if characteristic.uuid == Press.characteristicUUID {
                peripheral.setNotifyValue(true, for: characteristic)
            }
//            settingsClass.readPress(characteristic: characteristic, peripheral: peripheral)
            if characteristic.uuid == Temp2.characteristicUUID {
                peripheral.setNotifyValue(true, for: characteristic)
            }
//            settingsClass.readTemp2(characteristic: characteristic, peripheral: peripheral)
            if characteristic.uuid == Hum2.characteristicUUID {
                peripheral.setNotifyValue(true, for: characteristic)
            }
//            settingsClass.readHum2(characteristic: characteristic, peripheral: peripheral)
            if characteristic.uuid == Press2.characteristicUUID {
                peripheral.setNotifyValue(true, for: characteristic)
            }
//            settingsClass.readPress2(characteristic: characteristic, peripheral: peripheral)
            if characteristic.uuid == Speed.characteristicUUID {
                peripheral.setNotifyValue(true, for: characteristic)
            }
//            settingsClass.readSpeed(characteristic: characteristic, peripheral: peripheral)
            if characteristic.uuid == Speed2.characteristicUUID {
                peripheral.setNotifyValue(true, for: characteristic)
            }
//            settingsClass.readSpeed2(characteristic: characteristic, peripheral: peripheral)
            if characteristic.uuid == Tns.characteristicUUID {
                peripheral.setNotifyValue(true, for: characteristic)
            }
//            settingsClass.readTns(characteristic: characteristic, peripheral: peripheral)
            if characteristic.uuid == CURRENT_NODE_READ.characteristicUUID {
                peripheral.setNotifyValue(true, for: characteristic)
            }
            
            if characteristic.uuid == NODES_DATE.characteristicUUID {
                peripheral.setNotifyValue(true, for: characteristic)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "readButtonNotHidden"), object: nil)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic,
                    error: Error?) {
//        print("характеристика \(characteristic.characteristicDescriptionReadWriteMetods(characteris: characteristic)!.descr) прочитана для перифериала \(peripheral.identifier.description)")
        guard let valueCharacterictic = characteristic.value else { return }
        settingsClass.addDateTime(characteristic: characteristic, peripheral: peripheral, bluetoothManager: self, valueCharacterictic: valueCharacterictic)
        settingsClass.addTemp(characteristic: characteristic, peripheral: peripheral, bluetoothManager: self, valueCharacterictic: valueCharacterictic)
        settingsClass.addHum(characteristic: characteristic, peripheral: peripheral, bluetoothManager: self, valueCharacterictic: valueCharacterictic)
        settingsClass.addPress(characteristic: characteristic, peripheral: peripheral, bluetoothManager: self, valueCharacterictic: valueCharacterictic)
        settingsClass.addTemp2(characteristic: characteristic, peripheral: peripheral, bluetoothManager: self, valueCharacterictic: valueCharacterictic)
        settingsClass.addHum2(characteristic: characteristic, peripheral: peripheral, bluetoothManager: self, valueCharacterictic: valueCharacterictic)
        settingsClass.addPress2(characteristic: characteristic, peripheral: peripheral, bluetoothManager: self, valueCharacterictic: valueCharacterictic)
        settingsClass.addSpeed(characteristic: characteristic, peripheral: peripheral, bluetoothManager: self, valueCharacterictic: valueCharacterictic)
        settingsClass.addSpeed2(characteristic: characteristic, peripheral: peripheral, bluetoothManager: self, valueCharacterictic: valueCharacterictic)
        settingsClass.addTns(characteristic: characteristic, peripheral: peripheral, bluetoothManager: self, valueCharacterictic: valueCharacterictic)
        settingsClass.addCURRENT_NODE_READ(characteristic: characteristic, peripheral: peripheral, bluetoothManager: self, valueCharacterictic: valueCharacterictic)
        settingsClass.addNODES_DATE(characteristic: characteristic, peripheral: peripheral, bluetoothManager: self, valueCharacterictic: valueCharacterictic)
    }
    
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
//            print("характеристика \(characteristic.characteristicDescriptionReadWriteMetods(characteris: characteristic)!.descr) записана для перифериала \(peripheral.identifier.description)")
    }
}

