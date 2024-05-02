//
//  UsersView.swift
//  UsersGitApp
//
//  Created by Cristian David Laguna Aldana on 2/05/24.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject private var usersVM: UserViewModel = UserViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            List {
                ForEach(usersVM.users, id: \.login) { user in
                    HStack {
                        AsyncImage(url: URL(string: user.avatarUrl)){ image in
                                image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(.circle)
                                
                        } placeholder: {
                            Circle()
                                .foregroundColor(.secondary)
                        }
                        .frame(width: 50, height: 50)
                        
                        Text(user.login)
                            .padding(.leading, 16)
                    }
                }
            }
            .listStyle(.plain)
            .ignoresSafeArea()
        }
        .padding()
    }
}

#Preview {
    UsersView()
}
