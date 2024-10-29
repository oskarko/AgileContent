//
//  ServicePath.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

enum ServicePath {
    case profile(String)
    
    var urlString: String {
        switch self {
        case .profile(let nickname): return "https://api.github.com/users/\(nickname)/repos"
        }
    }
}
