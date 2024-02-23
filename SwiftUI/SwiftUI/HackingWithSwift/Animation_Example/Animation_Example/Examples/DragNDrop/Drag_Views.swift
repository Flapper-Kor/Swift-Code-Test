//
//  Drag_Views.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/05.
//

import SwiftUI

struct Drag_Views: View {
    
    @State private var draggedOffset = CGSize.zero
    @State private var accumulatedOffset = CGSize.zero
    
    var body: some View {
        VStack {
            Circle()
            .foregroundColor(Color.blue)
            .background(
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            )
            .frame(width:100, height: 100)
//            .offset(draggedOffset)
//            .gesture(drag)
            Text("Hello, world!")
        }
        .padding()
        .offset(draggedOffset)
        .gesture(drag)
    }
    
    var drag: some Gesture {
      DragGesture()
        .onChanged { gesture in
            draggedOffset = accumulatedOffset + gesture.translation
            print(draggedOffset, accumulatedOffset, gesture.translation)
        }
        .onEnded { gesture in
            accumulatedOffset = accumulatedOffset + gesture.translation
            print(draggedOffset, accumulatedOffset, gesture.translation)
        }
    }
}

extension CGSize {
    static func + (lhs: Self, rhs: Self) -> Self {
        CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}

struct Drag_Views_Previews: PreviewProvider {
    static var previews: some View {
        Drag_Views()
    }
}
