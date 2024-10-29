//  DetailsRouter.swift
//  AgileContent
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct Details {
    let viewController: DetailsViewController
    let viewModel: DetailsViewModel
    let router: DetailsRouter
}

class DetailsRouter {
    
    // MARK: - Properties
    
    weak var viewController: DetailsViewController?

    // MARK: - Helpers
    
    static func getViewController(repos: [Repo]) -> DetailsViewController {
        let configuration = configureModule(repos: repos)

        return configuration.viewController
    }
    
    private static func configureModule(repos: [Repo]) -> Details {
        let viewController = DetailsViewController()
        let router = DetailsRouter()
        let viewModel = DetailsViewModel(repos)

        viewController.viewModel = viewModel

        viewModel.router = router
        viewModel.view = viewController

        router.viewController = viewController

        return Details(viewController: viewController, viewModel: viewModel, router: router)
    }
    
}
