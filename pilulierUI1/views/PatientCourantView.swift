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
    
    var body: some View {
        let monIndex = datas.patientCourant
        if monIndex > -1 {
            var moi : Patient = datas.lesPatients.l[monIndex]
            NavigationView {
                VStack{
                    ZoneTitre(texte: "Bonjour \(moi.prenom) \(moi.nom)")
                    ZoneTitre(texte: "Vos prescriptions à venir...")
                    // Liste des prescriptions
                    Button(action: {
                        NouvellePrescriptionView(datas: datas)
                    }, label: {
                        BigButton(texte: "Ajouter une prescription", largeur: 300)
                    })
                    
                }
                .navigationTitle("Fiche patient")
            }
        }
    }
}

struct PatientCourantView_Previews: PreviewProvider {
    static var previews: some View {
        PatientCourantView(datas: GestionDonnees())
    }
}
