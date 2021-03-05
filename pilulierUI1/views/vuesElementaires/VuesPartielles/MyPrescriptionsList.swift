//
//  MyPrescriptionsList.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 06/02/2021.
//  Copyright © 2021 patrick lanneau. All rights reserved.
//

import SwiftUI

struct MyPrescriptionsList: View {
    
    @ObservedObject var datas: GestionDonnees
    var prescriptions : Prescriptions
    
    @State private var refreshID = UUID()
    
    var body: some View {
        if datas.patientCourant > -1 {
            let moi : Patient = datas.lesPatients.l[datas.patientCourant]
        
        
            List {
                Section(header: Text("En cours :")) {
                    ForEach(moi.mesPrescriptions.enCours, id:\.id) { (prescription)  in
                        if let nom = prescription.identification.firstWord() {
                            HStack {
                                NavigationLink(nom, destination: NouvellePrescriptionView(datas: datas, idPrescription: prescription.id, identification: prescription.identification, pendantS: String(prescription.pendant), repeterTousLesS: String(prescription.repeterTousLes), prises: prescription.prises, posologie: prescription.posologie))
                                //Text(nom)
                                PosologieView(prescription: prescription)
                            }
                        } else {
                            Text("Inconnu")
                        }

                    }
                    .onDelete(perform: { indexSet in
                        delete(at: indexSet, inListe: 0)
                    })
                }
                Section(header: Text("Anciennes prescriptions :")) {
                    ForEach(moi.mesPrescriptions.terminees, id:\.id) { (prescription)  in
                        if let nom = prescription.identification.firstWord() {
                            HStack {
                                Text(nom)
                                PosologieView(prescription: prescription)
                            }
                        } else {
                            Text("Inconnu")
                        }

                    }
                    .onDelete(perform: { indexSet in
                        delete(at: indexSet, inListe: 1)
                        
                    })
                    .id(refreshID)
                }
                
                
                
            }
        }
        //on delete
        
    }
    
    //Fonction de délétion
    func delete(at offsets: IndexSet, inListe:Int)  {
        //remove
        datas.delPrescriptionFromCurrent(offset: offsets, inList: inListe)
        self.refreshID = UUID()
    }
}

struct MyPrescriptionsList_Previews: PreviewProvider {
    static var previews: some View {
        MyPrescriptionsList(datas: GestionDonnees(), prescriptions: Prescriptions())
    }
}


// Prescriptions(enCours: [Prescription(quoi: "doliprane", quand: Date(), pour: "8")], terminees: [Prescription(quoi: "virlix", quand: Date(), pour: "6")])

