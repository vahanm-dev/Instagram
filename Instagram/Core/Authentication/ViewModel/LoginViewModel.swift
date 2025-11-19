//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Vahan Muradyan on 19.11.25.
//

import Foundation

@Observable
final class LoginViewModel {
    var email = ""
    var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
