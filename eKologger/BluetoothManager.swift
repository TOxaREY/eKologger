//
//  BluetoothManager.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 04.09.2022.
//

import Foundation
import CoreBluetooth
import UIKit

class BluetoothManager: NSObject {
    static let instance = BluetoothManager()
    
    var centralManager: CBCentralManager!
    
    let bluetoothManagerQueue = DispatchQueue(label: "bluetoothManager")
    
    func startBluetoothManager() {
        centralManager = CBCentralManager(delegate: self, queue: bluetoothManagerQueue)
    }
    
    func restartBluetoothManager() {
        centralManager.scanForPeripherals(withServices: nil)
        print("restartBluetoothManager")
    }
    var readData = ReadData()
    var writeData = WriteData()
    var settingsClass = SettingsClass()
    var readLiveData = ReadLiveData()
    var discoverPeripheral: [CBPeripheral] = []
    var successfulConnectPeripheral: [CBPeripheral] = []
    var successfulUiid: [String] = []
    var allCharacteristics: [CBCharacteristic] = []
    var dateTime: Int64 = 0
    var temp: Float = 0
    var hum: Float = 0
    var press: Float = 0
    var temp2: Float = 0
    var hum2: Float = 0
    var press2: Float = 0
    var test: [UInt8] = []
}

