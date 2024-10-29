//
//  Owner.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

struct Owner: Codable {
    let login: String
    let id: Int32
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
    }
}
