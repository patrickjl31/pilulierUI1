//
//  Prescription.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 30/08/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

class Prescription : Codable, ObservableObject {
    var id : String = UUID().uuidString
    var pourPatient : String //l'id du patient
    var identification : String = "" //AMMObject.denomination
    // Lors de la première ordonnance, renouveleLe est aussi mis à jour
    var ordonneLe : String = "" // transformer en double pour les calculs de dateDouble, date de création
    var renouveleLe : String = "" // transformer en double pour les calculs de dateDouble, dernière date d'ordonnance
    var pendant : Int = 8 // durée de la prescription. Si -1, indéfini.
    var repeterTousLes : Int = 1
    // combien d'unités matin, midi, soir, nuit
    var matin : String = ""
    var midi : String = ""
    var soir : String = ""
    var nuit : String = ""
    var prises = [0,0,0,0]
    // 5 comprimés par prise...?
    var posologie = ""
    
    
    init(quoi : String, quand:Date = Date(), pour:String) {
        identification = quoi
        ordonneLe = quand.stringAMidi()
        renouveleLe = quand.stringAMidi()
        pourPatient = pour
    }
    
    init(idPatient:String) {
        pourPatient = idPatient
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
    
    func toPrescriptionString() -> PrescripString {
        let pendantS = String(pendant)
        let repetition = String(repeterTousLes)
        //var tab:[Bool] = [true,true,true,true]
        var tableau: [Bool] = []
        for index in 0..<prises.count {
            var r = true
            if prises[index] == 1 {
                r = true
            } else {
                r = false
            }
            tableau.append(r)
        }
        return PrescripString(patient: pourPatient, id: identification, ordonnele: ordonneLe, renouvel: renouveleLe, pendan: pendantS, repete: repetition, prise: tableau, posol: posologie)
       
    }
    
    
    
}

class PrescripString {
    var pourPatient : String = "" //l'id du patient
    var identification : String = "" //AMMObject.denomination
    // Lors de la première ordonnance, renouveleLe est aussi mis à jour
    var ordonneLe : String = "" // transformer en double pour les calculs de dateDouble, date de création
    var renouveleLe : String = "" // transformer en double pour les calculs de dateDouble, dernière date d'ordonnance
    var pendant : String = "8" // durée de la prescription. Si -1, indéfini.
    var repeterTousLes : String = "1"
    // combien d'unités matin, midi, soir, nuit
    var prises = [false,true,false,false]
    // 5 comprimés par prise...?
    var posologie = ""
    
    init(patient : String, id:String,ordonnele:String,renouvel:String,pendan:String = "8", repete:String = "1", prise: [Bool] = [false,true,false,false], posol: String = "Posologie") {
        self.pourPatient = patient
        self.identification = id
        self.ordonneLe = ordonnele
        self.renouveleLe = renouvel
        self.pendant = pendan
        self.prises = prise
        self.posologie = posol
    }
    
    func toPrescription() -> Prescription {
        
        let res =  Prescription(quoi: self.identification, quand: Date(), pour: pourPatient)
        res.pendant = Int(pendant) ?? 8
        res.repeterTousLes = Int(repeterTousLes) ?? 1
        for index in 0..<prises.count{
            if prises[index]{
                res.prises[index] = 1
            } else {
                res.prises[index] = 0
            }
        }
        res.posologie = posologie
        
        return res
    }
}
