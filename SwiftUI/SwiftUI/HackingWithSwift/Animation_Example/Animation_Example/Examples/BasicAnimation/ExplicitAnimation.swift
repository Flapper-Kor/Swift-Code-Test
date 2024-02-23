//
//  ExplicitAnimation.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/05.
//
/*
 Updated for Xcode 15 beta 1

 If you attach an animation modifier to a view, you end up with implicit animation – changing some state elsewhere in your view might use animation, even though you’re just incrementing an integer or toggling a Boolean.

 An alternative is to use explicit animation, where you don’t attach modifiers to the view in question but instead ask SwiftUI to animate the precise change you want to make. To do this, wrap your changes in a call to withAnimation().

 For example, this uses explicit animation to make a button fade away slightly more each time it’s tapped:
 */

/*
 withAnimation() takes a parameter specifying the kind of animation you want, so you could create a three-second linear animation like this: withAnimation(.linear(duration: 3))

 
 
 Explicit animations are often helpful because they cause every affected view to animate, not just those that have implicit animations attached. For example, if view A has to make room for view B as part of the animation, but only view B has an animation attached, then view A will jump to its new position without animating unless you use explicit animations.
 */
import SwiftUI

// withAnimation 연관된 view 들에 애니메이션을 전체적으로 적용이 가능

struct ExplicitAnimation: View {
    @State private var opacity = 1.0

    var body: some View {
        Button("Press here") {
            withAnimation {
                opacity -= 0.2
                let _ = print(opacity) // 0이 되지 않을 수 있다. floating Point 연산의 단점
                if opacity < 0.001{
                    opacity = 0
                }
                if opacity == 0{
                    opacity = 1.0
                }
            }
        }
        .padding()
        .opacity(opacity)
    }
}

struct ExplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimation()
    }
}
