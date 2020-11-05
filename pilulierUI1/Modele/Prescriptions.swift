//
//  Prescriptions.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 31/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation
struct Prescriptions: Codable {
    var enCours : [Prescription] = []
    var terminees : [Prescription] = []
    
    
    func toJson()->String?{
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self), let jsonString = String(data: encoded, encoding: .utf8){
            return jsonString
        }
        return nil
    }
    
    // Dispacher les prescription entre les actives et les inactives
    mutating func dispachPrecriptions()  {
        let ceJour = Date()
        var t1 : [Prescription] = []
        var t2 : [Prescription] = []
        for prescription in enCours {
            if prescription.isActiveAtDate(date: ceJour){
                t1.append(prescription)
            } else {
                t2.append(prescription)
            }
        }
        for prescription in terminees {
            if prescription.isActiveAtDate(date: ceJour){
                t1.append(prescription)
            } else {
                t2.append(prescription)
            }
        }
        enCours = t1
        terminees = t2
    }
    
}
