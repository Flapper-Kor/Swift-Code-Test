//
//  Spacing.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

import SwiftUI

struct Spacing: View {
//    @State var amount : Double = 30.0
    @State var amount : CGFloat = 30
    var body: some View {
        VStack{
            VStack{
                Text("Hello World")
                    .tracking(20)
            }

            VStack {
                Text("ffi")
                    .font(.custom("AmericanTypewriter", size: 72))
                    .kerning(amount)
                Text("ffi")
                    .font(.custom("AmericanTypewriter", size: 72))
                    .tracking(amount)

                Slider(value: $amount, in: 0...100) {
                    Text("Adjust the amount of spacing")
                }
            }
            
            VStack {
                Text("flutter")
                    .font(.custom("Futura", size: 50))
                    .kerning(amount)
                Text("flutter")
                    .font(.custom("Futura", size: 50))
                    .tracking(amount)
                
                Slider(value: $amount, in: 0...100) {
                    Text("the amount of spacing")
                }
            }
        }
    }
}

struct Spacing_Previews: PreviewProvider {
    static var previews: some View {
        Spacing()
    }
}
