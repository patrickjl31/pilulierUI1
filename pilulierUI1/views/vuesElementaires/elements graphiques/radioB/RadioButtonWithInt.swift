//
//  RadioButtonWithInt.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 01/11/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct RadioButtonWithInt: View {
    var texte : String
    
    //Renvoie 0 ou 1
    @Binding var isLigth: Int
    
    var radioB: Image {Image(systemName: isLigth == 1 ? "smallcircle.fill.circle.fill" : "smallcircle.fill.circle")}
    
    
    var body: some View {
        
        Button(action: {//self.isLigth = !self.isLigth
            if (self.isLigth == 0) {
                isLigth = 1
            } else {
                isLigth = 0
            }
        })  {
            HStack {
                
                Text(texte)
                //Text(isLigth ? ": Oui" : ": Non")
                radioB
                //Image(systemName: isLigth ? "checkmark.circle" : "circle")
            }
        }
    }
    
}


struct RadioButtonWithInt_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonWithInt(texte: "Valeur", isLigth: Binding.constant(0))
    }
}
