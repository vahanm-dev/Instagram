//
//  PostGridView.swift
//  Instagram
//
//  Created by Vahan Muradyan on 16.11.25.
//

import SwiftUI

struct PostGridView: View {
    let posts: [Post]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(posts) { post in
                Image(post.imageUrl)
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
    PostGridView(posts: Post.mockPosts)
}
