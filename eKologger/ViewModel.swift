//
//  ViewModel.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 04.09.2022.
//

import UIKit
import CoreBluetooth

var dateCountArray: [DateCount] = []
var dataDevice: [DataDevice] = []
var iterCount = 0
var processingCount = 0

class ViewModel {
    var bluetoothManager = BluetoothManager.instance
    var liveDataTimer = Timer()
    var daysMeasurementTableViewLoad = DaysMeasurementTableViewLoad()
    var dataProcessing = DataProcessing()
    var notMeasureAlert = NotMeasureAlert()

    func readTimer() {
        liveDataTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
//            print("liveDataTimer")
            self.bluetoothManager.readLiveData.readCharLiveData(bluetoothManager: self.bluetoothManager)
        }
    }
    
    func numberOfRowsDaysMeasurement(tableView: UITableView) -> Int {
        return dateCountArray.count
    }
    
    func cellRowDaysMeasurement(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "measurement", for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name: "Formular-Medium", size: 15)
        cell.textLabel?.textColor = .black
        cell.selectionStyle = .none
        cell.textLabel?.text = "Дата: \(dateCountArray[indexPath.row].date.dateToString) Кол-во: \(dateCountArray[indexPath.row].count)"
        return cell
    }
    
    func didSelectRowAtDaysMeasurement(indexPath: IndexPath, alertController: UIAlertController, vc: UIViewController) {
        alertController.dismiss(animated: true, completion: nil)
        iterCount = Int(dateCountArray[indexPath.row].count)
        processingCount = 0
        dataProcessing.dataProcessing(vc: vc)
        bluetoothManager.settingsClass.writeCURRENT_NODE_READ(bluetoothManager: bluetoothManager, date: dateCountArray[indexPath.row].date)
    }
    
    func cellData(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cellData = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! TabCell
        if dataDevice.count != 0 {
            cellData.dateTime.text = dataDevice[indexPath.row].dateTime.datetimeToString
            cellData.temp.text = String(format:"%.1f", dataDevice[indexPath.row].tempAir)
            cellData.temp2.text = String(format:"%.1f", dataDevice[indexPath.row].tempAir2)
            cellData.hum.text = String(format:"%.1f", dataDevice[indexPath.row].hum)
            cellData.hum2.text = String(format:"%.1f", dataDevice[indexPath.row].hum2)
            cellData.press.text = String(format:"%.1f", dataDevice[indexPath.row].pressure)
            cellData.press2.text = String(format:"%.1f", dataDevice[indexPath.row].pressure2)
            cellData.speed.text = String(format:"%.1f", dataDevice[indexPath.row].windSpeed)
            cellData.speed2.text = String(format:"%.1f", dataDevice[indexPath.row].windSpeed2)
            cellData.tns.text = String(format:"%.1f",dataDevice[indexPath.row].tnsWithoutSun)
        }
        return cellData
    }
}
