//
//  MainTabView.swift
//  Instagram
//
//  Created by Vahan Muradyan on 13.11.25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("", systemImage: "house") {
                NavigationStack {
                    FeedView()
                }
            }
            
            Tab("", systemImage: "magnifyingglass") {
                NavigationStack {
                    SearchView()
                }
            }
            
            Tab("", systemImage: "plus.square") {
                NavigationStack {
                    Text("Upload Posts")
                }
            }
            
            Tab("", systemImage: "heart") {
                NavigationStack {
                    Text("Notifications")
                }
            }
            
            Tab("", systemImage: "person") {
                NavigationStack {
                    CurrentUserProfileView(user: User.mockUsers[0])
                }
            }
        }
        .tint(.black)
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

#Preview {
    MainTabView()
}
