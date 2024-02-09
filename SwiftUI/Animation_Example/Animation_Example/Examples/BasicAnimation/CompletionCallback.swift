//
//  CompletionCallback.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/09.
//

/*
 Updated for Xcode 15 beta 1

 New in iOS 17

 SwiftUI’s withAnimation() function can optionally be given a completion callback with code to run when the animation finishes. This might be where you adjust some program state, but you can also use it as a simple way to chain animations together – to animate one thing, then animate something else afterwards.

 For example, this makes a button scale up then fade out:
 */

import SwiftUI

struct CompletionCallback: View {
    @State private var scaleUp = false
    @State private var fadeOut = false

    var body: some View {
        
        // in iOS 17 more
//        Button("Tap Me!") {
//            withAnimation {
//                scaleUp = true
//            } completion: {
//                withAnimation {
//                    fadeOut = true
//                }
//            }
//        }
//        .scaleEffect(scaleUp ? 3 : 1)
//        .opacity(fadeOut ? 0 : 1)

//        Button("Tap Me!") {
//            withAnimation(.bouncy, completionCriteria: .removed) {
//                scaleUp = true
//            } completion: {
//                withAnimation {
//                    fadeOut = true
//                }
//            }
//        }
//        .scaleEffect(scaleUp ? 3 : 1)
//        .opacity(fadeOut ? 0 : 1)
        Color.black
    }
}

struct CompletionCallback_Previews: PreviewProvider {
    static var previews: some View {
        CompletionCallback()
    }
}
