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
    
    var body: some View {
        NavigationView {
            VStack{
                ZoneTitre(texte: "Bonjour X")
                ZoneTitre(texte: "Vos prescriptions à venir...")
                // Liste des prescriptions
                BigButton(texte: "Ajouter une prescription", largeur: 300)
            }
            .navigationTitle("Fiche patient")
        }
    }
}

struct PatientCourantView_Previews: PreviewProvider {
    static var previews: some View {
        PatientCourantView(datas: GestionDonnees())
    }
}
