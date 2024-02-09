//
//  Spring.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/05.
//

/*
 Updated for Xcode 15 beta 1

 SwiftUI has built-in support for spring animations, which are animations that move to their target point, overshoot a little, then bounce back.

 If you just use .spring() by itself, with no parameters, you get a sensible default. So, this creates a spring animation that rotates a button by 45 degrees every time it’s tapped:
 */

import SwiftUI

struct Spring: View {
    @State private var angle: Double = 0

    var body: some View {
        VStack{
            Button("Press here") {
                angle += 45
            }
            .padding()
            .rotationEffect(.degrees(angle))
            .animation(.spring(), value: angle)
            
            /*
             If you want fine-grained control over the spring animation, send in any of the parameters that interest you. Here you have two options:

             If you need to support iOS 16 and earlier, you need to specify the mass of the object, how stiff the spring should be, how quickly the springiness slows down, and how fast it starts moving at launch.
             If you can support only iOS 17 and later, you can specify how long you want the spring to happen for, and optionally also add how much bounce and blending you want.
             For example, this creates an iOS 16-compatible button with a moderate amount spring damping, which means it will bounce back and forth a few times time before reaching its target angle:
             */
            
            // iOS 16 or earlier
            Button("Press here") {
                        angle += 45
            }
            .padding()
            .rotationEffect(.degrees(angle))
            .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 1, initialVelocity: 50), value: angle)
            
            // iOS 17 or later
//            Button("Press here") {
//                scale += 1
//            }
//            .scaleEffect(scale)
//            .animation(.spring(duration: 1, bounce: 0.75), value: scale)
        }

        

    }
}

struct Spring_Previews: PreviewProvider {
    static var previews: some View {
        Spring()
    }
}
