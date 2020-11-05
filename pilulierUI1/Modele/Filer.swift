//
//  Filer.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 30/08/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation


class Filer {
    
    //MARK: Gestion des fichiers JSON
    func convertToJSONString(value: AnyObject) -> String? {
        if JSONSerialization.isValidJSONObject(value) {
            do{
                let data = try JSONSerialization.data(withJSONObject: value, options: [])
                if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                    return string as String
                }
            }catch{
            }
        }
        return nil
    }


    // encodage et décodage des données patients
    func unPatientToJsonString(patient:Patient) -> String? {
        
        if let res = convertToJSONString(value: patient as AnyObject) {
            return res
        }
        return nil
    }
    
    func lesPatientsToJsonString(patients : [Patient]) -> String? {
        if let res = convertToJSONString(value: patients as AnyObject) {
            return res
        }
        return nil
    }
    //-----------------------------------------
    func save1Patient(patient:Patient)  {
        if let jsonPatient = patient.toJson() {
            let nom = PATIENT_UNIQUE_FILE + "-" + patient.nom
            saveFile(fichier: jsonPatient, toNom: nom)
        }
    }
    func saveAllPatients(patients : ListePatients) {
        if let jsonPatients = patients.toJson() {
            saveFile(fichier: jsonPatients, toNom: PATIENTS_FILE)
            print("sauve tous")
        }
    }
    
    func recallPatients() -> ListePatients? {
        //let res:ListePatients = ListePatients()
        guard let jsonString = readFileFrom(nom: PATIENTS_FILE) else {
            return nil
        }
        let jsonData = Data(jsonString.utf8)
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(ListePatients.self, from: jsonData)
            return result
        } catch {
            print((error.localizedDescription))
        }
        return nil
    }
    
    func  recallSingularPatient(nom : String) -> Patient? {
        let nomComplet = PATIENT_UNIQUE_FILE + "-" + nom
        guard let jsonString = readFileFrom(nom: nomComplet) else {
            return nil
        }
        let jsonData = Data(jsonString.utf8)
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(Patient.self, from: jsonData)
            return result
        } catch {
            print((error.localizedDescription))
        }
        return nil
    }
    
    // MARK: Gestion des enregistrements de données --------------------------------------
    //----- Gestion des enregistrements de données---
    //Sauvegarder les patients(lesPatients)
    
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    func saveFile(fichier:String, toNom:String){
        let nomWithExtension = toNom + ".txt"
        let url = self.getDocumentsDirectory().appendingPathComponent(nomWithExtension)
        do {
            try fichier.write(to: url, atomically: true, encoding: .utf8)
            print("sauvegarde effectuée")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readFileFrom(nom:String) -> String? {
        let nomWithExtension = nom + ".txt"
        let url = self.getDocumentsDirectory().appendingPathComponent(nomWithExtension)
        do {
            let retour = try String(contentsOf: url, encoding: .utf8)
            return retour
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    // Lecture de la base AMM
    func recallAMM() -> AMMFile {
        var retour = AMMFile()
        //let url = self.getDocumentsDirectory().appendingPathComponent(AMM_FILE)
        guard let url = Bundle.main.url(forResource: AMM_FILE, withExtension: "txt") else { return AMMFile() }
        do {
            let fichier = try String(contentsOf: url, encoding: .utf8)
            retour = stringToAMM(fichier: fichier)
        } catch {
            print(error.localizedDescription)
            
        }
        return retour
    }
    func stringToAMM (fichier:String)-> AMMFile {
        var retour = AMMFile()
        let lignes = fichier.split(separator: "\n")
        if lignes.count > 1{
            for numero in 1..<lignes.count {
                let uneLigne = lignes[numero].split(separator: "|")
                let medoc = AMMObject(CIS: String(uneLigne[0]), denomination: String(uneLigne[1]), forme: String(uneLigne[2]), voieAdministration: String(uneLigne[3]), AMM: String(uneLigne[4]), labo: String(uneLigne[5]), surveillance: String(uneLigne[6]))
                retour.AMM.append(medoc)
            }
        }
        return retour
    }
    
    
    
}
