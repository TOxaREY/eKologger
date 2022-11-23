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
    var sqliteDB = SQLiteDB.sharedInstance
    var insertDataToDB = InsertDataToDB()
    var readDataFromDB = ReadDataFromDB()
    var deleteDataFromDB = DeleteDataFromDB()
    
    var centralManager: CBCentralManager!
    
    let bluetoothManagerQueue = DispatchQueue(label: "bluetoothManager")
    
    func startBluetoothManager() {
        centralManager = CBCentralManager(delegate: self, queue: bluetoothManagerQueue)
    }
    
    func disconnectPeripheral() {
        if successfulConnectPeripheral != [] {
            for peripheral in successfulConnectPeripheral {
                centralManager.cancelPeripheralConnection(peripheral)
            }
        }
    }
    
    func connectPeripheral() {
        centralManager.scanForPeripherals(withServices: nil)
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
    var speed: Float? = nil
    var speed2: Float? = nil
    var tns: Float = 0
    var powerState: UInt8 = 0
    var enable_logging: Int? = nil
    var logging_interval: Int? = nil
    var display_sleep: Int? = nil
    var heater_enabled1: Int? = nil
    var heater_enabled2: Int? = nil
    var manufacturerNameString = ""
    var serialNumberString = ""
    var firmwareRevisionString = ""
    var modelNumberString = ""
    var device_workmode: UInt32? = nil
}

