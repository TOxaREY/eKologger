//
//  DeleteDataFromDB.swift
//  eKologger
//
//  Created by Alexey Golovanov on 27.10.2022.
//

import Foundation
import SQLite


class DeleteDataFromDB {
    
    private func deleteFromDB(db: SQLiteDB, row: Table) {
        do {
            let rowid = try db.database?.run(row.delete())
            print("deleted id: \(rowid ?? 0)")
        } catch {
            print("delete failed: \(error)")
        }
    }
    
    func deleteDataFromDB(db: SQLiteDB) {
        let rowTracker = db.measureTable
        deleteFromDB(db: db, row: rowTracker)
    }
}
