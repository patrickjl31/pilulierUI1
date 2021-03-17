//
//  PatientListContainer.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 11/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct PatientListContainer: View {
    var patient:Patient
    var current: Bool
    
   var datas : GestionDonnees
    
    @State var modificationPatient = false
    
    var body: some View {
        //let check = (current ? )
        HStack {
            
            VStack{
                HStack{
                    Text(patient.nom)
                    Text(" ")
                    Text(patient.prenom)
                    Spacer()
                }
                .font(.title3)
                HStack{
                    Text("Né en \(patient.fiche.anneeNaissance), ")
                    Text("Poids : \(patient.fiche.poids) kg.")
                    Spacer()
                }
                .font(.footnote)
            }
            Spacer()
            if current {
                Image(systemName: "checkmark.circle")
                    .font(.title)
            }
            //Image(systemName: (current) ? "checkmark.circle" : "")
               // .font(.title)
        }
        
        .onTapGesture(count: 1, perform: {
            if let index = datas.getIndex(patient: patient) {
                datas.setPatientCourant(index: index)
            }

        })
        .gesture(LongPressGesture(minimumDuration: 1)
                    .onEnded{ _ in
                        modificationPatient.toggle()
                    }
        )
//        .onTapGesture(count: 2, perform: {
//            modificationPatient.toggle()
//        })

        .sheet(isPresented: $modificationPatient) {
            NouveauPatientView(datas: datas, isNewCreation: false, nom: patient.nom, prenom: patient.prenom, dateNaissance: patient.fiche.anneeNaissance, poids: patient.fiche.poids, allergies: patient.fiche.allergies, important: patient.remarques)
        }
    }
}

struct PatientListContainer_Previews: PreviewProvider {
    static var previews: some View {
        PatientListContainer(patient: Patient(nom: "Ducon", prenom: "Marcel"), current: true, datas: GestionDonnees())
    }
    
}
