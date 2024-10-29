//  DetailsViewController.swift
//  AgileContent
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: DetailsViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureUI()
        tableView.reloadData()
    }
    
    // MARK: - Helpers

    private func configureTableView() {
        tableView.backgroundColor = .agileContent
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
}

// MARK: - DetailsViewControllerProtocol

protocol DetailsViewControllerProtocol: AnyObject {}
extension DetailsViewController: DetailsViewControllerProtocol {}

// MARK: - UITableViewDataSource

extension DetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileView()
        let owner = viewModel.getOwner()
        header.configure(with: owner)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let repo = viewModel.getRepo(for: indexPath.row)
        
        var listContentConfiguration = UIListContentConfiguration.cell()
        listContentConfiguration.text = repo?.name ?? ""
        listContentConfiguration.secondaryText = repo?.language ?? ""
        listContentConfiguration.secondaryTextProperties.color = .gray
        
        cell.contentConfiguration = listContentConfiguration
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // v2? 😄
    }
}
