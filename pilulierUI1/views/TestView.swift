//
//  TestView.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 26/07/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct TestView: View {
    @State var transfertOut : String = ""
    @State var transfertIn : String = ""
    @State var etat = ""
    
    @State var patient:Patient = Patient(nom: "", prenom: "", fiche: FicheMedicale(), mesPrescriptions: Prescriptions())
    
    let nameFile = "testFichier1"
    let filer = Filer()
    var body: some View {
        VStack{
            TextField("Nom du patient", text: $patient.nom)
            TextField("Prénom", text: $patient.prenom)
            Text(patient.toJson() ??  "")
            Text("exporter le patient ?")
                .onTapGesture {
                    self.transfertOut = self.patient.toJson() ?? ""
                    self.filer.saveFile(fichier: self.transfertOut, toNom: self.nameFile)
                    self.etat = "Enregistrement de \(self.transfertOut) fait"
            }
            Text("Importer un patient ?")
                .onTapGesture {
                    self.transfertIn = self.filer.readFileFrom(nom: self.nameFile) ?? ""
                    self.etat = self.transfertIn ?? ""
                    self.etat = "J'ai lu \(self.etat)"
            }
            Text(etat)
            
            
            
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
