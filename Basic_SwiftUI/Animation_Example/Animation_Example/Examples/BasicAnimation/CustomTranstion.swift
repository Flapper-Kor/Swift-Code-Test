//
//  CustomTranstion.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/09.
//
/*
 Updated for Xcode 15 beta 1

 Although SwiftUI comes with a selection of transitions built in, it’s also possible to write entirely custom transitions if we want to.

 The process takes three steps:

 1. Create a ViewModifier that represents your transition at any of its states.
 2. Create an AnyTransition extension that uses your view modifier for active and identity states.
 3. Apply that transition to your views using the transition() modifier.
 For example, we could write a shape and view modifier combination that lets us mimic the Iris animation in Keynote – it causes a new slide to appear in a circle that grows upwards, a bit like the old Looney Tunes intro sequence.

 To demonstrate this in action, I’m going to show you a complete code example that does several things:

 1. Defines a ScaledCircle shape that creates a circle inside a rectangle that is scaled according to some animatable data.
 2. Create a custom ViewModifier struct to apply any shape (in our case, the scaled circle) as a clip shape for another view.
 3. Wraps that in an AnyTransition extension to wrap that modifier in a transition for easier access.
 4. Creates a SwiftUI view to demonstrate our transition in action.
 
 Here’s the code, with added comments to explain what’s going on:
 */
import SwiftUI


struct ScaledCircle: Shape {
    // This controls the size of the circle inside the
    // drawing rectangle. When it's 0 the circle is
    // invisible, and when it’s 1 the circle fills
    // the rectangle.
    var animatableData: Double

    //MARK: - for TEST
    
    func path(in rect: CGRect) -> Path {
        let maximumCircleRadius = sqrt(rect.width * rect.width + rect.height * rect.height)
        let circleRadius = maximumCircleRadius * animatableData

        let x = rect.midX - circleRadius / 2
        let y = rect.midY - circleRadius / 2
        
        let circleRect = CGRect(x: x, y: y, width: circleRadius, height: circleRadius)
        
        return Circle().path(in: circleRect)
    }
}

// MARK: -- Step 1. A general modifier that can clip any view using a any shape.
struct ClipShapeModifier<T: Shape>: ViewModifier {
    let shape: T

    func body(content: Content) -> some View {
//        shape
        content.clipShape(shape)
    }
}

// MARK: -- Step 2. A custom transition combining ScaledCircle and ClipShapeModifier.
extension AnyTransition {
    static var iris: AnyTransition {
        .modifier(
            active: ClipShapeModifier(shape: ScaledCircle(animatableData: 0)),
            identity: ClipShapeModifier(shape: ScaledCircle(animatableData: 1))
        )
    }
}

//MARK: -- Step 3. Apply Custom Transition
struct CustomTranstion: View {
    @State private var isShowingRed = false

    @State private var maximumCircleRadius : Double = 0
    @State private var circleRadius : Double = 0
    @State private var animatedData : Double = 0
    
    var body: some View {
        VStack {
            ZStack {
                Color.blue
                    .frame(width: 200, height: 200)

                if isShowingRed {
                    Color.red
                        .frame(width: 200, height: 200)
                        .transition(.iris)
                        .zIndex(1)
//                        .opacity(0.5)                      // iOS 16.4 기준 현재
                }
            }
            .frame(width: 200, height: 200)
            .clipped()                                       //
            .padding(50)
            .onTapGesture {
                withAnimation() {
                    isShowingRed.toggle()
                    print(isShowingRed)
                }
            }
            .border(.red)

            ZStack{
                Color.red
                    .clipShape(ScaledCircle(animatableData: animatedData))
                    .frame(maxWidth: 200, maxHeight: 200)
                    .border(.red)
            }
            .frame(width: 200, height: 200)

            
            
            VStack{
                HStack{
                    Text("maximumCircleRadius : ")
                        .frame(width: 110, alignment: .leading)
                    //                        .border(.black)
                    Slider(value: $maximumCircleRadius, in: -3...100, step: 1)
                    Text("\(maximumCircleRadius, specifier: "%.0f")")
                        .frame(width: 50, alignment: .trailing)
                        .multilineTextAlignment(.trailing)
                    //                        .border(.black)
                }.padding()
                
                HStack{
                    Text("circleRadius : ")
                        .frame(width: 110, alignment: .leading)
                    //                        .border(.black)
                    Slider(value: $circleRadius, in: 1...5, step: 0.01)
                    Text("\(circleRadius, specifier: "%.2f")")
                        .frame(width: 50, alignment: .trailing)
                    //                        .border(.black)
                }.padding()
                
                HStack{
                    Text("animatedData : ")
                        .frame(width: 110, alignment: .leading)
                    //                        .border(.black)
                    Slider(value: $animatedData, in: 0...1, step: 0.01)
                    Text("\(animatedData, specifier: "%.2f")")
                        .frame(width: 50, alignment: .trailing)
                        .multilineTextAlignment(.trailing)
                    //                        .border(.black)
                }.padding()
            }
            .padding()
        }
    }
}

struct CustomTranstion_Previews: PreviewProvider {
    static var previews: some View {
        CustomTranstion()
    }
}
