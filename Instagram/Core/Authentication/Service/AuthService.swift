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
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() {
        
    }
}
