//
//  Strings+Ext.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

extension String {
    
    var localize: String {
        NSLocalizedString(self, comment: "")
    }
}
