//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Vahan Muradyan on 19.11.25.
//

import Foundation

@Observable
final class SearchViewModel {
    var users: [User] = []
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    func fetchAllUsers() async throws {
        users = try await UserService.fetchAllUsers()
    }
}
