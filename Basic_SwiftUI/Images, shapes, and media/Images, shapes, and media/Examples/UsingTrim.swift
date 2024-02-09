//
//  UsingTrim.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/01.
//

import SwiftUI

struct UsingTrim: View {
    @State private var completionAmount = 0.0
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack{
            Circle()
                .trim(from: 0, to: 0.5)
                .frame(width: 200, height: 200)
            
            Rectangle()
            .trim(from: 0, to: completionAmount)
            .stroke(.red, lineWidth: 20)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(-90))
            .onReceive(timer) { _ in
                withAnimation {
                    if completionAmount == 1 {
                        completionAmount = 0
                    } else {
                        completionAmount += 0.2
                    }
                }
            }
        }
    }
}

struct UsingTrim_Previews: PreviewProvider {
    static var previews: some View {
        UsingTrim()
    }
}
