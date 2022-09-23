//
//  CharacteristicProtocol.swift
//  eKolloger
//
//  Created by REYNIKOV ANTON on 04.09.2022.
//

import Foundation
import CoreBluetooth


protocol CharacteristicProtocol {
    
    static var characteristicUUID: CBUUID { get }
    static var description: String { get }
    static var readMetod: String { get }
    static var writeMetod: String { get }
}

