//
//  Prescription.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 30/08/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

class Prescription : Codable {
    var id : String = UUID().uuidString
    var pourPatient : String //l'id du patient
    var identification : String //AMMObject.denomination
    // Lors de la première ordonnance, renouveleLe est aussi mis à jour
    var ordonneLe : String = "" // transformer en double pour les calculs de dateDouble, date de création
    var renouveleLe : String = "" // transformer en double pour les calculs de dateDouble, dernière date d'ordonnance
    var pendant : Int = 8 // durée de la prescription. Si -1, indéfini.
    var repeterTousLes : Int = 1
    // combien d'unités matin, midi, soir, nuit
    var prises = [0,0,0,0]
    // 5 comprimés par prise...?
    var posologie = ""
    
    
    init(quoi : String, quand:Date, pour:String) {
        identification = quoi
        ordonneLe = quand.stringAMidi()
        renouveleLe = quand.stringAMidi()
        pourPatient = pour
    }
    
    func isActiveAtDate(date: Date) -> Bool {
        if ordonneLe == "" || renouveleLe == "" {
            return false
        }
        if let dateDebut = renouveleLe.toDate(){
            let dateFin = dateDebut.enJoursPlusTard(combien: pendant)
            return date <= dateFin
        }
        return false
    }
    
    
    
}
