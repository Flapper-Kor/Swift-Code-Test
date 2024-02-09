//
//  ContentView.swift
//  ClipTest
//
//  Created by Slash on 2023/07/09.
//

import SwiftUI

struct ScaledCircle: Shape {
    // This controls the size of the circle inside the
    // drawing rectangle. When it's 0 the circle is
    // invisible, and when it’s 1 the circle fills
    // the rectangle.
    var animatableData: Double

    func path(in rect: CGRect) -> Path {
        let maximumCircleRadius = sqrt(rect.width * rect.width + rect.height * rect.height)
        let circleRadius = maximumCircleRadius * animatableData

        let x = rect.midX - circleRadius / 2
        let y = rect.midY - circleRadius / 2

        let circleRect = CGRect(x: x, y: y, width: circleRadius, height: circleRadius)

        return Circle().path(in: circleRect)
    }
}

// A general modifier that can clip any view using a any shape.
struct ClipShapeModifier<T: Shape>: ViewModifier {
    let shape: T

    func body(content: Content) -> some View {
        
        content.clipShape(shape)
    }
}

struct wrapperView: View{
    var animatableData : Double
    var body: some View{
        ScaledCircle(animatableData: animatableData)
    }
}

// A custom transition combining ScaledCircle and ClipShapeModifier.
extension AnyTransition {
    static var iris: AnyTransition {
        .modifier(
            active: ClipShapeModifier(shape: ScaledCircle(animatableData: 0)),
            identity: ClipShapeModifier(shape: ScaledCircle(animatableData: 1))
        )
    }
}


// An example view move showing and hiding a red
// rectangle using our transition.

// 내 현재 버전에서는 특이하게도...
// 아래의 opacity를 1이하의 값을 주거나, 상위 스택에서 clipped()를 수행하여야
// 정상적으로 코드가 동작했다.
struct ContentView: View {
    @State private var isShowingRed = false

    var body: some View {
        VStack{
            ZStack {

                Color.blue
                    .frame(width: 200, height: 200)
                
                if isShowingRed {
                    Color.red
                        .frame(width: 200, height: 200)
                        .transition(.iris)
//                        .opacity(0.99)
                        .zIndex(1)
                        
                }

            }
            .frame(width: 200, height: 200)
//            .clipped()
            .padding(50)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isShowingRed.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
