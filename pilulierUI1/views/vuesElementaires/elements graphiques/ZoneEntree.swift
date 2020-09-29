//
//  ZoneEntree.swift
//  cafechangeUI
//
//  Created by patrick lanneau on 12/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct ZoneEntree: View {
    
    var message : String
    @Binding var quoi: String
    
    
    var body: some View {
        HStack {
            //pencil.and.ellipsis.rectangle
            Image(systemName: "pencil")
            TextField(message, text: $quoi)
            
        }
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .background(Color("gris9"))
        .cornerRadius(20)
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
    }
}

struct ZoneEntree_Previews: PreviewProvider {
    static var previews: some View {
        ZoneEntree(message: "Rien", quoi: Binding.constant("rrrrrrrrrrr"))
    }
}
