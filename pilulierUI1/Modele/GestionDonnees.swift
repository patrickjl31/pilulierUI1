//
//  GestionDonnees.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 26/07/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

class GestionDonnees: ObservableObject {
    public static let shared = GestionDonnees()
    let filer = Filer()
    let medicamentsAMM : AMMFile //= AMMFile(AMM: [])
    var AMMNoms:[String] = []
    
    var lesPatients : [Patient] = []
    
    init() {
        medicamentsAMM = filer.recallAMM()
        AMMNoms = medicamentsAMM.toAMMArray()
        
    }
    // String to JSON et inverse
    
    

}
