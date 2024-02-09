//
//  AnimationInOnAppear.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/08.
//
/*
 Updated for Xcode 15 beta 1

 If you want a SwiftUI view to start animating as soon as it appears, you should use the onAppear() modifier to attach an animation. I’ll show you the basic code first, then show you two extensions I use to make this process easier.

 First, the simple version – this creates a circle that scales up and down forever:
 */

import SwiftUI

struct AnimationInOnAppear: View {
    @State var scale = 1.0

    var body: some View {
        Circle()
            .frame(width: 200, height: 200)
            .scaleEffect(scale)         // 이거를 주석처리 하면 왜 안되는지 확인해 볼 것
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: 1)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
//                    scale = 1
                    scale = 0.1
                }
                
                print(repeated, type(of: repeated))
            }
            
    }
}

struct AnimationInOnAppear_Previews: PreviewProvider {
    static var previews: some View {
        AnimationInOnAppear()
    }
}
