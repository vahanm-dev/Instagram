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
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        posts = try snapshot.documents.compactMap { try $0.data(as: Post.self) }
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let user = try await UserService.fetchUser(uid: ownerUid)
            posts[i].user = user
        }
    }
}
