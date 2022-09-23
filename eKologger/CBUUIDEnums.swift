//
//  CBUUIDEnums.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 04.09.2022.
//

import Foundation
import CoreBluetooth

var addToUUID = "-10AE-4C36-9A27-96BCD4C7F835"

enum DeviceIDAndState {
    static let serviceUUID = CBUUID(string: "00001000\(addToUUID)")
    static let description = "DeviceIDAndState"
}

enum LiveData {
    static let serviceUUID = CBUUID(string: "00005000\(addToUUID)")
    static let description = "LiveData"
}

enum Test:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00001002\(addToUUID)")
    static let description = "Test"
    static let readMetod = "array"
    static let writeMetod = "no"
}

enum DateTime:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00001005\(addToUUID)")
    static let description = "DateTime"
    static let readMetod = "datetime"
    static let writeMetod = "datetime"
}

enum Temp:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00005004\(addToUUID)")
    static let description = "Temp"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Hum:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00005005\(addToUUID)")
    static let description = "Hum"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Press:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00005006\(addToUUID)")
    static let description = "Press"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Temp2:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00005007\(addToUUID)")
    static let description = "Temp2"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Hum2:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00005008\(addToUUID)")
    static let description = "Hum2"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Press2:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00005009\(addToUUID)")
    static let description = "Press2"
    static let readMetod = "float"
    static let writeMetod = "no"
}


extension CBService {
    func serviceDescription(service: CBService) -> String? {
        switch service.uuid {
        case DeviceIDAndState.serviceUUID:
            return DeviceIDAndState.description
        case LiveData.serviceUUID:
            return LiveData.description
        default:
            return nil
        }
    }
}

extension CBCharacteristic {
    func descrReadWrite<T: CharacteristicProtocol>(char: T.Type) -> (descr: String, read: String, write: String) {
        return (char.description, char.readMetod, char.writeMetod)
    }
    func characteristicDescriptionReadWriteMetods(characteris: CBCharacteristic) -> (descr: String, read: String, write: String)? {
        switch characteris.uuid {
        case DateTime.characteristicUUID:
            return descrReadWrite(char: DateTime.self)
        case Temp.characteristicUUID:
            return descrReadWrite(char: Temp.self)
        case Hum.characteristicUUID:
            return descrReadWrite(char: Hum.self)
        case Press.characteristicUUID:
            return descrReadWrite(char: Press.self)
        case Temp2.characteristicUUID:
            return descrReadWrite(char: Temp2.self)
        case Hum2.characteristicUUID:
            return descrReadWrite(char: Hum2.self)
        case Press2.characteristicUUID:
            return descrReadWrite(char: Press2.self)
        case Test.characteristicUUID:
            return descrReadWrite(char: Test.self)
        default:
            return nil
        }
    }
}

