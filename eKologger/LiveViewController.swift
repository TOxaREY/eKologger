//
//  LiveViewController.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 03.09.2022.
//

import UIKit

class LiveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var viewModel = ViewModel()
    private var measurementsTableView = UITableView()
    private var alertController = UIAlertController()
    var currentCount = ""
    
    @IBAction func connectButton(_ sender: Any) {
        if connected {
            offConnection = true
            viewModel.bluetoothManager.disconnectPeripheral()
        } else {
            viewModel.bluetoothManager.connectPeripheral()
        }
    }
    @IBOutlet weak var titleLabel: UINavigationItem!
    @IBOutlet weak var deviceTimeLabel: UILabel!
    @IBOutlet weak var bleImageView: UIImageView!
    @IBOutlet weak var batteryImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humLabel: UILabel!
    @IBOutlet weak var pressLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var temp2Label: UILabel!
    @IBOutlet weak var press2Label: UILabel!
    @IBOutlet weak var hum2Label: UILabel!
    @IBOutlet weak var speed2Label: UILabel!
    @IBOutlet weak var tnsLabel: UILabel!
    @IBAction func syncButton(_ sender: Any) {
        viewModel.bluetoothManager.settingsClass.writeDateTime(bluetoothManager: viewModel.bluetoothManager)
    }
    @IBOutlet weak var readButton: UIButton!
    @IBAction func readButton(_ sender: Any) {
        dateCountArray.removeAll()
        ind.isHidden = false
        ind.startAnimating()
        viewModel.bluetoothManager.settingsClass.writeNODES_DATE(bluetoothManager: viewModel.bluetoothManager)
    }
    @IBAction func settingButton(_ sender: Any) {
        if viewModel.bluetoothManager.enable_logging != nil && viewModel.bluetoothManager.logging_interval != nil && viewModel.bluetoothManager.display_sleep != nil && viewModel.bluetoothManager.heater_enabled1 != nil && viewModel.bluetoothManager.heater_enabled2 != nil {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "segueSettingsVC", sender: nil)
            }
        } else {
            viewModel.notSettingsAlert.notSettingsAlert(vc: self)
        }
    }
    
    @objc func connect() {
        DispatchQueue.main.async {
            self.bleImageView.image = UIImage(named: "ble_blue.png")
            self.batteryImageView.isHidden = false
        }
    }
    
    @objc func disconnect() {
        DispatchQueue.main.async {
            self.deviceTimeLabel.text = "--"
            self.bleImageView.image = UIImage(named: "ble_gray.png")
            self.batteryImageView.isHidden = true
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
    
    @objc func getSpeed() {
        DispatchQueue.main.async {
            self.speedLabel.text = String(format:"%.1f", self.viewModel.bluetoothManager.speed!)
        }
    }
    
    @objc func getSpeed2() {
        DispatchQueue.main.async {
            self.speed2Label.text = String(format:"%.1f", self.viewModel.bluetoothManager.speed2!)
        }
    }
    
    @objc func getTns() {
        DispatchQueue.main.async {
            self.tnsLabel.text = String(format:"%.1f", self.viewModel.bluetoothManager.tns)
        }
    }
    
    @objc func daysMeasurementTableViewLoad() {
        DispatchQueue.main.async {
            self.viewModel.daysMeasurementTableViewLoad.daysMeasurementTableViewLoad(vc: self, alertController: &self.alertController, measurementsTableView: &self.measurementsTableView)
        }
    }

    @IBOutlet weak var ind: UIActivityIndicatorView!
    
    @objc func stopInd() {
        DispatchQueue.main.async {
            self.ind.stopAnimating()
            self.ind.isHidden = true
        }
    }
    
    @objc func startInd() {
        DispatchQueue.main.async {
            self.ind.startAnimating()
            self.ind.isHidden = false
        }
    }
    
    @objc func readButtonNotHidden() {
        DispatchQueue.main.async {
            self.readButton.isHidden = false
        }
    }
    
    @objc func readButtonHidden() {
        DispatchQueue.main.async {
            self.readButton.isHidden = true
        }
    }
    
    @objc func batt() {
        DispatchQueue.main.async {
            if self.viewModel.bluetoothManager.powerState >> 0 & 1 == 1 {
                self.batteryImageView.image = UIImage(named: "charging")
            } else if self.viewModel.bluetoothManager.powerState >> 1 & 1 == 1 {
                self.batteryImageView.image = UIImage(named: "empty")
            } else if self.viewModel.bluetoothManager.powerState >> 2 & 1 == 1 {
                self.batteryImageView.image = UIImage(named: "low")
            } else if self.viewModel.bluetoothManager.powerState >> 3 & 1 == 1 {
                self.batteryImageView.image = UIImage(named: "full")
            } else {
                self.batteryImageView.image = UIImage(named: "chargingFull")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.title = "LIVE DATA"
        NotificationCenter.default.addObserver(self, selector: #selector(self.connect), name: NSNotification.Name(rawValue: "connect"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.disconnect), name: NSNotification.Name(rawValue: "disconnect"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.batt), name: NSNotification.Name(rawValue: "batt"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getTime), name: NSNotification.Name(rawValue: "getTime"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getTemp), name: NSNotification.Name(rawValue: "getTemp"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getHum), name: NSNotification.Name(rawValue: "getHum"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getPress), name: NSNotification.Name(rawValue: "getPress"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getTemp2), name: NSNotification.Name(rawValue: "getTemp2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getHum2), name: NSNotification.Name(rawValue: "getHum2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getPress2), name: NSNotification.Name(rawValue: "getPress2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getSpeed), name: NSNotification.Name(rawValue: "getSpeed"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getSpeed2), name: NSNotification.Name(rawValue: "getSpeed2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getTns), name: NSNotification.Name(rawValue: "getTns"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.stopInd), name: NSNotification.Name(rawValue: "stopInd"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.startInd), name: NSNotification.Name(rawValue: "startInd"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.readButtonNotHidden), name: NSNotification.Name(rawValue: "readButtonNotHidden"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.readButtonHidden), name: NSNotification.Name(rawValue: "readButtonHidden"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.daysMeasurementTableViewLoad), name: NSNotification.Name(rawValue: "daysMeasurementTableViewLoad"), object: nil)
        ind.isHidden = true
        readButton.isHidden = true
        viewModel.readTimer()
        deviceTimeLabel.text = "--"
        bleImageView.image = UIImage(named: "ble_gray.png")
        batteryImageView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsDaysMeasurement(tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.cellRowDaysMeasurement(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAtDaysMeasurement(indexPath: indexPath, alertController: alertController, vc: self)
    }
    
    deinit {
        print("deinit LiveViewController")
    }
}

