//
//  ReadLiveData.swift
//  eKolloger
//
//  Created by Alexey Golovanov on 05.09.2022.
//

import UIKit
import CoreBluetooth

class ReadLiveData {
    
    func readCharLiveData(bluetoothManager: BluetoothManager) {
        if bluetoothManager.successfulConnectPeripheral.count != 0 {
            if bluetoothManager.allCharacteristics.count == 0 {return}
            let peripheral = bluetoothManager.successfulConnectPeripheral[0]
            for characteristic in bluetoothManager.allCharacteristics {
                if characteristic.uuid == DateTime.characteristicUUID {
                    peripheral.readValue(for: characteristic)
                }
            }
        }
    }
}
