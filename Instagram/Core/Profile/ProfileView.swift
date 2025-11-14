//
//  ProfileView.swift
//  Instagram
//
//  Created by Vahan Muradyan on 13.11.25.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            // header
            VStack(spacing: 10) {
                // pic and stats
                HStack {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        UserStatView(value: 3, title: "Posts")
                        
                        UserStatView(value: 4, title: "Followers")
                        
                        UserStatView(value: 12, title: "Following")
                    }
                }
                .padding(.horizontal)
                
                // name and bio
                VStack(alignment: .leading, spacing: 4) {
                    if let fullname = user.fullname {
                        Text(fullname)
                            .fontWeight(.semibold)
                    }
                    
                    if let bio = user.bio {
                        Text(bio)
                    }
                }
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // action button
                Button("Edit Profile") {
                    //
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360, height: 32)
                .foregroundStyle(.black)
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(.gray, lineWidth: 1)
                }
                
                Divider()
            }
            
            // post grid view
            LazyVGrid(columns: gridItems, spacing: 1) {
                ForEach(0 ... 15, id: \.self) { _ in
                    Image(.blackPanther1)
                        .resizable()
                        .scaledToFill()
                }
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension ProfileView {
    private var gridItems: [GridItem] {
        [
            .init(.flexible(), spacing: 1),
            .init(.flexible(), spacing: 1),
            .init(.flexible(), spacing: 1)
        ]
    }
}

#Preview {
    ProfileView(user: User.mockUsers[0])
}
