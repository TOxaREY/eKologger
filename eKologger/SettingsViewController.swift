//
//  SettingsViewController.swift
//  eKologger
//
//  Created by Alexey Golovanov on 28.10.2022.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    var viewModel = ViewModel()
    
    @IBOutlet weak var deviceInfo: UILabel!
    @IBOutlet weak var titleLabel: UINavigationItem!
    @IBOutlet weak var loggingSwitch: UISwitch!
    @IBAction func loggingSwitch(_ sender: Any) {
        if loggingSwitch.isOn {
            viewModel.bluetoothManager.enable_logging = 1
        } else {
            viewModel.bluetoothManager.enable_logging = 0
        }
        viewModel.bluetoothManager.settingsClass.writeDEVICE_WORKMODE(bluetoothManager: viewModel.bluetoothManager)
        viewModel.saveSettingsAlert.saveSettingsAlert(vc: self)
    }
    @IBOutlet weak var displayOffSwitch: UISwitch!
    @IBAction func displayOffSwitch(_ sender: Any) {
        if displayOffSwitch.isOn {
            viewModel.bluetoothManager.display_sleep = 1
        } else {
            viewModel.bluetoothManager.display_sleep = 0
        }
        viewModel.bluetoothManager.settingsClass.writeDEVICE_WORKMODE(bluetoothManager: viewModel.bluetoothManager)
        viewModel.saveSettingsAlert.saveSettingsAlert(vc: self)
    }
    @IBOutlet weak var heat1Switch: UISwitch!
    @IBAction func heat1Switch(_ sender: Any) {
        if heat1Switch.isOn {
            viewModel.bluetoothManager.heater_enabled1 = 1
        } else {
            viewModel.bluetoothManager.heater_enabled1 = 0
        }
        viewModel.bluetoothManager.settingsClass.writeDEVICE_WORKMODE(bluetoothManager: viewModel.bluetoothManager)
        viewModel.saveSettingsAlert.saveSettingsAlert(vc: self)
    }
    
    @IBOutlet weak var heat2Switch: UISwitch!
    @IBAction func heat2Switch(_ sender: Any) {
        if heat2Switch.isOn {
            viewModel.bluetoothManager.heater_enabled2 = 1
        } else {
            viewModel.bluetoothManager.heater_enabled2 = 0
        }
        viewModel.bluetoothManager.settingsClass.writeDEVICE_WORKMODE(bluetoothManager: viewModel.bluetoothManager)
        viewModel.saveSettingsAlert.saveSettingsAlert(vc: self)
    }
    @IBAction func defaultButton(_ sender: Any) {
        loggingSwitch.setOn(false, animated: true)
        viewModel.bluetoothManager.enable_logging = 0
        viewModel.bluetoothManager.logging_interval = 5000
        untervalTextField.text = "5"
        displayOffSwitch.setOn(false, animated: true)
        viewModel.bluetoothManager.display_sleep = 0
        heat1Switch.setOn(false, animated: true)
        viewModel.bluetoothManager.heater_enabled1 = 0
        heat2Switch.setOn(false, animated: true)
        viewModel.bluetoothManager.heater_enabled2 = 0
        viewModel.bluetoothManager.settingsClass.writeDEVICE_WORKMODE(bluetoothManager: viewModel.bluetoothManager)
        viewModel.saveSettingsAlert.saveSettingsAlert(vc: self)
    }
    
    @IBAction func resetAllButton(_ sender: Any) {
        viewModel.resetAllAlert.resetAllAlert(vc: self, viewModel: viewModel)
        viewModel.saveSettingsAlert.saveSettingsAlert(vc: self)
    }
    @IBOutlet weak var untervalTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.title = "SETTINGS"
        untervalTextField.delegate = self
        untervalTextField.textColor = .white
        untervalTextField.backgroundColor = .black
        if viewModel.bluetoothManager.enable_logging! == 0 {
            loggingSwitch.setOn(false, animated: true)
        } else if viewModel.bluetoothManager.enable_logging! == 1 {
            loggingSwitch.setOn(true, animated: true)
        }
        if viewModel.bluetoothManager.display_sleep! == 0 {
            displayOffSwitch.setOn(false, animated: true)
        } else if viewModel.bluetoothManager.display_sleep! == 1 {
            displayOffSwitch.setOn(true, animated: true)
        }
        untervalTextField.text = String(viewModel.bluetoothManager.logging_interval! / 1000)
        if viewModel.bluetoothManager.heater_enabled1! == 0 {
            heat1Switch.setOn(false, animated: true)
        } else if viewModel.bluetoothManager.heater_enabled1! == 1 {
            heat1Switch.setOn(true, animated: true)
        }
        if viewModel.bluetoothManager.heater_enabled2! == 0 {
            heat2Switch.setOn(false, animated: true)
        } else if viewModel.bluetoothManager.heater_enabled2! == 1 {
            heat2Switch.setOn(true, animated: true)
        }
        deviceInfo.text = "Производитель: \(viewModel.bluetoothManager.manufacturerNameString)\nМодель: \(viewModel.bluetoothManager.modelNumberString)\nСерийный номер: \(viewModel.bluetoothManager.serialNumberString)\nВерсия прошивки: \(viewModel.bluetoothManager.firmwareRevisionString)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField.text != "" {
            if Int(textField.text!)! < 1 {
                textField.text = "1"
                viewModel.bluetoothManager.logging_interval = 1000
            } else if Int(textField.text!)! > 86400 {
                textField.text = "86400"
                viewModel.bluetoothManager.logging_interval = 86400000
            } else {
                viewModel.bluetoothManager.logging_interval = Int(textField.text!)! * 1000
            }
//            viewModel.bluetoothManager.settingsClass.writeLOGGING_INTERVAL(bluetoothManager: viewModel.bluetoothManager, value: viewModel.bluetoothManager.logging_interval!)
            viewModel.saveSettingsAlert.saveSettingsAlert(vc: self)
        }
    }

    deinit {
        print("deinit SettingsViewController")
    }
}
