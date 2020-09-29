//
//  BigButton.swift
//  cafechangeUI
//
//  Created by patrick lanneau on 17/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct BigButton: View {
    var texte: String
    var largeur : CGFloat
    
    var body: some View {
        Text(self.texte)
            .font(.system(size: 18, weight:
                .black, design: .default))
            .foregroundColor(Color(UIColor.white))
            .frame(width: largeur, height: 30, alignment: .center)
             
            //.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .background(Color("BleuClair"))
            .cornerRadius(20)
            .overlay(Capsule(style: .continuous)
                //.border(Color(UIColor.red))
             .stroke(Color(UIColor.blue),lineWidth: 1)
                .border(Color(UIColor.clear))
        )
            .shadow(radius: 10)
    }
}

struct BigButton_Previews: PreviewProvider {
    static var previews: some View {
        BigButton(texte: "Oh mon boutooonnn !", largeur: 250)
    }
}
