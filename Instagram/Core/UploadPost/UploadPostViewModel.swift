//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Vahan Muradyan on 16.11.25.
//

import SwiftUI
import PhotosUI

@Observable
final class UploadPostViewModel {
    var postImage: Image?
    
    var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(from: selectedImage) } }
    }
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        postImage = Image(uiImage: uiImage)
    }
}
