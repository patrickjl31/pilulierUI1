//
//  ContentView.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 26/07/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   
    //let filer = GestionDonnees.shared
    @ObservedObject var gd = GestionDonnees()
    
    var body: some View {
       
            
        NavigationView {
            VStack {
                Text("Test de listes")
                NavigationLink(
                    destination: NouvellePrescriptionView(datas: gd, nom: ""),
                    label: {
                        Text("Nouvelle prescription")
                    })
                Text("testez ceci")
                NavigationLink(destination: TestView()) {
                    
                    Text("Accéder au test")
                }
                    NavigationLink(destination: ListeAMM(amm: gd.medicamentsAMM.AMM)) {
                        Text("Liste AMM (\(gd.medicamentsAMM.AMM.count))")
                    }
            }
                
        .navigationBarTitle("Pilulier")
            
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
