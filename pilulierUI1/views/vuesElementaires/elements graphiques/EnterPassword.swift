//
//  EnterPassword.swift
//  cafechangeUI
//
//  Created by patrick lanneau on 13/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import SwiftUI

struct EnterPassword: View {
     var message : String
     @Binding var quoi: String
       
       
       var body: some View {
           HStack {
               //pencil.and.ellipsis.rectangle
               Image(systemName: "lock.fill")
               SecureField(message, text: $quoi)
           }
           .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
           .background(Color("gris9"))
           .cornerRadius(20)
           .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
       }
}

struct EnterPassword_Previews: PreviewProvider {
    static var previews: some View {
        EnterPassword(message: "rien", quoi: Binding.constant("Password"))
    }
}
