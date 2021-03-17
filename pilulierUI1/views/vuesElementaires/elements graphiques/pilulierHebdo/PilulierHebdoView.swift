//
//  PilulierHebdoView.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 15/03/2021.
//  Copyright © 2021 patrick lanneau. All rights reserved.
//

import SwiftUI

struct PilulierHebdoView: View {
    
    
    var body: some View {
        //let numDays = ["1","2","3","4","5","6","7"]
        VStack {
            Text("Votre pilulier")
            
            ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<7) { number in
                                PilulierDayView(unJour: Date().stringWithQuantieme())
                            }
                        }
                    }
        }
        
    }
}

struct PilulierHebdoView_Previews: PreviewProvider {
    static var previews: some View {
        PilulierHebdoView()
    }
}
