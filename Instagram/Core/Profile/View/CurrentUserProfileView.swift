//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Vahan Muradyan on 14.11.25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    
    var posts: [Post]  {
        return Post.mockPosts.filter { $0.user?.username == user.username }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: user)
                
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.mockUsers[0])
}
