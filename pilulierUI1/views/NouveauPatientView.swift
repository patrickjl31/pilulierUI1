//
//  NouveauPatientView.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 28/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct NouveauPatientView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var datas: GestionDonnees
    
    @State var isNewCreation:Bool
    // Reçoit un objet patient
    @State var nom:String //= ""
    @State var prenom :String //= ""
    @State var dateNaissance :String //= ""
    @State var poids :String //= ""
    @State var allergies :String //= ""
    @State var important :String //= "Ce qui est important : "
    
    
    var body: some View {
       //let newPatient = "Créez votre fiche patient..."
        VStack{
//            if !isNewCreation {
//                let courant = datas.patientCourant
//                if courant > -1 {
//                    let patientCourant = datas.lesPatients.l[courant]
//                    nom = patientCourant.nom
//                    prenom = patientCourant.prenom
//                    dateNaissance = patientCourant.fiche.anneeNaissance
//                    poids = patientCourant.fiche.poids
//                    allergies = patientCourant.fiche.allergies
//                }
//            }
            ZoneTitre(texte: appellation())
            Spacer()
            VStack{
                CreationPatient(datas: datas, isCraeation: $isNewCreation, nom: $nom, prenom: $prenom)
                LigneRenseignement(titre: "Date de naissance : ", style: .default, reponse: $dateNaissance)
                LigneRenseignement(titre: "Poids : ", style: .numberPad, reponse: $poids)
                LigneRenseignement(titre: "Allergies", style: .default, reponse: $allergies)
            }
            
            Divider()
            ZoneTitre(texte: "Tout ce qui est important...")
            TextEditor(text: $important)
            Spacer()
            Button(action: {
                datas.btnEnregistrerNewPatient(nom: nom, prenom: prenom,   anneeN: dateNaissance, poids: poids, allergies: allergies, important: important)
                // on quitte cette page
                self.presentationMode.wrappedValue.dismiss()
                print("Enregistrement")
                
            }, label: {
                //BigButton(texte: BTN_ENREGISTRER, largeur: 300)
                TextStylePersonnalise(texte: BTN_ENREGISTRER)
                
            })
            .buttonStyle(SimpleButtonStyle())
            Spacer()
        }
    }
    
    func appellation() -> String {
        let rep = "Créez votre fiche patient..."
        if isNewCreation {
            return rep
        } else {
            let index = datas.patientCourant
            if  index > -1 {
                let ident = datas.lesPatients.l[index].prenom + " " + datas.lesPatients.l[index].nom
                return "Modifiez ou complétez votre fiche patient, " + ident
            }
        }
        return rep
    }
}

struct NouveauPatientView_Previews: PreviewProvider {
    static var previews: some View {
        NouveauPatientView(datas: GestionDonnees(), isNewCreation: false,nom: "", prenom : "", dateNaissance : "", poids : "", allergies : "", important : "")
    }
}
