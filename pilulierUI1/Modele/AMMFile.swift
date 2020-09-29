//
//  AMMFile.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 27/07/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

struct AMMObject: Codable {
    var CIS = ""
    var denomination = ""
    var forme = ""
    var voieAdministration  = ""
    var AMM = ""
    var labo = ""
    var surveillance = ""
   
    
}

struct AMMFile: Codable {
    var AMM :[AMMObject] = []
    
    func toAMMArray() -> [String] {
        var res:[String] = []
        
        for medoc in AMM {
            let nom = medoc.denomination
            res.append(nom)
        }
        return res
    }
}
