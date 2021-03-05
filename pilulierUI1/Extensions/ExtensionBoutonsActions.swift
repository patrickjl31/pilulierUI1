//
//  ExtensionBoutonsActions.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 09/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

extension GestionDonnees {
    
    // Actions des boutons
    // Enregistre un patient. S'il est dans la base, il modifie ses données, sinon, il le crée et l'ajoute à la base
    func btnEnregistrerNewPatient(nom:String, prenom:String, anneeN:String, poids:String, allergies:String, important:String)  {
        //var patient : Patient
        var index = isPatient(nom: nom, prenom: prenom)
        if index < 0 {
            //let patient = Patient()
            let patient = Patient(nom: nom, prenom: prenom)
            patient.remarques = important
            patient.mesPrescriptions = Prescriptions()
            patient.fiche.anneeNaissance = anneeN
            patient.fiche.allergies = allergies
            patient.fiche.poids = poids
            patient.fiche.dernierePesee = Date()
            index = addPatient(patient: patient)
            //let _ = print("nouveau")
        } else {
            
            lesPatients.l[index].fiche.anneeNaissance = anneeN
            lesPatients.l[index].fiche.allergies = allergies
            lesPatients.l[index].fiche.poids = poids
            lesPatients.l[index].fiche.dernierePesee = Date()
            lesPatients.l[index].remarques = important
        }
        // On met à jour la base enregistrée
        //let _ = print("on va sauver")
        filer.saveAllPatients(patients: lesPatients)
    }
    
    // Validation d'une identification ou création renvoie l'ordre du patient dans la liste
    func btnValidation(nom:String, prenom:String) -> Int {
        var index = isPatient(nom: nom, prenom: prenom)
        if index < 0 {
            let patient = Patient(nom: nom, prenom: prenom)
            patient.mesPrescriptions = Prescriptions()
            patient.fiche = FicheMedicale()
            
            index = addPatient(patient: patient)
        } else {
           patientCourant = index
        }
        return index
    }
    
    //Enregistre une nouvelle prescription
    // inutiles : ordonneLe : String,renouveleLe : String,
    func btnSaveNewPrescription(idPrescription: String, ident:String,  pendant:Int, repeter: Int, prises: [Int], posologie: String)  {
        if patientCourant > -1 {
            //var patientEnCours = lesPatients.l[patientCourant]
            //Il y a un nom de médicament et un patient courant, sinon, on ne fait rien
            if (ident.count > 2) , patientCourant > -1 {
                // Si c'est une nouvelle prescription, elle n'a pas encore d'id, on  la crée
                if idPrescription == "" {
                    let newPrescription = Prescription(quoi: ident, quand: Date(), pour: lesPatients.l[patientCourant].id)
                    newPrescription.renouveleLe = Date().stringAMidi()
                    newPrescription.pendant = pendant
                    newPrescription.repeterTousLes = repeter
                    newPrescription.prises = prises
                    newPrescription.posologie = posologie
                    // On l'ajoute aux prescriptions du patient courant dans la liste des prescriptions en cours
                    lesPatients.l[patientCourant].mesPrescriptions.enCours.append(newPrescription)
                } else {
                    // On récupère la prescription à modifier
                    if let laPrescription = searchPrescription(idPrescription: idPrescription, in: lesPatients.l[patientCourant].mesPrescriptions) {
                        // on la modifie
                        laPrescription.renouveleLe = Date().stringAMidi()
                        laPrescription.pendant = pendant
                        laPrescription.repeterTousLes = repeter
                        laPrescription.prises = prises
                        laPrescription.posologie = posologie
                        
                        // on met de l'ordre dans les prescriptions
                        lesPatients.l[patientCourant].mesPrescriptions.dispachPrescriptions()
                    }
                }
                
                //on sauvegarde
                filer.saveAllPatients(patients: lesPatients)
            }
        
        }
    }
    
    //transforme un tableau de booleens en tableau d'entiers
//    func boolsToInt(tab:[Bool])->[Int]{
//        var res : [Int] = []
//        for index in 0..<tab.count{
//            if tab[index] {
//                res.append(1)
//            } else {
//                res.append(0)
//            }
//        }
//        return res
//    }
    
    // Gestion des prescriptions
    // Rechercher une prescription avec id dans mes prescriptions
    func searchPrescription(idPrescription:String, in prescriptions:Prescriptions) -> Prescription? {
        //let res : Prescription
        for index in 0..<prescriptions.enCours.count {
            if prescriptions.enCours[index].id == idPrescription {
                return prescriptions.enCours[index]
            }
            if prescriptions.terminees[index].id == idPrescription {
                return prescriptions.terminees[index]
            }
            return nil
        }
        return nil
    }
    // Dispacher les prescription entre les actives et les inactives
    //func dispachPrecriptions(prescriptions:Prescriptions)
    
    /*
     var pourPatient : String
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
     */
}
