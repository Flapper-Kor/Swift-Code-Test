//
//  ScaledImage.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI

struct ScaledImage: View {
    var body: some View {
        VStack{
            Image("dog")
                .resizable()
                .frame(height: 200)
            
            Image("dog")
                .resizable()
//                .scaledToFit()
//                .scaledToFill()
                .aspectRatio(contentMode: .fit) // 위 두 modifier와 같은 역할
                .frame(width: 250)
        }
    }
}

struct ScaledImage_Previews: PreviewProvider {
    static var previews: some View {
        ScaledImage()
    }
}
