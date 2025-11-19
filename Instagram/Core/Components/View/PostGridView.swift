//
//  PostGridView.swift
//  Instagram
//
//  Created by Vahan Muradyan on 16.11.25.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    @State private var viewModel: PostGridViewModel
    
    init(user: User) {
        _viewModel = State(wrappedValue: PostGridViewModel(user: user))
    }
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension,
                           height: imageDimension)
                    .clipped()
            }
        }
    }
}

private extension PostGridView {
    var imageDimension: CGFloat { (UIScreen.main.bounds.width / 3) - 1 }
    
    var gridItems: [GridItem] {
        [
            .init(.flexible(), spacing: 1),
            .init(.flexible(), spacing: 1),
            .init(.flexible(), spacing: 1)
        ]
    }
}

#Preview {
    PostGridView(user: User.MOCK_USERS[0])
}
