//
//  ViewController.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 03.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var viewModel = ViewModel()
    private var measurementsTableView = UITableView()
    private var alertController = UIAlertController()
    var currentCount = ""
    
//    @IBOutlet weak var countLabel: UILabel!
//    @IBOutlet weak var twiceLabel: UILabel!
//    @IBOutlet weak var dropLabel: UILabel!
    @IBOutlet weak var deviceTimeLabel: UILabel!
    @IBOutlet weak var bleImageView: UIImageView!
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
    @IBOutlet weak var tableButton: UIButton!
    //    @IBAction func readButton(_ sender: Any) {
//        viewModel.bluetoothManager.settingsClass.writeCURRENT_NODE_READ(bluetoothManager: viewModel.bluetoothManager)
//        DispatchQueue.main.async {
//            self.countLabel.text = "--"
//            self.twiceLabel.text = "--"
//            self.dropLabel.text = "--"
//        }
//    }
    
//    @objc func setCount(notification: Notification) {
//        DispatchQueue.main.async {
//            if let value = notification.userInfo?["value"] as? UInt16 {
//                if self.currentCount == "" {
//                    self.currentCount = String(value)
//                } else {
//                    if (Int(self.currentCount)! + 1) != Int(value) {
//                        self.dropLabel.text = String((Int(self.currentCount)! + 1))
//                    }
//                    if self.currentCount == String(value) {
//                        self.twiceLabel.text = self.currentCount
//                    } else {
//                        self.currentCount = String(value)
//                    }
//                }
//                self.countLabel.text = String(value)
//            }
//        }
//    }
    
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
    
    @objc func getSpeed() {
        DispatchQueue.main.async {
            self.speedLabel.text = String(format:"%.1f", self.viewModel.bluetoothManager.speed)
        }
    }
    
    @objc func getSpeed2() {
        DispatchQueue.main.async {
            self.speed2Label.text = String(format:"%.1f", self.viewModel.bluetoothManager.speed2)
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
        NotificationCenter.default.addObserver(self, selector: #selector(self.getSpeed), name: NSNotification.Name(rawValue: "getSpeed"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getSpeed2), name: NSNotification.Name(rawValue: "getSpeed2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getTns), name: NSNotification.Name(rawValue: "getTns"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.stopInd), name: NSNotification.Name(rawValue: "stopInd"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.startInd), name: NSNotification.Name(rawValue: "startInd"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.readButtonNotHidden), name: NSNotification.Name(rawValue: "readButtonNotHidden"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.readButtonHidden), name: NSNotification.Name(rawValue: "readButtonHidden"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.setCount), name: NSNotification.Name(rawValue: "value"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.daysMeasurementTableViewLoad), name: NSNotification.Name(rawValue: "daysMeasurementTableViewLoad"), object: nil)
        ind.isHidden = true
        readButton.isHidden = true
        viewModel.readTimer()
        deviceTimeLabel.text = "--"
        bleImageView.image = UIImage(named: "ble_gray.png")
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
        print("deinit VC")
    }
}

