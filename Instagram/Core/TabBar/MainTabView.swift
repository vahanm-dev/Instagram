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
                    Text("Feed")
                }
            }
            
            Tab("", systemImage: "magnifyingglass") {
                NavigationStack {
                    Text("Search")
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
                    Text("Profile")
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
