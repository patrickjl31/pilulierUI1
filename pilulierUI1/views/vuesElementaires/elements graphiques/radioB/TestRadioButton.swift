//
//  TestRadioButton.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 01/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct TestRadioButton: View {
    
    @State var isChecked : Bool = true
    
    @State var checked : Int = 1
    
    var body: some View {
        
        VStack {
            RadioButton(texte: "Test de radio bouton", isLigth: $isChecked)
            Text(isChecked ? "Checked" : "non appuyé")
            
            RadioButtonWithInt(texte: "Test de radio bouton Int", isLigth: $checked)
            Text(checked == 1 ? "Checked" : "non appuyé")
        }
    }
}

struct TestRadioButton_Previews: PreviewProvider {
    static var previews: some View {
        TestRadioButton(isChecked: true)
    }
}
