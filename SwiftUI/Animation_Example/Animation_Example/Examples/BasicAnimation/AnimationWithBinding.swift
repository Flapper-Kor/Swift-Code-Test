//
//  AnimationWithBinding.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/05.
//

import SwiftUI

struct AnimationWithBinding: View {
    @State private var showingWelcome1 = false
    @State private var showingWelcome2 = false
    @State private var showingWelcome3 = false
    
    var body: some View {
        VStack {
            Toggle("Toggle label", isOn: $showingWelcome1)

            if showingWelcome1 {
                Text("sdsdsdsdsddddfafafa")
            }
            
            // 바인딩
            // Binding<T>.animation() -> Binding<T>
            Toggle("Toggle label", isOn: $showingWelcome2.animation())
            if showingWelcome2 {
                Text("ddddsdsdsd")
            }
            
            Toggle("Toggle label", isOn: $showingWelcome3.animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 2, initialVelocity: 20)))
            if showingWelcome3 {
                Text("ddd212sdsd")
            }
        }
    }
}
//enum sss :Int, CaseIterable{
//    case ddd
//    case fff
//}
//
//class ddd : sss{
//
//}


struct AnimationWithBinding_Previews: PreviewProvider {
    static var previews: some View {
        AnimationWithBinding()
    }
}
