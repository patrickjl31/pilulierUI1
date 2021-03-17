//
//  BaseBouton.swift
//  cafechangeUI
//
//  Created by patrick lanneau on 14/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct BaseBouton: View {
    var texte:String
    var body: some View {
        Text(self.texte)
            
            .font(.system(size: 16, weight:
            .black, design: .default))
            .foregroundColor(Color("BleuSombre"))
            .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
            .background(Color("bleu-tres-clair"))
            .border(Color("BleuSombre"))
       
            .cornerRadius(20)
        
            .overlay(Capsule(style: .continuous)
               //.border(Color(UIColor.red))
            .stroke(Color(UIColor.blue),lineWidth: 1)
               .border(Color(UIColor.clear)))
            .shadow(radius: 5)
        
        .padding(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3))
    }
}

struct BaseBouton_Previews: PreviewProvider {
    static var previews: some View {
        BaseBouton(texte: "touche-moi")
    }
}
