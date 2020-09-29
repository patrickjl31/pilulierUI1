//
//  ListeAMM.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 02/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct ListeAMM: View {
    
    var amm : [AMMObject]
    
    
    var body: some View {
        
        List {
            ForEach(amm, id: \.denomination) { (medoc)  in
                Text(medoc.denomination)
                    .font(.footnote)
            }
        }
    }
}

//
//struct ListeAMM_Previews: PreviewProvider {
//    static var previews: some View {
//        ListeAMM(amm: <#[AMMObject]#>)
//    }
//}

struct ListeAMM_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
