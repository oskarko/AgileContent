//
//  APIErrorResponse.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

struct APIErrorResponse: Codable {
    var code: String?
    var message: String?

    enum CodingKeys: String, CodingKey {
        case code
        case message
    }

    init(code: String? = nil, message: String? = nil) {
        self.code = code
        self.message = message
    }

    static let badURL: APIErrorResponse = .init(message: "server_wrong_url".localize)
    static let invalidData: APIErrorResponse = .init(message: "server_wrong_data".localize)
    static let invalidJSON: APIErrorResponse = .init(message: "server_wrong_model".localize)
    static let userNotFound: APIErrorResponse = .init(message: "server_wrong_nickname".localize)
}
