//
//  BuiltinShapes.swift
//  Drawing
//
//  Created by Slash on 2023/07/05.
//

import SwiftUI

struct BuiltinShapes: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(.gray)
                .frame(width: 200, height: 200)

            RoundedRectangle(cornerRadius: 25)
                .fill(.red)
                .frame(width: 200, height: 200)

//            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 50, topTrailing: 50))
//                .fill(.orange)
//                .frame(width: 200, height: 200)

            Capsule()
                .fill(.green)
                .frame(width: 100, height: 50)

            Ellipse()
                .fill(.blue)
                .frame(width: 100, height: 50)

            Circle()
                .fill(.black)
                .frame(width: 100, height: 50)
        }
    }
}

struct BuiltinShapes_Previews: PreviewProvider {
    static var previews: some View {
        BuiltinShapes()
    }
}
