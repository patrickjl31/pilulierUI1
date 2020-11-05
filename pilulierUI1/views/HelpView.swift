//
//  HelpView.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 04/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack {
            ZoneTitre(texte: "Pilulier, mode d'emploi" )
            Text(HELP)
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 3, leading: 16, bottom: 3, trailing: 16))
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
