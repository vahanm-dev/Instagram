//
//  CreateUsernameVIew.swift
//  Instagram
//
//  Created by Vahan Muradyan on 14.11.25.
//

import SwiftUI

struct CreateUsernameView: View {
    @State private var username = ""
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            TextField("Username", text: $username)
                .textInputAutocapitalization(.none)
                .modifier(TextFieldModifier())
            
            NavigationLink {
                CreatePasswordView()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.vertical)
            
            Spacer()
        }
    }
}

#Preview {
    CreateUsernameView()
}
