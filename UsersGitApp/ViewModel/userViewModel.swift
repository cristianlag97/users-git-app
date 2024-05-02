//
//  userViewModel.swift
//  UsersGitApp
//
//  Created by Cristian David Laguna Aldana on 2/05/24.
//

import Foundation

class UserViewModel: ObservableObject { // el observabe es para que el view escuche los cambios que pasan acá en el view model
    
    @Published var user: GitHubUser?
    @Published var users: [GitHubUser] = []
    
    init() {
        getMyUser() // cuando se inicialice el view model la función se ejecutará
        getAllUsers()
    }
    
    private func getMyUser() {
        Task { @MainActor in
            self.user = try await NetWorkServices.shared.getUser()
        }
    }
    
    private func getAllUsers() {
        Task { @MainActor in
            self.users = try await NetWorkServices.shared.getUsers()
        }
    }
 
}
