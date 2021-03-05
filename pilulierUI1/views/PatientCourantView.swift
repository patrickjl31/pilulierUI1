//
//  PatientCourantView.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 28/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct PatientCourantView: View {
    @ObservedObject var datas: GestionDonnees
    
    //var moi: Patient courant
    // Gestion des prescriptions :
    // Un tableau des nouvelles prescriptions.
    //On passe à la vue nouvelle prescription une prescription en binding
    // Un bouton enregistrer permet d'enregistrer les nouvelles prescriptions
    // depuis le tableau local
    //Fonctions utilitaires locales : nettoyer le tableau prescription.
    @State var newsPrescriptions : [Prescription] = []
    
    var body: some View {
        let monIndex = datas.patientCourant
        if monIndex > -1 {
            let moi : Patient = datas.lesPatients.l[monIndex]
            NavigationView {
                VStack{
                    ZoneTitre(texte: "Bonjour \(moi.prenom) \(moi.nom)")
                    ZoneTitre(texte: "Vos prescriptions à venir...")
                    // Liste des prescriptions
                    
                    //MyPrescriptionsList(prescriptions: moi.mesPrescriptions)
                    MyPrescriptionsList(datas: datas, prescriptions: moi.mesPrescriptions)
                    // On passe la prescription qui sera modifiée
                    //nouvelle prescription
                    NavigationLink("Ajouter une prescription", destination: NouvellePrescriptionView(datas: datas, idPrescription: "", identification: "", pendantS: "8", repeterTousLesS: "1", prises: [0,1,0,0], posologie: ""))
                    Spacer(minLength: 10)
//                    Button(action: {
//                        // Pour une nouvelle prescription, id = ""
//                        //On créera la prescription
//                        NavigationLink("Ajouter une prescription", destination: NouvellePrescriptionView(datas: datas, idPrescription: ""))
//                        NouvellePrescriptionView(datas: datas, idPrescription: "")
//                    }, label: {
//                        BigButton(texte: "Ajouter une prescription", largeur: 300)
//                    })
                    
                }
                .navigationTitle("Fiche patient")
            }
        }
    }
    // Fonctions locales
    
}

struct PatientCourantView_Previews: PreviewProvider {
    static var previews: some View {
        PatientCourantView(datas: GestionDonnees())
    }
}
