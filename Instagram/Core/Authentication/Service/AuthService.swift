//
//  AuthService.swift
//  Instagram
//
//  Created by Vahan Muradyan on 16.11.25.
//

import Foundation
import FirebaseAuth

@Observable
final class AuthService {
    
    static let shared = AuthService()
    
    var userSession: FirebaseAuth.User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Create user failed with error: \(error)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() {
        
    }
}
