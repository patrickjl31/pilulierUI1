//
//  ExtensionString.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 07/02/2021.
//  Copyright © 2021 patrick lanneau. All rights reserved.
//

import Foundation

extension String {
    func firstWord() -> String? {
        return self.components(separatedBy: " ").first
    }
}
