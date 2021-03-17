//
//  ListePatients.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 29/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

//, ObservableObject
class ListePatients: Codable, ObservableObject {
    @Published var l: [Patient] = []
    
    enum CodingKeys: String, CodingKey {
        case l
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        l = try values.decode([Patient].self, forKey: .l)
        
    }
    init() {
        
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(l, forKey: .l)
    }
    
    
    func toJson()->String?{
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self), let jsonString = String(data: encoded, encoding: .utf8){
            return jsonString
        }
        return nil
    }
    
    func deleteElem(index: Int){
        l.remove(at: index)
        
    }
}
