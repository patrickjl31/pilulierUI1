//
//  Patient.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 26/07/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

struct Patient : Codable {
    var nom : String
    var prenom :String
    
    var remarques : String = ""
    
    
    
    
    
    func toJson()->String?{
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self), let jsonString = String(data: encoded, encoding: .utf8){
            return jsonString
        }
        return nil
    }
    
}


struct ficheMedicale: Codable {
    var anneeNaissance:Int = 1950
    var poids:Int = 70
    var Allergies: String = ""
    var aSavoir: String = ""
}
