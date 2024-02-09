//
//  ContentView.swift
//  Test
//
//  Created by Flapper on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            StrokeText(text: "Sample Text", width: 0.5, color: .red)
                .foregroundColor(.black)
                .font(.system(size: 12, weight: .bold))

        }
        .padding()
    }
}


struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
#Preview {
    ContentView()
}
