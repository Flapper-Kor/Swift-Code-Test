//
//  CustomizeSFSymbol.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/02.
//

import SwiftUI

struct CustomizeSFSymbol: View {
    var body: some View {
        VStack{
            Image(systemName: "theatermasks")
                .symbolRenderingMode(.hierarchical)
                .font(.system(size: 144))
            
            Image(systemName: "theatermasks")
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.blue)
                .font(.system(size: 144))
            
            Image(systemName: "shareplay")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .black)
                .font(.system(size: 144))
            
            Image(systemName: "person.3.sequence.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .green, .red)
                .font(.system(size: 144))
            
            Image(systemName: "person.3.sequence.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(
                    .linearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottomTrailing),
                    .linearGradient(colors: [.green, .black], startPoint: .top, endPoint: .bottomTrailing),
                    .linearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottomTrailing)
                )
                .font(.system(size: 144))
        }
    }
}

struct CustomizeSFSymbol_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeSFSymbol()
    }
}
