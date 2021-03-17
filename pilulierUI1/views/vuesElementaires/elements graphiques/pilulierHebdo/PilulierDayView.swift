//
//  PilulierDayView.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 15/03/2021.
//  Copyright © 2021 patrick lanneau. All rights reserved.
//

import SwiftUI

struct PilulierDayView: View {
    var unJour : String
    
    var body: some View {
        VStack(alignment: .leading) {
           
            Text(unJour)
                .font(.title)
            Divider()
            Text(MATIN)
            Divider()
            Text(MIDI)
            Divider()
            Text(SOIR)
            Divider()
            Text(NUIT)
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black,lineWidth: 2))
        
        
    }
}

struct PilulierDayView_Previews: PreviewProvider {
    static var previews: some View {
        PilulierDayView(unJour: "01/02/2020")
    }
}
