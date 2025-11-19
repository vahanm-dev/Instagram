//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Vahan Muradyan on 19.11.25.
//

import SwiftUI
import PhotosUI
import Firebase

@Observable
final class EditProfileViewModel {
    var profileImage: Image?
    var fullname = ""
    var bio = ""
    
    var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(from: selectedImage) } }
    }
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        profileImage = Image(uiImage: uiImage)
    }
}
