//
//  SQLiteDB.swift
//  eKologger
//
//  Created by Alexey Golovanov on 27.10.2022.
//

import Foundation
import SQLite

class SQLiteDB {
    
    var database: Connection?

    let measureTable = Table("Measure")
    let id = Expression<String>("id")
    let dateTime = Expression<Int>("dateTime")
    let flagError = Expression<Int>("flagError")
    let tempAir = Expression<Double>("tempAir")
    let hum = Expression<Double>("hum")
    let dewPoint = Expression<Double>("dewPoint")
    let tempWetBall = Expression<Double>("tempWetBall")
    let windSpeed = Expression<Double>("windSpeed")
    let tempBlackBall = Expression<Double>("tempBlackBall")
    let tnsWithoutSun = Expression<Double>("tnsWithoutSun")
    let tnsWithSun = Expression<Double>("tnsWithSun")
    let tempRadio = Expression<Double>("tempRadio")
    let density = Expression<Double>("density")
    let pressure = Expression<Double>("pressure")
    let tempResult = Expression<Double>("tempResult")
    let flagChange = Expression<Int>("flagChange")
    let dateTime2 = Expression<Int>("dateTime2")
    let flagError2 = Expression<Int>("flagError2")
    let tempAir2 = Expression<Double>("tempAir2")
    let hum2 = Expression<Double>("hum2")
    let dewPoint2 = Expression<Double>("dewPoint2")
    let tempWetBall2 = Expression<Double>("tempWetBall2")
    let windSpeed2 = Expression<Double>("windSpeed2")
    let tempBlackBall2 = Expression<Double>("tempBlackBall2")
    let tnsWithoutSun2 = Expression<Double>("tnsWithoutSun2")
    let tnsWithSun2 = Expression<Double>("tnsWithSun2")
    let tempRadio2 = Expression<Double>("tempRadio2")
    let density2 = Expression<Double>("density2")
    let pressure2 = Expression<Double>("pressure2")
    let tempResult2 = Expression<Double>("tempResult2")
    let flagChange2 = Expression<Int>("flagChange2")
    
    //Синглтон чтобы один раз подключится к базе
    static let sharedInstance = SQLiteDB()
    
    private init() {
        do {
            let fileManager = FileManager.default
            let dbPath = try fileManager
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("db.sqlite3")
                .path
            if !fileManager.fileExists(atPath: dbPath) {
                let dbResourcePath = Bundle.main.path(forResource: "db", ofType: "sqlite3")!
                try fileManager.copyItem(atPath: dbResourcePath, toPath: dbPath)
            }
            let database = try Connection(dbPath, readonly: false)
            
            self.database = database
            print("db_connect")
        } catch {
            print(error)
        }
    }
    
    deinit {
        print("deinitSQLiteDB")
    }
}


