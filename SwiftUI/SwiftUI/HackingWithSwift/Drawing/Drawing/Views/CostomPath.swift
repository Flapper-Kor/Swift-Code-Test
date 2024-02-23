//
//  CostomPath.swift
//  Drawing
//
//  Created by Slash on 2023/07/05.
//

import SwiftUI

struct ShrinkingSquares: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        for i in stride(from: -100, through: 100, by: 50.0) {
            let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            let insetRect = rect.insetBy(dx: i, dy: i)
            path.addRect(insetRect)
//
//
//            let insertCircle = rect.insetBy(dx: i, dy: i)
//
//            path.addRoundedRect(
//                in: CGRect(x: i, y: i, width: rect.width, height: rect.height),
//                cornerSize: CGSize(width: rect.width, height: rect.width))
        }

        return path
    }
}

struct CostomPath: View {
    var body: some View {
        ShrinkingSquares()
            .stroke()
            .frame(width: 200, height: 200)
    }
}

struct CostomPath_Previews: PreviewProvider {
    static var previews: some View {
        CostomPath()
    }
}
