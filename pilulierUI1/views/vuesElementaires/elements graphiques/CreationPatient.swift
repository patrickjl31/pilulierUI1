//
//  CreationPatient.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 10/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI


struct CreationPatient: View {
    @ObservedObject  var datas: GestionDonnees
    @Binding var isCraeation:Bool
    // Reçoit un objet patient
    @Binding var nom:String
    @Binding var prenom:String
    
    
    var body: some View {
        VStack{
            LigneRenseignement(titre: "Nom : ", style: .default, reponse: $nom)
            LigneRenseignement(titre: "Prénom : ", style: .default, reponse: $prenom)
            if !isCraeation {
                Button(action: {
                        // Validation
                }, label: {
                    Text("Valider")
                })
            }
            
        }
    }
}

struct CreationPatient_Previews: PreviewProvider {
    static var previews: some View {
        CreationPatient(datas: GestionDonnees(), isCraeation: Binding.constant(true), nom: Binding.constant("Duchnoc"), prenom: Binding.constant("Marcel"))
    }
}
