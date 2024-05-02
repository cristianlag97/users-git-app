//
//  ContentView.swift
//  UsersGitApp
//
//  Created by Cristian David Laguna Aldana on 2/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentTab = "Me"
    
    var body: some View {
        TabView(selection: $currentTab) {
            HomeView()
                .tag("Me")
                .tabItem{
                    Image(systemName: "person")
                    Text("ME")
                }
            
            UsersView()
                .tag("Users")
                .tabItem{
                    //Image(systemName: "person.2.circle.fill")
                    Image(systemName: "person.2")
                    Text("Users")
                }
        }
            
    }
}

#Preview {
    ContentView()
}
