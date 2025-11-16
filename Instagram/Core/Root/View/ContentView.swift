//
//  ContentView.swift
//  Instagram
//
//  Created by Vahan Muradyan on 17.11.25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if let _ = viewModel.userSession {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
