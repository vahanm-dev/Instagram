//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Vahan Muradyan on 16.11.25.
//

import SwiftUI
import PhotosUI
import FirebaseAuth
import UIKit
import FirebaseFirestore

@Observable
final class UploadPostViewModel {
    var postImage: Image?
    var uiImage: UIImage?
    
    var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(from: selectedImage) } }
    }
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        postImage = Image(uiImage: uiImage)
        self.uiImage = uiImage
    }
    
    func uploadPost(caption: String) async throws {
        guard let uiImage else { return }
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else {
            return
        }
        
        let post = Post(id: postRef.documentID,
                        ownerUid: uid,
                        caption: caption,
                        likes: 0,
                        imageUrl: imageUrl,
                        timestamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {
            return
        }
        
        try await postRef.setData(encodedPost)
    }
}
