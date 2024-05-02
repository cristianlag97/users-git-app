//
//  GEtUSer.swift
//  UsersGitApp
//
//  Created by Cristian David Laguna Aldana on 2/05/24.
//

import Foundation

class NetWorkServices {
    
    static let shared = NetWorkServices()
    
    
    
    func getUser() async throws -> GitHubUser {
        let endpoint = "https://api.github.com/users/cristianlag97"
        
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase // esto es para convertir user_id a userId
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            throw APIError.InvalidData
        }
        
    }
    
    func getUsers() async throws -> [GitHubUser] {
        let endpoint = "https://api.github.com/users"
        
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase // esto es para convertir user_id a userId
            return try decoder.decode([GitHubUser].self, from: data)
        } catch {
            throw APIError.InvalidData
        }
        
    }
    
}
