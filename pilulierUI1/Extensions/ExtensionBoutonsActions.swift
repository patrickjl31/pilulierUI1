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
            let patient = Patient(nom: nom, prenom: prenom, fiche: FicheMedicale(anneeNaissance: anneeN, poids: poids, dernierePesee: Date(), allergies: allergies), remarques: important, mesPrescriptions: Prescriptions())
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
            let lePatient = Patient(nom: nom, prenom: prenom, fiche: FicheMedicale(), mesPrescriptions: Prescriptions())
            index = addPatient(patient: lePatient)
        } else {
           patientCourant = index
        }
        return index
    }
    
    //Enregistre une nouvelle prescription
    func btnSaveNewPrescription(idPresrcription: String, nom:String, pendant:Int, repeter: Int, prises: [Int], posologie: String)  {
        var patientEnCours = lesPatients.l[patientCourant]
        //Il y a un nom de médicament et un patient courant, sinon, on ne fait rien
        if (nom.count > 2) , patientCourant > -1 {
            // Si c'est une nouvelle prescription, elle n'a pas encore d'id
            if idPresrcription == "" {
                let newPrescription = Prescription(quoi: nom, quand: Date(), pour: patientEnCours.id)
                newPrescription.prises = prises
                newPrescription.repeterTousLes = repeter
                newPrescription.pendant = pendant
                newPrescription.posologie = posologie
                // On l'ajoute aux prescriptions
                patientEnCours.mesPrescriptions.enCours.append(newPrescription)
            } else {
                // On récupère la prescription à modifier
                if let laPrescription = searchPrescription(idPrescription: idPresrcription, in: patientEnCours.mesPrescriptions) {
                    laPrescription.prises = prises
                    laPrescription.repeterTousLes = repeter
                    laPrescription.pendant = pendant
                    laPrescription.posologie = posologie
                    laPrescription.renouveleLe = Date().stringAMidi()
                    // on met de l'ordre dans les prescriptions
                    patientEnCours.mesPrescriptions.dispachPrecriptions()
                }
            }
            
            //on sauvegarde
            filer.saveAllPatients(patients: lesPatients)
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
