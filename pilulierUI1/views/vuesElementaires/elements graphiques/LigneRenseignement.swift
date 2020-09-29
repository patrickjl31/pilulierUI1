//
//  LigneRenseignement.swift
//  cafechangeUI
//
//  Created by patrick lanneau on 14/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct LigneRenseignement: View {
    var titre: String
    @Binding var reponse: String
    var body: some View {
        
        HStack {
            Text(titre)
            //TextField(titre, text: $reponse)
            ZoneEntree(message: titre, quoi: $reponse)
            Spacer()
        }
        .padding(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3))
    }
}

struct LigneRenseignement_Previews: PreviewProvider {
    static var previews: some View {
        LigneRenseignement(titre: "Nom : ", reponse: Binding.constant("Duchnoc"))
    }
}
