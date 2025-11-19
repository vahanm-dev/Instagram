//
//  User.swift
//  Instagram
//
//  Created by Vahan Muradyan on 14.11.25.
//

import Foundation
import FirebaseAuth

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return false
        }
        
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString,
              username: "batman",
              profileImageUrl: nil,
              fullname: "Bruce Wayne",
              bio: "Gotham's Dark Night",
              email: "betman@gmail.com"),
        .init(id: UUID().uuidString,
              username: "venum",
              profileImageUrl: nil,
              fullname: "Eddie Brock",
              bio: "venum",
              email: "venum@gmail.com"),
        .init(id: UUID().uuidString,
              username: "ironman",
              profileImageUrl: nil,
              fullname: "Tony Stark",
              bio: "Playboy & Billionaire",
              email: "ironman@gmail.com"),
        .init(id: UUID().uuidString,
              username: "spidermane",
              profileImageUrl: nil,
              fullname: "Peter Parker",
              bio: "spidermane",
              email: "plackpanther@gmail.com")
    ]
}
