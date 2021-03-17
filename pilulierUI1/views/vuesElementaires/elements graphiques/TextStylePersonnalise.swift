//
//  TextStylePersonnalise.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 16/03/2021.
//  Copyright © 2021 patrick lanneau. All rights reserved.
//

import SwiftUI

struct TextStylePersonnalise: View {
    var texte : String
    var body: some View {
        Text(texte)
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(Color("BleuSombre"))
    }
}

struct TextStylePersonnalise_Previews: PreviewProvider {
    static var previews: some View {
        TextStylePersonnalise(texte: "Test")
    }
}
