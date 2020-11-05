//
//  GestionDonnees.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 26/07/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

class GestionDonnees: ObservableObject {
    //public static let shared = GestionDonnees()
    let filer = Filer()
    let medicamentsAMM : AMMFile //= AMMFile(AMM: [])
    var AMMNoms:[String] = []
    
    @Published var lesPatients : ListePatients = ListePatients()
    @Published var patientCourant:Int = -1
    
    let userDefaults = UserDefaults.standard
   
    
    init() {
        medicamentsAMM = filer.recallAMM()
        AMMNoms = medicamentsAMM.toAMMArray()
        if let patients = filer.recallPatients() {
            lesPatients = patients
            if let courant = self.racallUserDefault(), courant < patients.l.count  {
                patientCourant = courant
            }
        }
    }
    
    // Gestion des patients
    //Renvoie le numéro d'ordre d'un patient s'il existe
    func isPatient(nom:String, prenom:String) -> Int {
        //var res = -1
        for index in 0..<lesPatients.l.count {
            if lesPatients.l[index].nom == nom && lesPatients.l[index].prenom == prenom {
                return index
            }
        }
        return -1
    }
    
    func addPatient(patient:Patient) -> Int {
        lesPatients.l.append(patient)
        setPatientCourant(index: lesPatients.l.count - 1)
        return lesPatients.l.count - 1
    }
    
    func deletePatient(atOffset: IndexSet)  {
        if let index = atOffset.first {
            lesPatients.deleteElem(index: index)
            patientCourant = -1
        }
        
    }
    
    func getIndex(patient:Patient) -> Int? {
        for index in 0..<lesPatients.l.count{
            if patient.id == lesPatients.l[index].id {
                return index
            }
        }
        return nil
    }
    
    func setPatientCourant(index: Int)  {
        if index > -1 {
            patientCourant = index
        } else {
            patientCourant = -1
        }
        saveUserDefault(indexPatient: index)
    }
    
    func isPatientCourant(patient: Patient) -> Bool {
        if patientCourant > -1 {
            for index in 0..<lesPatients.l.count{
                if patient.id == lesPatients.l[patientCourant].id {
                    return true
                }
            }
        }
        return false
    }
    
    // String to JSON et inverse dans le filer
    
    // Mémoire du patient par défaut
    func saveUserDefault(indexPatient: Int)  {
        userDefaults.set(indexPatient, forKey: PATIENT)
    }
    func racallUserDefault() -> Int? {
        return userDefaults.integer(forKey: PATIENT)
    }

}
