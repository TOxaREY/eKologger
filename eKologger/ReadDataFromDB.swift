//
//  ReadDataFromDB.swift
//  eKologger
//
//  Created by Alexey Golovanov on 27.10.2022.
//

import Foundation
import SQLite
import CoreLocation

var finishCount = 0

class ReadDataFromDB {
    
    let readMMQueue = DispatchQueue(label: "readMMQueue")
    
    func readMeasurementToMeasurementTable(db: SQLiteDB, date: String, viewModel: ViewModel) {
        readMMQueue.async {
            do {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "startInd2"), object: nil)
                for measure in try db.database!.prepare(db.measureTable.select(distinct: db.dateTime, db.flagError, db.tempAir, db.hum, db.dewPoint, db.tempWetBall, db.hum, db.windSpeed, db.tempBlackBall, db.tnsWithoutSun, db.tnsWithSun, db.tempRadio, db.density, db.pressure, db.tempResult, db.flagChange, db.dateTime2, db.flagError2, db.tempAir2, db.hum2, db.dewPoint2, db.tempWetBall2, db.windSpeed2, db.tempBlackBall2, db.tnsWithoutSun2, db.tnsWithSun2, db.tempRadio2, db.density2, db.pressure2, db.tempResult2, db.flagChange2).order(db.dateTime.asc)) {
                    if measure[db.dateTime].dateToString == date {
                        dataDevice.append(DataDevice(dateTime: measure[db.dateTime], tempAir: measure[db.tempAir], hum: measure[db.hum], pressure: measure[db.pressure], windSpeed: measure[db.windSpeed], tempAir2: measure[db.tempAir2], hum2: measure[db.hum2], pressure2: measure[db.pressure2], windSpeed2: measure[db.windSpeed2], tnsWithoutSun: measure[db.tnsWithoutSun]))
                    }
                }
                
            } catch {
                print(error)
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stopInd2"), object: nil)
            if dataDevice.count == 0 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "alert"), object: nil)
            } else {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "segue"), object: nil)
            }
        }
    }
}

