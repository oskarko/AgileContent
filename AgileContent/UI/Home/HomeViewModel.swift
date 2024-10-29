//  HomeViewModel.swift
//  AgileContent
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

enum HomeAction {
    case search(String)
}

class HomeViewModel {
    
    // MARK: - Properties
    
    weak var view: HomeViewControllerProtocol?
    var router: HomeRouter?
    
    private var service: ServiceProtocol
    
    // MARK: - Lifecycle
        
    init(_ service: ServiceProtocol = ServiceImpl()) {
        self.service = service
    }
    
    // MARK: - Helpers
    
    func sendAction(_ action: HomeAction) {
        switch action {
        case .search(let profile):
            searchProfile(for: profile)
        }
    }
    
}

private extension HomeViewModel {
    
    func searchProfile(for username: String) {
        service.fetch(.profile(username)) { [weak self ] (result: ResultResponse<[Repo]>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let repos):
                DispatchQueue.main.async {
                    self.router?.toDetails(repos: repos)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.view?.showError(error.message ?? "")
                }
            }
        }
    }
    
}
