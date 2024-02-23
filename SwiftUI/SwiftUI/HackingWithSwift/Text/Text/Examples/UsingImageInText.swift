//
//  UsingImageInText.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

import SwiftUI

struct UsingImageInText: View {
    var body: some View {
        
        VStack{
            Label("Your account", systemImage: "folder.circle")
            Label("Welcome to the app", image: "star")
            Label("Your account", systemImage: "person.crop.circle")
                .font(.title)
            
            VStack {
                Label("Text Only", systemImage: "heart")
                    .font(.title)
                    .labelStyle(.titleOnly)

                Label("Icon Only", systemImage: "star")
                    .font(.title)
                    .labelStyle(.iconOnly)

                Label("Both", systemImage: "paperplane")
                    .font(.title)
                    .labelStyle(.titleAndIcon)
            }
            
            Label {
                Text("Paul Hudson")
                    .foregroundStyle(.primary)
                    .font(.largeTitle)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .clipShape(Capsule())
            } icon: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.sRGB, red: 0, green: 0, blue: 1, opacity: 0.2))
                        .frame(width: 50, height: 50)
                    Image("star")
                        .opacity(0.4)
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
}

struct UsingImageInText_Previews: PreviewProvider {
    static var previews: some View {
        UsingImageInText()
    }
}
