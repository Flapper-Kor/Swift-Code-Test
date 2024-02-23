//
//  myShape.swift
//  Drawing
//
//  Created by Slash on 2023/07/06.
//

import SwiftUI

struct Star: Shape {
    
// store how many corners the star has, and how smooth/pointed it is
//    let corners: Int
//    let smoothness: Double
    
    @Binding var corners: Double
    @Binding var smoothness: Double

    func path(in rect: CGRect) -> Path {
        // draw from the center of our rectangle
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        // if coners < 1 return to circle
        guard corners > 1 else {
            var path = Path()
            path.addRoundedRect(in: rect, cornerSize: CGSize(width: rect.width / 2, height: rect.height / 2))
            return path
        }

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
        for corner in 0..<Int(corners) * 2  {
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
struct myShape: View {
    @Environment (\.grProxy) var grProxy
    
    @State private var corners: Double = 2
    @State private var smoothness : Double = 0.45
    @State private var sizefactor = 1.5
    @State private var trimS = 0.0
    @State private var trimE = 0.0
    
    var body: some View {
        let starShape = Star(corners: $corners, smoothness: $smoothness)
//        let starShape = Star(corners: 5, smoothness: 0.45)
//        let starShape = Star(corners: $corners, smoothness: $smoothness)
//            .scale(0.4) // scale 함수를 사용해서 사이즈 조절을 할 수도 있다. 자세한 것은 shape 문서를 참조하면 된다.
        
        let minwidthhight = grProxy.size.width/sizefactor < grProxy.size.height/sizefactor ? grProxy.size.width/sizefactor : grProxy.size.height/sizefactor
        let widthHight = sizefactor <= 0 ? grProxy.size.width : minwidthhight
        
        let _ = print(widthHight)
        VStack{
            VStack{
                starShape
                    .trim(from: trimS, to: trimE)
                    .frame(width: widthHight, height: widthHight)
                    
//                    .background(.green)
//                    .clipped()
//                    .border(.purple)
            }
            .frame(width: grProxy.size.width, height: grProxy.size.width)
            
            Spacer()
            VStack{
                HStack{
                    Text("corners : ")
                        .frame(width: 110, alignment: .leading)
//                        .border(.black)
                    Slider(value: $corners, in: -3...100, step: 1) { isEditing in
                        // if need do something, define here...
                        // 생략 가능
//                        if(isEditing){
//                            print("corners : \(corners)")
//                        }
                    }
                    Text("\(corners, specifier: "%.0f")")
                        .frame(width: 50, alignment: .trailing)
                        .multilineTextAlignment(.trailing)
//                        .border(.black)
                }.padding()

                HStack{
                    Text("sizefactor : ")
                        .frame(width: 110, alignment: .leading)
//                        .border(.black)
                    Slider(value: $sizefactor, in: 1...5, step: 0.01)
                    Text("\(sizefactor, specifier: "%.2f")")
                        .frame(width: 50, alignment: .trailing)
//                        .border(.black)
                }.padding()
                
                HStack{
                    Text("smoothness : ")
                        .frame(width: 110, alignment: .leading)
//                        .border(.black)
                    Slider(value: $smoothness, in: 0...1, step: 0.01)
                    Text("\(smoothness, specifier: "%.2f")")
                        .frame(width: 50, alignment: .trailing)
                        .multilineTextAlignment(.trailing)
//                        .border(.black)
                }.padding()
                
                HStack{
                    Text("trimS : ")
                        .frame(width: 110, alignment: .leading)
//                        .border(.black)
                    Slider(value: $trimS, in: 0...1, step: 0.01)
                    Text("\(trimS, specifier: "%.2f")")
                        .frame(width: 50, alignment: .trailing)
                        .multilineTextAlignment(.trailing)
//                        .border(.black)
                }.padding()
                
                HStack{
                    Text("trimE : ")
                        .frame(width: 110, alignment: .leading)
//                        .border(.black)
                    Slider(value: $trimE, in: 0...1, step: 0.01)
                    Text("\(trimE, specifier: "%.2f")")
                        .frame(width: 50, alignment: .trailing)
                        .multilineTextAlignment(.trailing)
//                        .border(.black)
                }.padding()
            }
            .padding()
        }
        .frame(width: grProxy.size.width, height: grProxy.size.height)
        
        .border(.black)
    }
}

struct myShape_Previews: PreviewProvider {
    static var previews: some View {
        DrawSomeShape1()
    }
}
