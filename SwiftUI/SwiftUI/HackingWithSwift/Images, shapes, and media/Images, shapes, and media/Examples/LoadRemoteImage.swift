//
//  LoadRemoteImage.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/02.
//

import SwiftUI

struct LoadRemoteImage: View {
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "https://www.google.co.kr/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"), scale: 2) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 350, height: 128)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}

struct LoadRemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadRemoteImage()
    }
}
