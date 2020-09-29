//
//  Prescription.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 30/08/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

class Prescription : Codable {
    var identification : AMMObject
    var ordonneLe : Double
    // combien d'unités matin, midi, soir, nuit
    var prises = [0,0,0,0]
    
    
    init(quoi : AMMObject, quand:Date) {
        identification = quoi
        ordonneLe = quand.dateToDouble(date: quand)
    }
    
    
    
}
