//
//  CBUUIDEnums.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 04.09.2022.
//

import Foundation
import CoreBluetooth

var addToUUID = "-10AE-4C36-9A27-96BCD4C7F835"

enum DeviceInformation {
    static let serviceUUID = CBUUID(string: "180A")
    static let description = "DeviceInformation"
}

enum ManufacturerNameString:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "2A29")
    static let description = "ManufacturerNameString"
    static let readMetod = "string"
    static let writeMetod = "no"
}

enum SerialNumberString:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "2A25")
    static let description = "SerialNumberString"
    static let readMetod = "string"
    static let writeMetod = "no"
}

enum FirmwareRevisionString:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "2A26")
    static let description = "FirmwareRevisionString"
    static let readMetod = "string"
    static let writeMetod = "no"
}

enum ModelNumberString:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "2A24")
    static let description = "ModelNumberString"
    static let readMetod = "string"
    static let writeMetod = "no"
}

enum DeviceIDAndState {
    static let serviceUUID = CBUUID(string: "00000100\(addToUUID)")
    static let description = "DeviceIDAndState"
}

enum DateTime:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000105\(addToUUID)")
    static let description = "DateTime"
    static let readMetod = "datetime"
    static let writeMetod = "datetime"
}

enum DEVICE_WORKMODE:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000106\(addToUUID)")
    static let description = "DEVICE_WORKMODE"
    static let readMetod = "uint32"
    static let writeMetod = "uint32"
}

//enum DISPLAY_SLEEP:CharacteristicProtocol {
//    static let characteristicUUID = CBUUID(string: "00000107\(addToUUID)")
//    static let description = "DISPLAY_SLEEP"
//    static let readMetod = "uint8"
//    static let writeMetod = "uint8"
//}

enum POWER_STATE:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000104\(addToUUID)")
    static let description = "POWER_STATE"
    static let readMetod = "array"
    static let writeMetod = "no"
}

enum LiveData {
    static let serviceUUID = CBUUID(string: "00000500\(addToUUID)")
    static let description = "LiveData"
}


enum Temp:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000504\(addToUUID)")
    static let description = "Temp"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Hum:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000505\(addToUUID)")
    static let description = "Hum"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Press:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000506\(addToUUID)")
    static let description = "Press"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Temp2:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000507\(addToUUID)")
    static let description = "Temp2"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Hum2:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000508\(addToUUID)")
    static let description = "Hum2"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Press2:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000509\(addToUUID)")
    static let description = "Press2"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Speed:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000510\(addToUUID)")
    static let description = "Speed"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Speed2:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000511\(addToUUID)")
    static let description = "Speed2"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum Tns:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000512\(addToUUID)")
    static let description = "Tns"
    static let readMetod = "float"
    static let writeMetod = "no"
}

enum DEVICE_PERSISTENT_DATA_ACCESS_AND_CONTROL_UUID {
    static let serviceUUID = CBUUID(string: "00000300\(addToUUID)")
    static let description = "DEVICE_PERSISTENT_DATA_ACCESS_AND_CONTROL_UUID"
}

enum PERSISTENT_NODE_COUNT:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000301\(addToUUID)")
    static let description = "PERSISTENT_NODE_COUNT"
    static let readMetod = "no"
    static let writeMetod = "uint8"
}

enum NODE_ACCESS_INDEX:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000302\(addToUUID)")
    static let description = "NODE_ACCESS_INDEX"
    static let readMetod = "no"
    static let writeMetod = "uint32"
}

enum CURRENT_NODE_READ:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000303\(addToUUID)")
    static let description = "CURRENT_NODE_READ"
    static let readMetod = "array"
    static let writeMetod = "int64"
}

enum NODES_DATE:CharacteristicProtocol {
    static let characteristicUUID = CBUUID(string: "00000306\(addToUUID)")
    static let description = "NODES_DATE"
    static let readMetod = "array"
    static let writeMetod = "uint8"
}

//enum ENABLE_LOGGING:CharacteristicProtocol {
//    static let characteristicUUID = CBUUID(string: "00000305\(addToUUID)")
//    static let description = "ENABLE_LOGGING"
//    static let readMetod = "uint8"
//    static let writeMetod = "uint8"
//}

//enum LOGGING_INTERVAL:CharacteristicProtocol {
//    static let characteristicUUID = CBUUID(string: "00000307\(addToUUID)")
//    static let description = "LOGGING_INTERVAL"
//    static let readMetod = "uint32"
//    static let writeMetod = "uint32"
//}

extension CBService {
    func serviceDescription(service: CBService) -> String? {
        switch service.uuid {
        case DeviceInformation.serviceUUID:
            return DeviceInformation.description
        case DeviceIDAndState.serviceUUID:
            return DeviceIDAndState.description
        case LiveData.serviceUUID:
            return LiveData.description
        case DEVICE_PERSISTENT_DATA_ACCESS_AND_CONTROL_UUID.serviceUUID:
            return DEVICE_PERSISTENT_DATA_ACCESS_AND_CONTROL_UUID.description
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
        case Speed.characteristicUUID:
            return descrReadWrite(char: Speed.self)
        case Speed2.characteristicUUID:
            return descrReadWrite(char: Speed2.self)
        case Tns.characteristicUUID:
            return descrReadWrite(char: Tns.self)
        case NODE_ACCESS_INDEX.characteristicUUID:
            return descrReadWrite(char: NODE_ACCESS_INDEX.self)
        case CURRENT_NODE_READ.characteristicUUID:
            return descrReadWrite(char: CURRENT_NODE_READ.self)
        case NODES_DATE.characteristicUUID:
            return descrReadWrite(char: NODES_DATE.self)
        case DEVICE_WORKMODE.characteristicUUID:
            return descrReadWrite(char: DEVICE_WORKMODE.self)
        case PERSISTENT_NODE_COUNT.characteristicUUID:
            return descrReadWrite(char: PERSISTENT_NODE_COUNT.self)
        case ManufacturerNameString.characteristicUUID:
            return descrReadWrite(char: ManufacturerNameString.self)
        case SerialNumberString.characteristicUUID:
            return descrReadWrite(char: SerialNumberString.self)
        case FirmwareRevisionString.characteristicUUID:
            return descrReadWrite(char: FirmwareRevisionString.self)
        case ModelNumberString.characteristicUUID:
            return descrReadWrite(char: ModelNumberString.self)
        case POWER_STATE.characteristicUUID:
            return descrReadWrite(char: POWER_STATE.self)
        default:
            return nil
        }
    }
}

