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
    
    var datePrescription:String? // la date éventuelle de première prescription
    @State var nom = ""
    @State var tousLesJours = false
    @State var repetition = "1"
    @State var pendant = "8"
    //@State var aPrendre = [false,true,false,false]
    @State var aPrendre = [0,1,0,0]
    @State var posologie = ""
    var myId = ""
    
    var body: some View {
        
        VStack{
            let pour = prescritPour()
          ZoneTitre(texte: "Prescription...\(pour)")
            if let date = datePrescription,
               date.count > 0 {
                Text("Etablie le \(date)")
            }
            SearchList(datas: datas.AMMNoms, text: $nom)
          Toggle("A prendre tous les jours", isOn: $tousLesJours)
            .padding()
            if !tousLesJours{
                LigneRenseignement(titre: "A prendre tous les combien de jours ? ", reponse: $repetition)
            }
            Text("A prendre :")
            HStack{
                RadioButtonWithInt(texte: "Matin", isLigth: $aPrendre[0])
                //RadioButtonWithInt(texte: <#T##String#>, isLigth: <#T##Binding<Int>#>)
                Spacer()
                RadioButtonWithInt(texte: "Midi", isLigth: $aPrendre[1])
                Spacer()
                RadioButtonWithInt(texte: "Soir", isLigth: $aPrendre[2])
                Spacer()
                RadioButtonWithInt(texte: "Nuit", isLigth: $aPrendre[3])
            }
            .padding()
            HStack{
                LigneRenseignement(titre: "Pendant : ", reponse: $pendant )
                Text(" jour(s)")
            }
            LigneRenseignement(titre: "Posologie : ", reponse: $posologie)
            Button(action: {
                saveMe()
                //datas.btnSaveNewPrescription(idPresrcription: id, nom: nom, pendant: pendant, repeter: repetition, prises: aPrendre, posologie: posologie)
            }, label: {
                BigButton(texte: "Enregistrer la prescription", largeur: 300)
            })
        }
    }
    
    func prescritPour()->String  {
        let index = datas.patientCourant
        if index > -1 {
            return datas.lesPatients.l[index].prenom + datas.lesPatients.l[index].nom
        }
        return ""
    }
    func saveMe()  {
        
        
        //self.datas.btnSaveNewPrescription(idPresrcription: id, nom: nom, pendant: pendant, repeter: repetition, prises: aPrendre, posologie: posologie)
    }
    
}

struct NouvellePrescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NouvellePrescriptionView(datas: GestionDonnees(), datePrescription: "")
    }
}
