//
//  DetailsViewModelTests.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest
@testable import AgileContent

final class DetailsViewModelTests: XCTestCase {

    var viewModel: DetailsViewModel!
    
    override func setUp() {
        super.setUp()
        let repos = MockFactory().getRepos()
        viewModel = DetailsViewModel(repos)

    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func test_numberOfRows() throws {
        // Given
        // When
        let numberOfRows = viewModel.numberOfRows()
        
        // Then
        XCTAssertTrue(numberOfRows == 4)
    }
    
    func test_getOwner() throws {
        // Given
        // When
        let owner = viewModel.getOwner()
        
        // Then
        XCTAssertTrue(owner?.login == "login1")
        XCTAssertTrue(owner?.id == 1)
        XCTAssertTrue(owner?.avatarUrl == "")
    }
    
    func test_getRepo_withSuccess() throws {
        // Given
        // When
        let repo = viewModel.getRepo(for: 0)
        
        // Then
        XCTAssertTrue(repo?.id == 1)
        XCTAssertTrue(repo?.description == "mockDesc1")
    }
    
    func test_getRepo_withError() throws {
        // Given
        // When
        let repo = viewModel.getRepo(for: 5)
        
        // Then
        XCTAssertNil(repo)
    }

}
