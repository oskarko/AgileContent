//
//  MockService.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
@testable import AgileContent

final class MockService: ServiceProtocol {
    var shouldShowError = false
    var error: APIErrorResponse = .genericError
    let mockRepos: [Repo] = MockFactory().getRepos()
    
    func fetch<T: Decodable>(_ type: ServicePath, completion: @escaping (ResultResponse<T>) -> Void) {
        if shouldShowError {
            completion(.failure(error))
        } else {
            do {
                let data = try JSONEncoder().encode(mockRepos)
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(self.error))
            }
            
        }
    }

}
