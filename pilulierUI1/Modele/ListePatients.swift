//
//  ListePatients.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 29/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

struct ListePatients: Codable {
    var l: [Patient] = []
    
    func toJson()->String?{
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self), let jsonString = String(data: encoded, encoding: .utf8){
            return jsonString
        }
        return nil
    }
    
    mutating func deleteElem(index: Int){
        l.remove(at: index)
        
    }
}
