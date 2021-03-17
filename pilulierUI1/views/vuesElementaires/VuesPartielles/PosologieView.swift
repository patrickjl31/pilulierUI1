//
//  PosologieView.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 07/02/2021.
//  Copyright © 2021 patrick lanneau. All rights reserved.
//

import SwiftUI

struct PosologieView: View {
    var prescription: Prescription
    
    var body: some View {
        VStack {
            if prescription.matin.count > 0 {
                Text("Prendre \(prescription.matin)")
            }
            if prescription.midi.count > 0 {
                Text("Prendre \(prescription.midi)")
            }
            if prescription.soir.count > 0 {
                Text("Prendre \(prescription.soir)")
            }
            if prescription.nuit.count > 0 {
                Text("Prendre \(prescription.nuit)")
            }
            Text(prescription.posologie)
        }
        .font(.footnote)
        
        
    }
    /*
    func prisesToText(prises: [Int])->String{
        var res:[String] = []
        let moments = MOMENTS_DU_JOUR
        for i in 0..<prises.count{
            if prises[i] > 0 && i < 4 {
                res.append(moments[i])
            }
        }
        var resS = ""
        for i in 0..<res.count {
            if i > 0 {
                resS += ", "
            }
            resS += res[i]
        }
        return resS
    }
 */
}

struct PosologieView_Previews: PreviewProvider {
    static var previews: some View {
        PosologieView(prescription: Prescription(quoi: "Medoc", quand: Date(), pour: "Bibi"))
    }
}
