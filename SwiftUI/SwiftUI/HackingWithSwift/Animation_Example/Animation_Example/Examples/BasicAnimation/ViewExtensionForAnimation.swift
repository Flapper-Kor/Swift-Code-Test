//
//  ViewExtensionForAnimation.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/08.
//

import SwiftUI
// Create an immediate animation.
extension View {
    func animate(using animation: Animation = .easeInOut(duration: 1), _ action: @escaping () -> Void) -> some View {
        onAppear {
            withAnimation(animation) {
                action()
            }
        }
    }
}

// Create an immediate, looping animation
extension View {
    func animateForever(using animation: Animation = .easeInOut(duration: 1), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation.repeatForever(autoreverses: autoreverses)

        return onAppear {
            withAnimation(repeated) {
                action()
            }
        }
    }
}

// Try out our extensions with the scaling circle.
struct ViewExtensionForAnimation: View {
    @State var scale = 1.0

    var body: some View {
        Circle()
            .frame(width: 200, height: 200)
            .scaleEffect(scale)
            .animateForever(autoreverses: true) { scale = 0.5 }
    }
}

struct ViewExtensionForAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ViewExtensionForAnimation()
    }
}
