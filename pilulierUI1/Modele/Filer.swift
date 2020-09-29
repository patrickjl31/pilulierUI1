//
//  Filer.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 30/08/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation


class Filer {
    
    // MARK: Gestion des enregistrements de données --------------------------------------
    //----- Gestion des enregistrements de données---
    //Sauvegarder les patients(lesPatients)
    
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    func saveFileTo(fichier:String, nom:String){
        let nomWithExtension = nom + ".txt"
        let url = self.getDocumentsDirectory().appendingPathComponent(nomWithExtension)
        do {
            try fichier.write(to: url, atomically: true, encoding: .utf8)
            
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
