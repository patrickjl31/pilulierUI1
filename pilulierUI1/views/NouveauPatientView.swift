//
//  NouveauPatientView.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 28/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct NouveauPatientView: View {
    
    @State var nom:String = ""
    @State var prenom = ""
    @State var dateNaissance = ""
    @State var poids = ""
    @State var important = "Ce qui est important : "
    
    
    var body: some View {
       
        VStack{
            ZoneTitre(texte: "Créez votre fiche patient...")
            Spacer()
            LigneRenseignement(titre: "Nom : ", reponse: $nom)
            LigneRenseignement(titre: "Prénom : ", reponse: $prenom)
            LigneRenseignement(titre: "Date de naissance : ", reponse: $dateNaissance)
            LigneRenseignement(titre: "Poids : ", reponse: $poids)
            Divider()
            ZoneTitre(texte: "Tout ce qui est important...")
            TextEditor(text: $important)
            Spacer()
            
        }
    }
}

struct NouveauPatientView_Previews: PreviewProvider {
    static var previews: some View {
        NouveauPatientView()
    }
}
