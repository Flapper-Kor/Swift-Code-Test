//
//  MultiStepAnimation.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/09.
//


/*
 Updated for Xcode 15 beta 1

 New in iOS 17

 SwiftUI’s PhaseAnimator view and phaseAnimator modifier allow us to perform multi-step animation by cycling through animation phases of our choosing, either constantly or when triggered.

 Creating these multi-phase animations takes three steps:

 Define the phases you’re going to work through. This can be any kind of sequence, but you might find it easiest to work with a CaseIterable enum.
 Read one phase inside your phase animator, and adjust your views to match how you want that phase to look.
 Optionally add a trigger to make the phase animator repeat its sequence from the beginning. Without this it will cycle constantly.
 For example, this next example creates a simple animation that makes some text start small and invisible, scale up to natural size and be fully opaque, then scale up to be very large and invisible. It uses an array of the numbers 0, 1, and 3 to represent the various scaling sizes we’ll be using (0%, 100%, and 300%), and it makes the text opaque when the size is 1:
 */

//import SwiftUI
//
//struct MultiStepAnimation: View {
////    var body: some View {
////        Text("Hello, world!")
////            .font(.largeTitle)
////            .phaseAnimator([0, 1, 3]) { view, phase in
////                view
////                    .scaleEffect(phase)
////                    .opacity(phase == 1 ? 1 : 0)
////            }
////    }
//}
//
//struct MultiStepAnimation_Previews: PreviewProvider {
//    static var previews: some View {
//        MultiStepAnimation()
//    }
//}


// more examples in https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-multi-step-animations-using-phase-animators
