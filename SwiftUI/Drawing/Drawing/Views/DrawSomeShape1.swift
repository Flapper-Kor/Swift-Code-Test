//
//  DrawSomeShape1.swift
//  Drawing
//
//  Created by Slash on 2023/07/05.
//


import SwiftUI

struct Star_tutorial: Shape {
    
    // store how many corners the star has, and how smooth/pointed it is
    let corners: Int
    let smoothness: Double

    func path(in rect: CGRect) -> Path {
        // ensure we have at least two corners, otherwise send back an empty path
        guard corners >= 2 else { return Path() }

        // draw from the center of our rectangle
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

        // start from directly upwards (as opposed to down or to the right)
        var currentAngle = -CGFloat.pi / 2

        // calculate how much we need to move with each star corner
        let angleAdjustment = .pi * 2 / Double(corners * 2)

        // figure out how much we need to move X/Y for the inner points of the star
        let innerX = center.x * smoothness
        let innerY = center.y * smoothness

        // we're ready to start with our path now
        var path = Path()

        // move to our initial position
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

        // track the lowest point we draw to, so we can center later
        var bottomEdge: Double = 0

        // loop over all our points/inner points
        for corner in 0..<corners * 2  {
            // figure out the location of this point
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: Double

            // if we're a multiple of 2 we are drawing the outer edge of the star
            if corner.isMultiple(of: 2) {
                // store this Y position
                bottom = center.y * sinAngle

                // …and add a line to there
                path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
            } else {
                // we're not a multiple of 2, which means we're drawing an inner point

                // store this Y position
                bottom = innerY * sinAngle

                // …and add a line to there
                path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
            }

            // if this new bottom point is our lowest, stash it away for later
            if bottom > bottomEdge {
                bottomEdge = bottom
            }

            // move on to the next corner
            currentAngle += angleAdjustment
        }

        // figure out how much unused space we have at the bottom of our drawing rectangle
        let unusedSpace = (rect.height / 2 - bottomEdge) / 2

        // create and apply a transform that moves our path down by that amount, centering the shape vertically
        let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
        return path.applying(transform)
    }
}

// Draw our star shape in a view
struct DrawSomeShape1: View {
    @Environment (\.grProxy) var grProxy
    
    @State private var corners: Int = 2
    @State private var smoothness : Double = 0.45
    
    var body: some View {
        let starShape = Star_tutorial(corners: 5, smoothness: 0.45)
//            .scale(0.4) // scale 함수를 사용해서 사이즈 조절을 할 수도 있다. 자세한 것은 shape 문서를 참조하면 된다.
        let sizefactor = 1.5
        let widthHight = grProxy.size.width/sizefactor < grProxy.size.height/sizefactor ? grProxy.size.width/sizefactor : grProxy.size.height/sizefactor
        let _ = print(widthHight)
        VStack{
            starShape
                .fill(.red)
//                .frame(width: widthHight, height: widthHight) // 여기서 사이즈 조절을 하면 상위 컨테이너 크기에 상관없이 크기 조절 가능
                .background(.green)
                .border(.purple)
            
                
                
        }
        .frame(width: widthHight, height: widthHight)
        // 외부 프레임의 크기에 따라서 내부 shape에 전달되는 rect의 크기가 결정된다.
        
        .border(.black)
        
    }
}

struct DrawSomeShape1_Previews: PreviewProvider {
    static var previews: some View {
        DrawSomeShape1()
    }
}
