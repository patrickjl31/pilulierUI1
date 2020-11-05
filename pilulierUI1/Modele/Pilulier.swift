//
//  Pilulier.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 05/10/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

enum periode: String,Codable {
    case matin
    case midi
    case soir
    case nuit
}

struct SimplePill {
    var aPill : [String] = []
}
