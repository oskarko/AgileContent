//  HomeViewController.swift
//  AgileContent
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func showError(_ errorMessage: String)
}


class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    // MARK: - Selectors

    @IBAction func continueButtonTapped(_ sender: UIButton) {
        viewModel.sendAction(.search(searchTextField.text ?? ""))
    }
    
    // MARK: - Helpers

    private func configureUI() {
        configureNavigationBar(withTitle: "home_title".localize,
                               prefersLargeTitles: true,
                               barTintColor: UIColor.agileContent)
        
        continueButton.setTitle("home_search_button_title".localize, for: .normal)
        continueButton.layer.cornerRadius = 8
        
        view.backgroundColor = .systemBackground
    }
    
}

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {
    
    func showError(_ errorMessage: String) {
        showErrorMessage(errorMessage)
    }
}
