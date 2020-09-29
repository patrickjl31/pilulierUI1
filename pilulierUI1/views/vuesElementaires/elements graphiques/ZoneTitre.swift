//
//  ZoneTitre.swift
//  cafechangeUI
//
//  Created by patrick lanneau on 14/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct ZoneTitre: View {
    
    var texte:String
    
    var body: some View {
        Text(texte)
            .foregroundColor(Color("BleuSombre"))
            .font(.headline)
            .multilineTextAlignment(.center)
            .background(Color.white.opacity(0.8))
            .padding()
            
    }
}

struct ZoneTitre_Previews: PreviewProvider {
    static var previews: some View {
        ZoneTitre(texte: "Un titre conséquent et qui ne prête pas à confusion")
    }
}
