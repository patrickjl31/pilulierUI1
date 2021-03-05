//
//  RadioButton.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 01/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct RadioButton: View {
    var texte : String
    
    @Binding var isLigth: Bool
    
    //var radioB: Image {Image(systemName: isLigth ? "smallcircle.fill.circle.fill" : "smallcircle.fill.circle")}
    
    
    var body: some View {
        
        Button(action: {//self.isLigth = !self.isLigth
            self.isLigth.toggle()
        })  {
            HStack {
                
                Text(texte)
                //Text(isLigth ? ": Oui" : ": Non")
                //radioB
                Image(systemName: isLigth ? "smallcircle.fill.circle.fill" : "smallcircle.fill.circle")
                //Image(systemName: isLigth ? "checkmark.circle" : "circle")
            }
        }
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        RadioButton(texte: "Valeur", isLigth: Binding.constant(false))
    }
}
