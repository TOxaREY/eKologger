//
//  ViewController2.swift
//  eKologger
//
//  Created by Alexey Golovanov on 27.10.2022.
//

import UIKit

class ViewController2: UIViewController {
    
    var viewModel = ViewModel()
    
    var pick = Bool()

    @IBOutlet weak var ind: UIActivityIndicatorView!
    @IBOutlet weak var pickerDate: UIDatePicker!
    @IBAction func pickerDate(_ sender: Any) {
        viewModel.bluetoothManager.readDataFromDB.readMeasurementToMeasurementTable(db: viewModel.bluetoothManager.sqliteDB, date: pickerDate.date.dateToString, viewModel: viewModel)
    }
    
    @IBAction func deleteFromDB(_ sender: Any) {
        viewModel.bluetoothManager.deleteDataFromDB.deleteDataFromDB(db: viewModel.bluetoothManager.sqliteDB)
    }
    @objc func alert() {
        DispatchQueue.main.async {
            self.viewModel.notMeasureAlert.notMeasureAlert(vc: self)
        }
    }
    
    @objc func stopInd2() {
        DispatchQueue.main.async {
            self.ind.stopAnimating()
            self.ind.isHidden = true
        }
    }
    
    @objc func startInd2() {
        DispatchQueue.main.async {
            self.ind.startAnimating()
            self.ind.isHidden = false
        }
    }
    
    @objc func segue() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "segueTableVC", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ind.isHidden = true
        pick = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.alert), name: NSNotification.Name(rawValue: "alert"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.segue), name: NSNotification.Name(rawValue: "segue"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.stopInd2), name: NSNotification.Name(rawValue: "stopInd2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.startInd2), name: NSNotification.Name(rawValue: "startInd2"), object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if pick {
            pickerDate.setDate(pickerDate.date.addingTimeInterval(86400), animated: true)
        }
        pick = true
    }
    
    deinit {
        print("deinit VC2")
    }
}
