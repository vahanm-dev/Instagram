//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Vahan Muradyan on 19.11.25.
//

import Foundation
import FirebaseFirestore

@Observable
final class FeedViewModel {
    var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    func fetchPosts() async throws {
        posts = try await PostService.fetchFeedPosts()
    }
}
