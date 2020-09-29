//
//  NouvellePrescriptionView.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 28/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct NouvellePrescriptionView: View {
    
    @ObservedObject var datas:GestionDonnees
    @State var nom = ""
    @State var tousLesJours = false
    @State var repetition = "2"
    
    var body: some View {
        VStack{
          ZoneTitre(texte: "Prescription...")
            SearchList(datas: datas.AMMNoms, text: $nom)
          Toggle("A prendre tous les jours", isOn: $tousLesJours)
            .padding()
            if !tousLesJours{
                LigneRenseignement(titre: "A prendre tous les combien de jours ? ", reponse: $repetition)
            }
        }
    }
}

struct NouvellePrescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NouvellePrescriptionView(datas: GestionDonnees())
    }
}
