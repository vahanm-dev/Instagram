//
//  EditProfileView.swift
//  Instagram
//
//  Created by Vahan Muradyan on 19.11.25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel = EditProfileViewModel()
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button("Done") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.bold)
                }
                .padding(.horizontal)
                
                Divider()
            }
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .foregroundStyle(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .foregroundStyle(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    }
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            VStack {
                EditProfileRowView(title: "Name",
                                   placeholder: "Enter your name...",
                                   text: $viewModel.fullname)
                
                EditProfileRowView(title: "Bio",
                                   placeholder: "Enter your bio...",
                                   text: $viewModel.bio)
            }
            
            Spacer()
        }
    }
}

#Preview {
    EditProfileView()
}
