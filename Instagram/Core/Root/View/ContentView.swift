//
//  ContentView.swift
//  Instagram
//
//  Created by Vahan Muradyan on 17.11.25.
//

import SwiftUI

struct ContentView: View {
    @State private var contentViewModel = ContentViewModel()
    @State private var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if contentViewModel.userSession == nil {
                LoginView()
                    .environment(registrationViewModel)
            } else if let currentUser = contentViewModel.currentUser {
                MainTabView(user: currentUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
