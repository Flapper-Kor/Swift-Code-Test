//
//  PicturesUsingPhotosPicker.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/02.
//

import SwiftUI
import PhotosUI

/*
 If you want more control over the data that is selected, adjust the matching parameter based on what you’re looking for:

 Use matching: .screenshots if you only want screenshots.
 Use matching: .any(of: [.panoramas, .screenshots]) if you want either of those types.
 Use matching: .not(.videos) if you want any media that isn’t a video.
 Use matching: .any(of: [.images, .not(.screenshots)])) if you want all kinds of images except screenshots.
 If you want to let the user select multiple images, you should use an array of PhotosPickerItem objects then load them individually using a similar process:
 */

struct PicturesUsingPhotosPicker: View {

    var body: some View {
        VStack{
            UsingPhotosPicker_lesson1()
            UsingPhotosPicker_lesson2()
        }
    }
}


struct UsingPhotosPicker_lesson1: View{
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?

    var body: some View {
        VStack {
            PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)

            if let avatarImage {
                avatarImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
        }
        .onChange(of: avatarItem) { _ in
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        avatarImage = Image(uiImage: uiImage)
                        return
                    }
                }

                print("Failed")
            }
        }
    }
}
struct UsingPhotosPicker_lesson2: View{
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<selectedImages.count, id: \.self) { i in
                        selectedImages[i]
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                    }
                }
            }
            .toolbar {
                PhotosPicker("Select images", selection: $selectedItems, matching: .images)
            }
            .onChange(of: selectedItems) { _ in
                Task {
                    selectedImages.removeAll()

                    for item in selectedItems {
                        if let data = try? await item.loadTransferable(type: Data.self) {
                            if let uiImage = UIImage(data: data) {
                                let image = Image(uiImage: uiImage)
                                print("data============================", type(of: data))
                                selectedImages.append(image)
                            }
                        }
                    }
                }
            }
        }
    }
}
