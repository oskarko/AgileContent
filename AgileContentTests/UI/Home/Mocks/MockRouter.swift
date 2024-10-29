//
//  MockRouter.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
@testable import AgileContent

final class MockRouter: HomeRouter {
    
    var showToDetailsWasCalled = false
    var repos: [Repo] = []
    
    override func toDetails(repos: [Repo]) {
        showToDetailsWasCalled = true
        self.repos = repos
    }
}
