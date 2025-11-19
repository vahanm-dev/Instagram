//
//  Post.swift
//  Instagram
//
//  Created by Vahan Muradyan on 16.11.25.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var mockPosts: [Post] = [
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "This is some test caption for now",
              likes: 123,
              imageUrl: "batman-2",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[0]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "Wakanda Forever",
              likes: 104,
              imageUrl: "black-panther-1",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[1])
    ]
}
