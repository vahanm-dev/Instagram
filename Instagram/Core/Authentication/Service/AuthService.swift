//
//  AuthService.swift
//  Instagram
//
//  Created by Vahan Muradyan on 16.11.25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
final class AuthService {
    
    static let shared = AuthService()
    
    var userSession: FirebaseAuth.User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
        } catch {
            print("DEBUG: Log in user failed with error: \(error)")
        }
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            await uploadUserData(userId: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG: Create user failed with error: \(error)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        userSession = nil
    }
    
    private func uploadUserData(userId: String, username: String, email: String) async {
        let user = User(id: userId, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
