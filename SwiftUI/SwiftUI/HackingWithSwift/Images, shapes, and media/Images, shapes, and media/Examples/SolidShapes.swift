//
//  SolidShapes.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI

struct SolidShapes: View {
    var body: some View {
        VStack{
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
            Circle()
                .fill(.blue)
                .frame(width: 100, height: 100)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(.green)
                .frame(width: 150, height: 100)
            
            Capsule()
                .fill(.green)
                .frame(width: 150, height: 100)
        }
        
    }
}

struct SolidShapes_Previews: PreviewProvider {
    static var previews: some View {
        SolidShapes()
    }
}
