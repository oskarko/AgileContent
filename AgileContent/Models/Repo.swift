//
//  Repo.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

struct Repo: Codable {
    let id: Int32
    let name: String?
    let owner: Owner
    let url: String?
    let description: String?
    let language: String?
    let visibility: String?
}
