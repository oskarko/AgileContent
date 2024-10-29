//
//  ProfileViewView.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24.
//
//  Copyright (c) 2024 Oscar R. Garrucho. All rights reserved.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//

import UIKit

final class ProfileView: UIView {
    
    // MARK: - Properties

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        Bundle.main.loadNibNamed(String(describing: ProfileView.self), owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // MARK: - Helpers

    func configure(with owner: Owner?) {
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.download(from: owner?.avatarUrl ?? "")
        profileName.text = owner?.login ?? ""
    }
}
