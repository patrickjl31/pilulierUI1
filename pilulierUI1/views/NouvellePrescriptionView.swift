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
    // L'identificateur de la prescription. Si nouvelle id = ""
    var idPrescription : String
    //@State var prescription:Prescription
    @State var identification: String
    @State var ordonneLe : String = "" // transformer en double pour les calculs de dateDouble, date de création
    var renouveleLe : String = "" // transformer en double pour les calculs de dateDouble, dernière date d'ordonnance
    //var pendant : Int = 8
    @State var pendantS : String
    // Initialiser repeterTousMes à 1
    @State var tousLesJours = true
    //@State var repeterTousLes: Int = 1
    @State var repeterTousLesS: String 
    @State var prises : [Int]
    @State var prisesBool = [false,true,false,false]
    @State var posologie: String 

    
    
    var body: some View {
        //let pour = prescritPour()
        getName(id: idPrescription)
        return VStack{
            //let pour = prescritPour()
            ZoneTitre(texte: "Prescription...")
            if idPrescription != "", ordonneLe == renouveleLe {
                Text("Etablie le \(ordonneLe)")
            }
            //SearchList(datas: datas.AMMNoms, text: $identification)
            Text("Spécialité :")
            if idPrescription != "" {
                SearchBar(myList: datas.AMMNoms, searchText: $identification)
            } else {
                //getName(id: idPrescription)
                Text(identification)
            }
            
            Toggle("A prendre tous les jours", isOn: $tousLesJours)
            .padding()
            if !tousLesJours{
                LigneRenseignement(titre: "A prendre tous les combien de jours ? ", style: .decimalPad, reponse: $repeterTousLesS)
                
                
                //prescription.repeterTousLes = Int(repetition) ?? 1
            } 
            
            VStack{
                Text("A prendre :")

                HStack{
                    //RadioButton(texte: "Matin", isLigth: $prisesBool[0])
                    RadioButtonWithInt(texte: "Matin", isLigth: $prises[0])
                    Spacer()
                    RadioButtonWithInt(texte: "Midi", isLigth: $prises[1])
                    Spacer()
                    RadioButtonWithInt(texte: "Soir", isLigth: $prises[2])
                    Spacer()
                    RadioButtonWithInt(texte: "Nuit", isLigth: $prises[3])
                }
                .padding()

            }
            HStack{
                LigneRenseignement(titre: "Pendant : ", style: .decimalPad, reponse: $pendantS )
                Text(" jour(s)")
            }
            LigneRenseignement(titre: "Posologie : ", style: .default, reponse: $posologie)
            Button(action: {
                saveMe()
//                //datas.btnSaveNewPrescription(idPresrcription: id, nom: nom, pendant: pendant, repeter: repetition, prises: aPrendre, posologie: posologie)
           }, label: {
                BigButton(texte: "Enregistrer la prescription", largeur: 300)
            })
        }
    }
    
//    func prescritPour()->String  {
//        let index = datas.patientCourant
//        if index > -1 {
//            return datas.lesPatients.l[index].prenom + datas.lesPatients.l[index].nom
//        }
//        return ""
//    }
    func saveMe()  {
        //prises = boolArray(myArray: prisesBool)
        let pendant = secureStringToInt(s: pendantS)
        let repeterTousLes = secureStringToInt(s: repeterTousLesS)
        //self.datas.btnSaveNewPrescription(idPrescription: idPrescription, nom: identification, pendant: pendant, repeter: repeterTousLes, prises: prises, posologie: posologie)
        self.datas.btnSaveNewPrescription(idPrescription: idPrescription, ident: identification, pendant: pendant, repeter: repeterTousLes, prises: prises, posologie: posologie)
    }
    
    func boolArray(myArray:[Bool]) -> [Int] {
        var res:[Int] = []
        for elem in myArray {
            if elem {
                res.append(1)
            } else {
                res.append(0)
            }
        }
        return res
    }
    
    func secureStringToInt(s: String) -> Int {
        if let temp = Int(s) {
            return temp
        }
        return 1
    }
    
    func getName(id : String) {
        if id.count > 0 {
            identification = datas.lesPatients.l[datas.patientCourant].getNamePrescriptionWithId(myId: id)
        }
    }
//
}

struct NouvellePrescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NouvellePrescriptionView(datas: GestionDonnees(), idPrescription: "", identification: " machin", ordonneLe: "12/1/20", renouveleLe: "", pendantS: "8", repeterTousLesS: "1", prises: [0,1,0,0], posologie: "")
    }
}
 
 
