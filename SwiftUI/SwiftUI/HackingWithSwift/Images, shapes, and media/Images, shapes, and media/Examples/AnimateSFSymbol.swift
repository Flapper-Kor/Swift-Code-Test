//
//  AnimateSFSymbol.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/02.
//

import SwiftUI


/*
 Updated for Xcode 15 beta 1

 New in iOS 17

 SwiftUI provides the symbolEffect() modifier to add built-in animation effects for SF Symbols and produce a real touch of delight with almost no effort.

 For example, we could animate a dog icon up and down with a gentle bounce whenever a button is pressed:
 */

//
@available (iOS, introduced: 17.0)
struct AnimateSFSymbol_ex1 : View {
    @State private var petCount = 0
    var body: some View{
        VStack{
            Button {
                petCount += 1
            } label: {
                Label("Pet the Dog", systemImage: "dog")
            }
            .symbolEffect(.bounce, value: petCount)
            .font(.largeTitle)
        }
    }
}
//
@available (iOS, introduced: 17.0)
struct AnimateSFSymbol_ex2 : View {
    @State private var isFavorite = false
    var body: some View {
        VStack{
            Button {
                isFavorite.toggle()
            } label: {
                Label("Activate Inbox Zero", systemImage: "mail.stack")
            }
            .symbolEffect(.bounce.down, value: isFavorite)
            .font(.largeTitle)
        }
    }
}
@available (iOS, introduced: 17.0)
struct AnimateSFSymbol_ex3 : View {
    @State private var animationsRunning = false

    var body: some View {

        Button("Start Animations") {
            withAnimation {
                animationsRunning.toggle()
            }
        }

        VStack {
            HStack {
                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.iterative, value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.cumulative, value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.reversing.iterative, value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.reversing.cumulative, value: animationsRunning)
            }

            HStack {
                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.iterative, options: .repeating, value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.cumulative, options: .repeat(3), value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.reversing.iterative, options: .speed(3), value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.reversing.cumulative, options: .repeat(3).speed(3), value: animationsRunning)
            }
        }
        .font(.largeTitle)
    }
}
@available (iOS, introduced: 17.0)
struct AnimateSFSymbol_ex4: View {
    @State private var isFavorite = false

    var body: some View {
        VStack {
            Button {
                withAnimation {
                    isFavorite.toggle()
                }
            } label: {
                Label("Toggle Favorite", systemImage: isFavorite ? "checkmark": "heart")
            }
            .contentTransition(.symbolEffect(.replace))
        }
        .font(.largeTitle)
    }
}
@available (iOS, introduced: 17.0)
struct AnimateSFSymbol: View {
    var body: some View{
        VStack{
            AnimateSFSymbol_ex1()
            AnimateSFSymbol_ex2()
            AnimateSFSymbol_ex3()
            AnimateSFSymbol_ex4()
        }
    }
}

@available (iOS, introduced: 17.0)
struct AnimateSFSymbol_Previews: PreviewProvider {
    static var previews: some View {
        AnimateSFSymbol()
    }
}
