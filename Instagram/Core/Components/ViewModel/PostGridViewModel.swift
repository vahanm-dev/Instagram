//
//  PostGridViewModel.swift
//  Instagram
//
//  Created by Vahan Muradyan on 19.11.25.
//

import Foundation

@Observable
final class PostGridViewModel {
    private let user: User
    
    var posts: [Post] = []
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserPosts() }
    }
    
    func fetchUserPosts() async throws {
        posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< posts.count {
            posts[i].user = user
        }
    }
}
