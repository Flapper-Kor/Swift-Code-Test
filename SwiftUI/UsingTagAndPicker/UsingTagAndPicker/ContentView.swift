//
//  ContentView.swift
//  UsingTagAndPicker
//
//  Created by Slash on 2023/07/06.
//


// what is purpose of tag
// : picker selecting with tag
// : some functions like viewWithTag() using tag

import SwiftUI

struct InitGender: View {
    @State private var selection: String = "M"
    let genderRange = ["M","F"]

    var body: some View {
        VStack {
            Text("Select your gender")
                .font(.title)
                .bold()
            Text("Selected: \(selection)")

            Picker("Select gender", selection : $selection) {
//                ForEach(0..<genderRange.count) {
//                    Text(self.genderRange[$0]).tag(self.genderRange[$0])
////                    Text(self.genderRange[$0]) // 이렇게 하면 변경 안됨
//                }
                ForEach(genderRange, id:\.self){
                    Text($0)
                }
            }
            .labelsHidden()
            .clipped()
       }
   }
}

struct ContentView: View {
    var body: some View {
        InitGender()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
