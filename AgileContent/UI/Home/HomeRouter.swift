//  HomeRouter.swift
//  AgileContent
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class HomeRouter {
    
    // MARK: - Properties
    
    weak var viewController: HomeViewController?

    // MARK: - Helpers
    
    static func getViewController() -> UINavigationController {
        let configuration = configureModule()
        let navigationController = UINavigationController(rootViewController: configuration.vc)
        
        return navigationController
    }
    
    private static func configureModule() -> (vc: HomeViewController, vm: HomeViewModel, rt: HomeRouter) {
        let viewController = HomeViewController()
        let router = HomeRouter()
        let viewModel = HomeViewModel()

        viewController.viewModel = viewModel

        viewModel.router = router
        viewModel.view = viewController

        router.viewController = viewController

        return (viewController, viewModel, router)
    }
    
    // MARK: - Routes

    func toDetails(repos: [Repo]) {
//        let detailsView = DetailsRouter.getViewController(item: item)
//        self.viewController?.navigationController?.pushViewController(detailsView, animated: true)
    }
    
}
