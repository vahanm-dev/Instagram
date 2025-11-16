//
//  Post.swift
//  Instagram
//
//  Created by Vahan Muradyan on 16.11.25.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    let user: User?
}

extension Post {
    static var mockPosts: [Post] = [
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "This is some test caption for now",
              likes: 123,
              imageUrl: "batman-2",
              timestamp: Date(),
              user: User.mockUsers[0]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "Wakanda Forever",
              likes: 104,
              imageUrl: "black-panther-1",
              timestamp: Date(),
              user: User.mockUsers[1])
    ]
}
