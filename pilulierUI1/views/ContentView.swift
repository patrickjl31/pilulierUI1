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
    
    @State var selection = 0
    var body: some View {
       
        
        TabView(selection: $selection,
                content:  {
                    //Text("Tous les patients")
                    TousLesPatientsView(datas: gd)
                        .tabItem {
                        Text("Tous les patients")
                        Image(systemName: "person.3.fill")
                        }.tag(0)
                    if gd.patientCourant > -1 {
                        //Text("Tab Content 2")
                        PatientCourantView(datas: gd)
                        .tabItem {
                            Text("Patient courant")
                            Image(systemName: "person.fill")
                        }.tag(1)
                    }
                    Text("Tab Content 3")
                        .tabItem {
                            Text("Mode d'emploi")
                            Image(systemName: "ellipses.bubble")
                        }.tag(1)
                })
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
