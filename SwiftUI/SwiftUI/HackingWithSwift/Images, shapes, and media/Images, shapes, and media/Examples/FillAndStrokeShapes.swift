//
//  FillAndStrokeShapes.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI

struct FillAndStrokeShapes: View {
    var body: some View {
        VStack{
            /*
             Improved in iOS 17

             In iOS 17 and later, you can fill and stroke shapes at the same time just by stacking the modifiers, like this:
             */
            if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *){
                VStack{
                    Circle()
                        .stroke(.red, lineWidth: 20)
                        .fill(.orange)
                        .frame(width: 150, height: 150)
                    
                    Circle()
                        .stroke(.blue, lineWidth: 45)
                        .stroke(.green, lineWidth: 35)
                        .stroke(.yellow, lineWidth: 25)
                        .stroke(.orange, lineWidth: 15)
                        .stroke(.red, lineWidth: 5)
                        .frame(width: 150, height: 150)
                }
            }else{
                VStack{
                    Circle()
                        .fill(.red)
                        .frame(width: 150, height: 150)
                    Circle()
                        .strokeBorder(.red, lineWidth: 20)
                        .background(Circle().fill(.orange))
                        .frame(width: 150, height: 150)
                    Spacer()
                    Circle()
                        .strokeBorder(.red, lineWidth: 20)
                        .background(
                            Circle()
                            .strokeBorder(.blue, lineWidth: 20)
                            .background(Circle().fill(.green))
                            .frame(width: 110, height: 110)
                        )
                        .frame(width: 150, height: 150)
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(.orange)
                        Circle()
                            .strokeBorder(.red, lineWidth: 20)
                    }
                    .frame(width: 150, height: 150)
                    
                    Spacer()
                    
                    // 이렇게 Shape 의 확장으로 만드는 경우 중복적용을 하지 못한다.
                    // 대부분의 modifier의 반환값이 View이기 때문에
                    // 가장 좋은 방법은 IOS 17부터 사용가능한 modifier들을 이용하는 것이고,
                    // 두번째 좋은 방법은 stroke 뷰 수정자를 만들어서 사용하는 것이다.
                    Circle()
                        .fill(.red, strokeBorder: .black, lineWidth: 20)
                        .frame(width: 150, height: 150)
                }
            }
        }
    }
}


extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

extension InsettableShape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

struct FillAndStrokeShapes_Previews: PreviewProvider {
    static var previews: some View {
        FillAndStrokeShapes()
    }
}
