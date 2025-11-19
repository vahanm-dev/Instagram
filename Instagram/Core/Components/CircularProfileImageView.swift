//
//  CircularProfileImageView.swift
//  Instagram
//
//  Created by Vahan Muradyan on 19.11.25.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case eSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .eSmall:
            40
        case .small:
            48
        case .medium:
            64
        case .large:
            80
        }
    }
}

struct CircularProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.MOCK_USERS[0], size: .large)
}
