//
//  SearchList.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 28/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct SearchList: View {
    
    //@ObservedObject var datas:GestionDonnees
    var datas:[String]
    @Binding var text:String
    
    var body: some View {
        VStack{
            //SearchBar(text: $text)
            if text.count > 0 {
            List(datas.filter{ text.isEmpty ? true: $0.capitalized.hasPrefix(self.text) }, id: \.self){ (item) in
                Text(item)
                    .font(.system(size: 10))
                    .onTapGesture(count: 1, perform: {
                        self.text = item
                        //UIResponder.resignFirstResponder(self)
                        
                    })
            }
            .environment(\.defaultMinListRowHeight, 10)
            .frame(width: 400, height: 200, alignment: .leading)
            }
        }
    }
}

struct SearchList_Previews: PreviewProvider {
    static var previews: some View {
        SearchList(datas: pays, text: Binding.constant(""))
    }
}
let pays = ["AFRIQUE DU SUD", "ALBANIE", "ALLEMAGNE", "ARGENTINE", "ARMENIE", "AUSTRALIE", "AUTRICHE", "AZERBAIDJAN", "BELGIQUE", "BIELORUSSIE", "BOLIVIE", "BOSNIE", "BRESIL", "BULGARIE", "CANADA", "CHILI", "CHINE", "CHYPRE", "COLOMBIE", "COREE", "CROATIE", "CUBA", "DANEMARK", "ESPAGNE", "ESTONIE", "ETATS-UNIS", "FINLANDE", "FRANCE", "GEORGIE", "GRANDE-BRETAGNE", "GRECE", "GUATEMALA", "HONGRIE", "IRAN", "IRLANDE", "ISLANDE", "ISRAEL", "ITALIE", "JAPON", "KAZAKHSTAN", "LETTONIE", "LIBAN", "LITUANIE", "LUXEMBOURG", "MALTE", "MAROC", "MEXIQUE", "MOLDAVIE", "MONACO", "MONGOLIE", "NORVEGE", "NOUVELLE-ZELANDE", "OUZBEKISTAN", "PARAGUAY", "PAYS-BAS", "PEROU", "PHILIPPINES", "POLOGNE", "PORTO-RICO", "PORTUGAL", "REP. TCHEQUE", "ROUMANIE", "RUSSIE", "SERBIE", "SINGAPOUR", "SLOVAQUIE", "SLOVENIE", "SUEDE", "SUISSE", "SYRIE", "TADJIKISTAN", "TAIWAN", "TUNISIE", "TURKMENISTAN", "TURQUIE", "UKRAINE", "URUGUAY", "VENEZUELA", "VIETNAM"]
