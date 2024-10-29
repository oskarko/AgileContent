//
//  MockFactory.swift
//  AgileContent
//
//  Created by Oscar Rodriguez Garrucho on 29/10/24
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2024 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation
@testable import AgileContent

final class MockFactory {
    
    func getRepos() -> [Repo] {
        [
            .init(id: 1,
                  name: "mockName1",
                  owner: Owner(login: "login1", id: 1, avatarUrl: ""),
                  url: "",
                  description: "mockDesc1",
                  language: "swift",
                  visibility: "public"),
            .init(id: 1,
                  name: "mockName2",
                  owner: Owner(login: "login1", id: 1, avatarUrl: ""),
                  url: "",
                  description: "mockDesc2",
                  language: "swift",
                  visibility: "public"),
            .init(id: 1,
                  name: "mockName3",
                  owner: Owner(login: "login1", id: 1, avatarUrl: ""),
                  url: "",
                  description: "mockDesc3",
                  language: "swift",
                  visibility: "public"),
            .init(id: 1,
                  name: "mockName4",
                  owner: Owner(login: "login1", id: 1, avatarUrl: ""),
                  url: "",
                  description: "mockDesc4",
                  language: "swift",
                  visibility: "public")
        ]
    }
}
