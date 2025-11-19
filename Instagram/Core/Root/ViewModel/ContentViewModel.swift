//
//  ContentViewModel.swift
//  Instagram
//
//  Created by Vahan Muradyan on 17.11.25.
//

import Foundation
import FirebaseAuth

@Observable
final class ContentViewModel {
    var userSession: FirebaseAuth.User? { service.userSession }
    var currentUser: User? { service.currentUser }
    
    private let service = AuthService.shared
    
//    let service = AuthService.shared
}
