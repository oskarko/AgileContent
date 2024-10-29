//
//  ServiceProtocol.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    func fetch<T: Decodable>(_ type:ServicePath, completion: @escaping (ResultResponse<T>) -> Void)
}
