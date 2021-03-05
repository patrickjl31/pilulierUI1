//
//  SearchBar.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 28/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI


struct SearchBar: View {

    var myList : [String]
    @Binding var searchText: String
    @State var voirListe = false

    var body: some View {
        VStack(alignment: .leading){
            
            TextField("Que cherchez-vous", text: $searchText, onEditingChanged: { (changed) in
                //trace = "changed : " + self.searchText
                //self.listeReduite = self.myList
                
                //self.voirListe = true
                //self.raz()
            }, onCommit: {
                //trace = "sorti"
                self.voirListe = false
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onChange(of: searchText) { value in
                if value.count > 1 {
                    self.voirListe = true
                } else {
                    self.voirListe = false
                }
            }
            
            if voirListe {
                
                List{
                    ForEach(self.myList.filter({ self.searchText.isEmpty ? true : $0.lowercased().hasPrefix(self.searchText.lowercased())
                    }), id: \.self) { elem in
                        Text(elem)
                        .onTapGesture {
                            self.searchText = elem
                            //self.listeReduite = []
                            self.voirListe = false
                        }
                    }
                }
                .environment(\.defaultMinListRowHeight, 6)
                .font(.caption)
                .padding()
                .frame(width: 300, height: 200)
                //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(myList: ["AFRIQUE DU SUD", "ALBANIE", "ALLEMAGNE", "ARGENTINE", "ARMENIE", "AUSTRALIE", "AUTRICHE", "AZERBAIDJAN", "BELGIQUE", "BIELORUSSIE", "BOLIVIE", "BOSNIE", "BRESIL", "BULGARIE", "CANADA", "CHILI", "CHINE", "CHYPRE", "COLOMBIE", "COREE", "CROATIE", "CUBA", "DANEMARK", "ESPAGNE", "ESTONIE", "ETATS-UNIS", "FINLANDE", "FRANCE", "GEORGIE", "GRANDE-BRETAGNE", "GRECE", "GUATEMALA", "HONGRIE", "IRAN", "IRLANDE", "ISLANDE", "ISRAEL", "ITALIE", "JAPON", "KAZAKHSTAN", "LETTONIE", "LIBAN", "LITUANIE", "LUXEMBOURG", "MALTE", "MAROC", "MEXIQUE", "MOLDAVIE", "MONACO", "MONGOLIE", "NORVEGE", "NOUVELLE-ZELANDE", "OUZBEKISTAN", "PARAGUAY", "PAYS-BAS", "PEROU", "PHILIPPINES", "POLOGNE", "PORTO-RICO", "PORTUGAL", "REP. TCHEQUE", "ROUMANIE", "RUSSIE", "SERBIE", "SINGAPOUR", "SLOVAQUIE", "SLOVENIE", "SUEDE", "SUISSE", "SYRIE", "TADJIKISTAN", "TAIWAN", "TUNISIE", "TURKMENISTAN", "TURQUIE", "UKRAINE", "URUGUAY", "VENEZUELA", "VIETNAM"], searchText: Binding.constant("?"))
    }
}
