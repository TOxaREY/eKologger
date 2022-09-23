//
//  ViewModel.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 04.09.2022.
//

import UIKit
import CoreBluetooth

class ViewModel {
    var bluetoothManager = BluetoothManager.instance
    var liveDataTimer = Timer()
    
    func readTimer() {
        liveDataTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
//            print("liveDataTimer")
            self.bluetoothManager.readLiveData.readCharLiveData(bluetoothManager: self.bluetoothManager)
        }
    }
}
