//
//  OuvertureView.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 04/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct OuvertureView: View {
    
    //let filer = GestionDonnees.shared
    @ObservedObject var datas: GestionDonnees
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Test de listes")
//                NavigationLink(
//                    destination: NouvellePrescriptionView(datas: datas, datePrescription: "", nom: ""),
//                    label: {
//                        Text("Nouvelle prescription")
//                    })
                Text("testez ceci")
                NavigationLink(destination: TestView()) {
                    
                    Text("Accéder au test")
                }
                    NavigationLink(destination: ListeAMM(amm: datas.medicamentsAMM.AMM)) {
                        Text("Liste AMM (\(datas.medicamentsAMM.AMM.count))")
                    }
            }
                
        .navigationBarTitle("Pilulier")
            
        }
    }
}

struct OuvertureView_Previews: PreviewProvider {
    static var previews: some View {
        OuvertureView(datas: GestionDonnees())
    }
}
