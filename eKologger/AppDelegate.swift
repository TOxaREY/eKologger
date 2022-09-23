//
//  AppDelegate.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 03.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
var viewModel = ViewModel()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        viewModel.bluetoothManager.startBluetoothManager()
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        viewModel.bluetoothManager.restartBluetoothManager()
    }

}

