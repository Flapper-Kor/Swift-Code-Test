//
//  AnimationModifier.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/05.
//

/*
 Updated for Xcode 15 beta 1

 Improved in iOS 17

 SwiftUI has built-in support for animations with its animation() modifier. To use this modifier, place it after any other modifiers for your views, tell it what kind of animation you want, and also make sure you attach it to a particular value so the animation triggers only when that specific value changes.

 For example, this code creates a button that increases its scale effect by 1 each time it’s pressed:
 */
/*
 That makes the animation happen over 1 second, but if you don’t want to specify a precise time for your animation you can just use .linear.

 Important: From iOS 17 and later SwiftUI uses spring animations by default, but before that used linear animations by default.

 Instead of simple linear animations you can specify a curve from various built-in options, including:

 .easeIn starts slow then accelerates until the end.
 .easeOut starts fast then slows down near the end.
 .easeInOut starts slow, accelerates in the middle, then slows down near the end.
 
 .smooth is a spring animation with no bounce (from iOS 17)
 .snappy is a spring animation with a little bounce (from iOS 17)
 .bouncy is a spring animation with a medium amount of bounce (from iOS 17)
 
 Alternatively, you can specify .timingCurve to specify your own control points.

 For example, this animates the scale effect so that it starts slow and gets faster:
 */
import SwiftUI

struct AnimationModifier: View {
    @State private var scale = 1.0
    @State private var angle = 0.0
    @State private var borderThickness = 1.0
    
    var body: some View {
        VStack{
            Button("Scale Button") {
                scale += 1
                if scale > 4 {
                    self.scale = 1.0
                }
            }
            .scaleEffect(scale)
            .animation(.easeIn(duration: scale==1 ? 0.2 : 1), value: scale)
            
            Button("Rotate Button") {
                angle += 45
                borderThickness += 1
            }
            .padding()
            .border(.red, width: borderThickness)
            .rotationEffect(.degrees(angle))
            .animation(.easeIn, value: angle)
        }
        
    }
}



struct AnimationModifier_Previews: PreviewProvider {
    static var previews: some View {
        AnimationModifier()
    }
}
