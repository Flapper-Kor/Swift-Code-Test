//
//  DrawUsingImageView.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI

struct DrawUsingImageView: View {
    var body: some View {
        VStack{
            Image("dog")
                .resizable()
                .scaledToFit()
            
            Image(uiImage: UIImage(named: "dog")!)
                .resizable()
                .scaledToFit()
            
            Image(systemName: "cloud.heavyrain.fill")
                .font(.largeTitle)
        }
    }
}

struct DrawUsingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DrawUsingImageView()
    }
}
