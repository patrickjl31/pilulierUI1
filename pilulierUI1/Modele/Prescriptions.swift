//
//  Prescriptions.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 31/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation
class Prescriptions: Codable, ObservableObject {
    var enCours : [Prescription] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    var terminees : [Prescription] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case enCours
        case terminees
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        enCours = try values.decode([Prescription].self, forKey: .enCours)
        terminees = try values.decode([Prescription].self, forKey: .terminees)
        
    }
    init() {
        //enCours = []
        //terminees = []
    }
    
    func toJson()->String?{
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self), let jsonString = String(data: encoded, encoding: .utf8){
            return jsonString
        }
        return nil
    }
    
    // Dispacher les prescription entre les actives et les inactives
    func dispachPrescriptions()  {
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
    
    //récupère une prescription identifiée par son id
    func getPrescription(byId : String) -> Prescription? {
        for prescription in enCours {
            if prescription.id == byId {
                return prescription
            }
        }
        for prescription in terminees {
            if prescription.id == byId {
                return prescription
            }
        }
        return nil
    }
    
    // Vérifie si une prescription est déjà enregistrée dans enCours ou dansterminees
    // Renvoie nil ou la prescription
    func isPresentPrescription(name: String) -> Prescription? {
        for index in 0..<enCours.count {
            if enCours[index].identification.firstWord() == name.firstWord() {
                return enCours[index]
            }
        }
        for index in 0..<enCours.count {
            if terminees[index].identification.firstWord() == name.firstWord() {
                return terminees[index]
            }
        }
        return nil
    }
    
    //supprimer une prescription
    func remove1(prescription: Prescription)  {
        var myIndex = -1
        for index in 0..<enCours.count {
            if enCours[index].id == prescription.id {
                myIndex = index
            }
        }
        if myIndex > -1 {
            enCours.remove(at: myIndex)
        } else {
            for index in 0..<terminees.count {
                if terminees[index].id == prescription.id {
                    myIndex = index
                }
            }
            if myIndex > -1 {
                terminees.remove(at: myIndex)
            }
        }
    }
    
    func remove(at offset: IndexSet, inList: Int) {
        if inList == 0 {
            enCours.remove(atOffsets: offset)
        } else {
            if inList == 1 {
                terminees.remove(atOffsets: offset)
            }
        }
    }
    
    //-------------------------------------------
    //---Extraction d'un pilulier-----
    func extractPilulier(forDay : Date) -> [String:[Any]] {
        var res = ["matin":[],"midi":[],"soir":[],"nuit":[],]
        for prescription in self.enCours {
            if prescription.isActiveAtDate(date: forDay) {
                if prescription.matin.count > 0 {
                    let uneAutre = [prescription.identification, prescription.matin]
                    res["matin"]?.append(uneAutre)
                }
                if prescription.midi.count > 0 {
                    let uneAutre = [prescription.identification, prescription.midi]
                    res["midi"]?.append(uneAutre)
                }
                if prescription.soir.count > 0 {
                    let uneAutre = [prescription.identification, prescription.soir]
                    res["soir"]?.append(uneAutre)
                }
                if prescription.nuit.count > 0 {
                    let uneAutre = [prescription.identification, prescription.nuit]
                    res["nuit"]?.append(uneAutre)
                }
            }
        }
        return res
    }
    
}
