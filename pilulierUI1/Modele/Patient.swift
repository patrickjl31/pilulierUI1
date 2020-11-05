//
//  Patient.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 26/07/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

struct Patient : Codable {
    var id:String = UUID().uuidString
    var nom : String
    var prenom :String
    var fiche: FicheMedicale
    var remarques : String = ""
    // La liste des prescriptions
    //var mesPrescriptions : [Prescription] = []
    var mesPrescriptions : Prescriptions
    
    
    
    
    func toJson()->String?{
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self), let jsonString = String(data: encoded, encoding: .utf8){
            return jsonString
        }
        return nil
    }
    
}


struct FicheMedicale: Codable {
    var anneeNaissance:String = "1950"
    var poids:String = "70"
    var dernierePesee : Date = Date()
    var allergies: String = ""
    //var aSavoir: String = ""
}
