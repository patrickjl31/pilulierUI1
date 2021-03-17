//
//  Patient.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 26/07/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

class Patient : Codable, ObservableObject {
    var id:String = UUID().uuidString
    var nom : String = ""
    var prenom :String = ""
    var fiche: FicheMedicale = FicheMedicale()
    var remarques : String = ""
    // La liste des prescriptions
    //var mesPrescriptions : [Prescription] = []
    @Published var mesPrescriptions : Prescriptions = Prescriptions()
    var prescriptionsEnAttente : [Prescription] = []
    
    init(nom: String, prenom:String) {
        self.nom = nom
        self.prenom = prenom
        
    }
    ///*
    
    enum  CodingKeys: String, CodingKey {
        case id
        case nom
        case prenom
        case fiche
        case remarques
        case mesPrescriptions
        case prescriptionsEnAttente
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        nom = try values.decode(String.self, forKey: .nom)
        prenom = try values.decode(String.self, forKey: .prenom)
        remarques = try values.decode(String.self, forKey: .remarques)
        fiche = try values.decode(FicheMedicale.self, forKey: .fiche)
        mesPrescriptions = try values.decode(Prescriptions.self, forKey: .mesPrescriptions)
        prescriptionsEnAttente = try values.decode([Prescription].self, forKey: .prescriptionsEnAttente)
        
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(nom, forKey: .nom)
        try container.encode(prenom, forKey: .prenom)
        try container.encode(remarques, forKey: .remarques)
        try container.encode(fiche, forKey: .fiche)
        try container.encode(mesPrescriptions, forKey: .mesPrescriptions)
        try container.encode(prescriptionsEnAttente, forKey: .prescriptionsEnAttente)
    }
    
     //*/
    
    /*
    //Valide les prescriptions en attente
    func validerPrescriptions() {
        var tampon : [Prescription] = []
        for prescription in prescriptionsEnAttente {
            if prescription.identification == "" {
                tampon.append(prescription)
            } else {
                // il faudra vérifier si la prescription est en cours
                mesPrescriptions.enCours.append(prescription)
            }
        }
        prescriptionsEnAttente = tampon
    }
    */
    func emptyPrescription() -> Prescription? {
        if prescriptionsEnAttente.isEmpty {
            return nil
        } else {
            for index in 0..<prescriptionsEnAttente.count {
                if prescriptionsEnAttente[index].identification == "" {
                    return prescriptionsEnAttente[index]
                }
            }
        }
        return nil
    }
    
    // Récupérer le nom d'une prescription du patient courant dont on connait l'ID
    func getNamePrescriptionWithId(myId : String) -> String {
        
        for prescription in mesPrescriptions.enCours {
            if prescription.id == myId {
                return prescription.identification
            }
        }
        for prescription in mesPrescriptions.terminees {
            if prescription.id == myId {
                return prescription.identification
            }
        }
        return ""
    }
    
    
    // json
    func toJson()->String?{
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self), let jsonString = String(data: encoded, encoding: .utf8){
            return jsonString
        }
        return nil
    }
    
}


class FicheMedicale: Codable {
    var anneeNaissance:String = "1950"
    var poids:String = "70"
    var dernierePesee : Date = Date()
    var allergies: String = ""
    //var aSavoir: String = ""
    

    enum  CodingKeysFM: String, CodingKey {
        case anneeNaissance
        case poids
        case dernierePesee
        case allergies
            
    }
    /*
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeysFM.self)
        anneeNaissance = try values.decode(String.self, forKey: .anneeNaissance)
        poids = try values.decode(String.self, forKey: .poids)
        dernierePesee = try values.decode(Date.self, forKey: .dernierePesee)
        allergies = try values.decode(String.self, forKey: .allergies)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeysFM.self)
        try container.encode(anneeNaissance, forKey: .anneeNaissance)
        try container.encode(poids, forKey: .poids)
        try container.encode(dernierePesee, forKey: .dernierePesee)
        try container.encode(allergies, forKey: .allergies)
    }
    
    */
    
    
}
