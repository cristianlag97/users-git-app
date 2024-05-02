//
//  GitHubUsers.swift
//  UsersGitApp
//
//  Created by Cristian David Laguna Aldana on 2/05/24.
//

import Foundation


struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String
    let bio: String?
}
