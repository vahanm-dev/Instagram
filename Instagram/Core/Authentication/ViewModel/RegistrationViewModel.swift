//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by Vahan Muradyan on 17.11.25.
//

import Foundation

@Observable
final class RegistrationViewModel {
    var username = ""
    var email = ""
    var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
    }
}
