//
//  ViewController.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 03.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = ViewModel()
    
    @IBOutlet weak var deviceTimeLabel: UILabel!
    @IBOutlet weak var bleImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humLabel: UILabel!
    @IBOutlet weak var pressLabel: UILabel!
    @IBOutlet weak var temp2Label: UILabel!
    @IBOutlet weak var press2Label: UILabel!
    @IBOutlet weak var hum2Label: UILabel!
    @IBAction func syncButton(_ sender: Any) {
        viewModel.bluetoothManager.settingsClass.writeDateTime(bluetoothManager: viewModel.bluetoothManager)
    }
    
    @objc func connect() {
        DispatchQueue.main.async {
            self.bleImageView.image = UIImage(named: "ble_blue.png")
        }
    }
    
    @objc func disconnect() {
        DispatchQueue.main.async {
            self.deviceTimeLabel.text = "--"
            self.bleImageView.image = UIImage(named: "ble_gray.png")
        }
    }
    
    @objc func getTime() {
        DispatchQueue.main.async {
            self.deviceTimeLabel.text = self.viewModel.bluetoothManager.dateTime.datetimeToString
        }
    }
    
    @objc func getTemp() {
        DispatchQueue.main.async {
            self.tempLabel.text = String(format:"%.1f", self.viewModel.bluetoothManager.temp)
        }
    }
    
    @objc func getHum() {
        DispatchQueue.main.async {
            self.humLabel.text = String(format:"%.1f", self.viewModel.bluetoothManager.hum)
        }
    }
    
    @objc func getPress() {
        DispatchQueue.main.async {
            self.pressLabel.text = String(format:"%.1f", self.viewModel.bluetoothManager.press)
        }
    }
    
    @objc func getTemp2() {
        DispatchQueue.main.async {
            self.temp2Label.text = String(format:"%.1f", self.viewModel.bluetoothManager.temp2)
        }
    }
    
    @objc func getHum2() {
        DispatchQueue.main.async {
            self.hum2Label.text = String(format:"%.1f", self.viewModel.bluetoothManager.hum2)
        }
    }
    
    @objc func getPress2() {
        DispatchQueue.main.async {
            self.press2Label.text = String(format:"%.1f", self.viewModel.bluetoothManager.press2)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.connect), name: NSNotification.Name(rawValue: "connect"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.disconnect), name: NSNotification.Name(rawValue: "disconnect"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getTime), name: NSNotification.Name(rawValue: "getTime"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getTemp), name: NSNotification.Name(rawValue: "getTemp"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getHum), name: NSNotification.Name(rawValue: "getHum"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getPress), name: NSNotification.Name(rawValue: "getPress"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getTemp2), name: NSNotification.Name(rawValue: "getTemp2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getHum2), name: NSNotification.Name(rawValue: "getHum2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getPress2), name: NSNotification.Name(rawValue: "getPress2"), object: nil)
        viewModel.readTimer()
        deviceTimeLabel.text = "--"
        bleImageView.image = UIImage(named: "ble_gray.png")
    }
}

