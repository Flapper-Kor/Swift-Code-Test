//
//  SynchronizeAnimation.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/08.
//
/*
 Updated for Xcode 15 beta 1

 If you have the same view appearing in two different parts of your view hierarchy and want to animate between them – for example, going from a list view to a zoomed detail view – then you should use SwiftUI’s matchedGeometryEffect() modifier, which is a bit like Magic Move in Keynote.

 To use the modifier, attach it to a pair of views that are the same, in different parts of your hierarchy. With that done, when you switch between your two view states you’ll find SwiftUI smoothly animates your synchronized view.

 To try it out, first create some sort of layout where your views appear in two locations. In this example, I have a red circle then some text in one view state, but in the other view state the circle comes after the text and changes color:
 */

// MARK: - 애니메이션 중에서 가장 유용하고 좋은 예제
import SwiftUI

struct SynchronizeAnimation: View {
    @Namespace private var animation
    
    @State private var isFlipped1 = false
    @State private var isFlipped2 = false
    @State private var isFlipped3 = false
    
    @State private var isZoomed = false
    var frame: Double {
        isZoomed ? 300 : 44
    }
    
    var body: some View {
        VStack{
//            //MARK: - simple animation
//            VStack {
//                if isFlipped1 {
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 44, height: 44)
//                    Text("Taylor Swift – 1989")
//                        .font(.headline)
//                } else {
//                    Text("Taylor Swift – 1989")
//                        .font(.headline)
//                    Circle()
//                        .fill(.blue)
//                        .frame(width: 44, height: 44)
//                }
//            }
//            .onTapGesture {
//                withAnimation {
//                    isFlipped1.toggle()
//                }
//            }
//
//            //MARK: - 위치기반 이펙트가 적용된 애니메이션
//            VStack {
//                if isFlipped2 {
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 44, height: 44)
//                        .matchedGeometryEffect(id: "Shape", in: animation)
//                    Text("Taylor Swift – 1989")
//                        .matchedGeometryEffect(id: "AlbumTitle", in: animation)
//                        .font(.headline)
//                } else {
//                    Text("Taylor Swift – 1989")
//                        .matchedGeometryEffect(id: "AlbumTitle", in: animation)
//                        .font(.headline)
//                    Circle()
//                        .fill(.blue)
//                        .frame(width: 44, height: 44)
//                        .matchedGeometryEffect(id: "Shape", in: animation)
//                }
//            }
//            .onTapGesture {
//                withAnimation {
//                    isFlipped2.toggle()
//                }
//            }
//
//            // MARK: - for some test (Default Animation...)
//            // matchedGepmetryEffect 의 ID 값이 겹치면 의도하지 않은 결과
//            VStack {
//                if isFlipped3 {
//                    Circle()
//                        .fill(.red)
//                        .frame(width: 44, height: 44)
////                        .matchedGeometryEffect(id: "Shape", in: animation)
//                        .matchedGeometryEffect(id: "Shape2", in: animation)
//                    Text("Taylor Swift – 1989")
////                        .matchedGeometryEffect(id: "AlbumTitle", in: animation)
//                        .matchedGeometryEffect(id: "AlbumTitle2", in: animation)
//                        .font(.headline)
//                } else {
//                    Text("Taylor Swift – 1989")
////                        .matchedGeometryEffect(id: "AlbumTitle", in: animation)
//                        .matchedGeometryEffect(id: "AlbumTitle2", in: animation)
//                        .font(.headline)
//                    Circle()
//                        .fill(.blue)
//                        .frame(width: 44, height: 44)
////                        .matchedGeometryEffect(id: "Shape", in: animation)
//                        .matchedGeometryEffect(id: "Shape2", in: animation)
//                }
//            }
//            .onTapGesture {
//                withAnimation(.linear(duration: 0.1)) {
//                    isFlipped3.toggle()
//                }
//                withAnimation {
//                    isFlipped2.toggle()
//                }
//            }
            
            VStack {
                Spacer()

                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                            .frame(width: frame, height: frame)
                            .padding(.top, isZoomed ? 20 : 0)

                        if isZoomed == false {
                            Text("Taylor Swift – 1989")
                                .matchedGeometryEffect(id: "AlbumTitle3", in: animation)
                                .font(.headline)
                            Spacer()
                        }
                    }

                    if isZoomed == true {
                        Text("Taylor Swift – 1989")
                            .matchedGeometryEffect(id: "AlbumTitle3", in: animation)
                            .font(.headline)
                            .padding(.bottom, 60)
                        Spacer()
                    }
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        isZoomed.toggle()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .background(Color(white: 0.9))
                .foregroundStyle(.black)
            }
        }
    }
}

struct SynchronizeAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SynchronizeAnimation()
    }
}
