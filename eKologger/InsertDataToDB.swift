//
//  InsertDataToDB.swift
//  eKologger
//
//  Created by Alexey Golovanov on 27.10.2022.
//

import Foundation
import SQLite

class InsertDataToDB {
    
    private func insertDataToDB(db: SQLiteDB, insert: Insert) {
        do {
            let rowid = try db.database?.run(insert)
            print("inserted id: \(rowid ?? 0)")
        } catch {
            print("insertion failed: \(error)")
        }
    }
    
    func insertMeasurement(db: SQLiteDB, data: DataDB) {
        
        do {
            for measure in try db.database!.prepare(db.measureTable.select(db.dateTime)) {
                if measure[db.dateTime] != Int(data.dateTime) {
                    continue
                } else {
                    return
                }
            }
            let insert = db.measureTable.insert(db.id <- UUID().uuidString,
                                                db.dateTime <- Int(data.dateTime),
                                                db.flagError <- Int(data.flagError),
                                                db.tempAir <- Double(data.tempAir),
                                                db.hum <- Double(data.hum),
                                                db.dewPoint <- Double(data.dewPoint),
                                                db.tempWetBall <- Double(data.tempWetBall),
                                                db.windSpeed <- Double(data.windSpeed),
                                                db.tempBlackBall <- Double(data.tempBlackBall),
                                                db.tnsWithoutSun <- Double(data.tnsWithoutSun),
                                                db.tnsWithSun <- Double(data.tnsWithSun),
                                                db.tempRadio <- Double(data.tempRadio),
                                                db.density <- Double(data.density),
                                                db.pressure <- Double(data.pressure),
                                                db.tempResult <- Double(data.tempResult),
                                                db.flagChange <- Int(data.flagChange),
                                                db.dateTime2 <- Int(data.dateTime2),
                                                db.flagError2 <- Int(data.flagError2),
                                                db.tempAir2 <- Double(data.tempAir2),
                                                db.hum2 <- Double(data.hum2),
                                                db.dewPoint2 <- Double(data.dewPoint2),
                                                db.tempWetBall2 <- Double(data.tempWetBall2),
                                                db.windSpeed2 <- Double(data.windSpeed2),
                                                db.tempBlackBall2 <- Double(data.tempBlackBall2),
                                                db.tnsWithoutSun2 <- Double(data.tnsWithoutSun2),
                                                db.tnsWithSun2 <- Double(data.tnsWithSun2),
                                                db.tempRadio2 <- Double(data.tempRadio2),
                                                db.density2 <- Double(data.density2),
                                                db.pressure2 <- Double(data.pressure2),
                                                db.tempResult2 <- Double(data.tempResult2),
                                                db.flagChange2 <- Int(data.flagChange2))
            
            insertDataToDB(db: db, insert: insert)
            
        } catch {
            print(error)
        }
    }
}
