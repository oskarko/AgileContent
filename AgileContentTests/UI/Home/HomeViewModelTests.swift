//
//  HomeViewModelTests.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest
@testable import AgileContent

final class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var mockHomeView: MockHomeView!
    var mockRouter: MockRouter!
    var mockService: MockService!
    
    override func setUp() {
        super.setUp()
        mockService = MockService()
        mockHomeView = MockHomeView()
        mockRouter = MockRouter()
        viewModel = HomeViewModel(mockService)
        viewModel.view = mockHomeView
        viewModel.router = mockRouter
    }
    
    override func tearDown() {
        viewModel = nil
        mockHomeView = nil
        mockRouter = nil
        mockService = nil
        super.tearDown()
    }

    func test_sendAction_search_withSuccess() throws {
        // Given
        mockHomeView.showErrorWasCalled = false
        mockService.shouldShowError = false
        mockRouter.showToDetailsWasCalled = false
        mockRouter.repos = []
        let expectation = XCTestExpectation(description: "Data fetched successfully")
        
        // When
        viewModel.sendAction(.search("oskarko"))
        
        // Hack-ish to wait for async code to be executed
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        
        // Then
        XCTAssertFalse(mockHomeView.showErrorWasCalled)
        XCTAssertTrue(mockRouter.showToDetailsWasCalled)
        XCTAssertTrue(mockRouter.repos.count == 4)
    }
    
    func test_sendAction_search_withFailure() throws {
        // Given
        mockHomeView.showErrorWasCalled = false
        mockService.shouldShowError = true
        mockRouter.showToDetailsWasCalled = false
        mockRouter.repos = []
        let expectation = XCTestExpectation(description: "Data didn't fetched")
        
        // When
        viewModel.sendAction(.search("oskarko"))
        
        // Hack-ish to wait for async code to be executed
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        
        // Then
        XCTAssertTrue(mockHomeView.showErrorWasCalled)
        XCTAssertTrue(mockHomeView.showErrorMessage == "server_wrong_error".localize)
        XCTAssertFalse(mockRouter.showToDetailsWasCalled)
        XCTAssertTrue(mockRouter.repos.count == 0)
    }

}
