//
//  TousLesPatientsView.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 04/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct TousLesPatientsView: View {
    
    @ObservedObject var datas: GestionDonnees
    //@ObservedObject var index: Int
    
    
    
    var body: some View {
        VStack {
            ZoneTitre(texte: TITRE_PAGE_PATIENTS)
            NavigationView {

                VStack(alignment: .center){
                    if datas.patientCourant > -1 {
                       //ForEach(0..<datas.lesPatients.count) {index
                        //ForEach(datas.lesPatients, id:\.id) {unPatient
                        List {
                            ForEach(datas.lesPatients.l, id:\.id) {unPatient in
                                let isCurrent = datas.isPatientCourant(patient: unPatient)
                                PatientListContainer(patient:unPatient, current: isCurrent, datas: datas)
                                    .background(isCurrent ? Color.yellow : Color.white)
                            }
                            .onDelete(perform: { indexSet in
                                datas.deletePatient(atOffset: indexSet)
                            })
                            
                            //les modifiers
                        }
                        .navigationTitle("Les patients")
                        
                    }
                    Spacer()
                    NavigationLink(
                        destination: NouveauPatientView(datas: datas, isNewCreation: true , nom: "", prenom : "", dateNaissance : "", poids : "", allergies : "", important : ""),
                        label: {
                            BigButton(texte: "Créer un nouveau patient", largeur: 250)
                        })
                    Spacer(minLength: 50)
                    
                }
                
            }
        }
    }
    
    
}

struct TousLesPatientsView_Previews: PreviewProvider {
    static var previews: some View {
        TousLesPatientsView(datas: GestionDonnees())
    }
}
