//
//  HomeView.swift
//  UsersGitApp
//
//  Created by Cristian David Laguna Aldana on 2/05/24.
//

import SwiftUI

struct HomeView: View {
    
    
    @StateObject var userVM: UserViewModel = UserViewModel()
    

    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: userVM.user?.avatarUrl ?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
                    
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
            .frame(width: 120, height: 120)
            
            Text(userVM.user?.login ??  "UserName")
                .bold()
                .font(.title3)
            
            Text(userVM.user?.bio ?? "This is where the github bio will go. Let's make it long so it spans two lines")
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
