//
//  TileImage.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI

struct TileImage: View {
    var body: some View {
        VStack{
            Image("slash")
                .resizable(resizingMode: .tile)
            
            Image("slash")
                .resizable(capInsets: EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20), resizingMode: .tile)
        }
        
    }
}

struct TileImage_Previews: PreviewProvider {
    static var previews: some View {
        TileImage()
    }
}
