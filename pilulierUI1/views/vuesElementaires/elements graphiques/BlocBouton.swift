//
//  BlocBouton.swift
//  cafechangeUI
//
//  Created by patrick lanneau on 13/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct BlocBouton: View {
    
    var texte : String
    var body: some View {
        HStack {
            Spacer()
            GeometryReader { geometry in
                
                BigButton(texte: texte, largeur: geometry.size.width / 1.3)
                
            }
            Spacer()
        }
        }
}

struct BlocBouton_Previews: PreviewProvider {
    static var previews: some View {
        BlocBouton(texte: "Oh mon boutooonn!")
    }
}
