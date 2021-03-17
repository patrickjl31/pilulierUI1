//
//  StyleBouton.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 14/03/2021.
//  Copyright © 2021 patrick lanneau. All rights reserved.
//

import Foundation
import SwiftUI


extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

//---------------------
struct SimpleButtonStyle: ButtonStyle {
    func  makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(5)
            .background(
                Group{
                    if configuration.isPressed{
                        Capsule()
                            .fill(Color.offWhite)
                    } else {
                        Capsule()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                
                }
            )
    }
    
    
}
