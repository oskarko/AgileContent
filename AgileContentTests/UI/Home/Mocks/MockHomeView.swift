//
//  MockHomeView.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
@testable import AgileContent

final class MockHomeView: HomeViewControllerProtocol {
    
    var showErrorWasCalled = false
    var showErrorMessage = ""
    
    func showError(_ errorMessage: String) {
        showErrorWasCalled = true
        showErrorMessage = errorMessage
    }
}
