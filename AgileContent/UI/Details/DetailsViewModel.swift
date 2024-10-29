//  DetailsViewModel.swift
//  AgileContent
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    // MARK: - Properties
    
    weak var view: DetailsViewControllerProtocol?
    var router: DetailsRouter?
    
    private let repos: [Repo]
    
    // MARK: - Lifecycle
        
    init(_ repos: [Repo]) {
        self.repos = repos
    }
    
    // MARK: - Helpers
    
    func numberOfRows() -> Int {
        repos.count
    }
    
    func getOwner() -> Owner? {
        repos.first?.owner
    }
    
    func getRepo(for row: Int) -> Repo? {
        guard row < repos.count else { return nil }
        
        return repos[row]
    }
}
