//
//  DelayAnAnimation.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/08.
//
/*
 Updated for Xcode 15 beta 1

 When you create any animation – implicitly, explicitly, or with bindings – you can attach modifiers to that animation to adjust the way it works. For example, if you want an animation to start after a certain number of seconds you should use the delay() modifier.

 As an example, this creates a red rectangle that, when tapped, will rotate by 360 degrees using a two-second animation with a one-second delay:
 
 */
import SwiftUI

struct DelayAnAnimation: View {
    @State var rotation = 0.0

    var body: some View {
        Rectangle()
            .fill(.red)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(rotation))
            .animation(.easeInOut(duration: 3).delay(1), value: rotation)
            .onTapGesture {
                rotation += 360
            }
    }
}

struct DelayAnAnimation_Previews: PreviewProvider {
    static var previews: some View {
        DelayAnAnimation()
    }
}
