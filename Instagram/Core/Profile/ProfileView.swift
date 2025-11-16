//
//  ProfileView.swift
//  Instagram
//
//  Created by Vahan Muradyan on 13.11.25.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var posts: [Post]  {
        return Post.mockPosts.filter { $0.user?.username == user.username }
    }
    
    var body: some View {
        ScrollView {
            ProfileHeaderView(user: user)
            
            PostGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.mockUsers[0])
}
