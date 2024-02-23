//
//  SFSymbol.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI

struct SFSymbol: View {
    var body: some View {
        VStack{
            Image(systemName: "moon.stars.fill")
            
            Image(systemName: "wind.snow")
                .font(.largeTitle)
            
            Image(systemName: "cloud.heavyrain.fill")
//                .renderingMode(.template)
//                .renderingMode(.original)
                .font(.largeTitle)
                .foregroundStyle(.red)
            
            Image(systemName: "cloud.sun.rain.fill")
                .renderingMode(.original)
                .font(.largeTitle)
                .padding()
                .background(.black)
                .clipShape(Circle())
            
            Image(systemName: "person.crop.circle.fill.badge.plus")
                .renderingMode(.original)
                .foregroundStyle(.blue)
                .font(.largeTitle)
        }
        
    }
}

struct SFSymbol_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbol()
    }
}
