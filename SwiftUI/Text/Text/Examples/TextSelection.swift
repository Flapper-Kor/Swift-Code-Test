//
//  TextSelection.swift
//  Text
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI

struct TextSelection: View {
    @State var textfield : String = ""
    var body: some View {
        VStack{
            TextField("For copy TEST", text: $textfield)
                .multilineTextAlignment(.center)
                .border(.red)
            
            VStack(spacing: 50) {
                Text("You can't touch this")

                Text("Break it down!")
                    .textSelection(.enabled)
            }
            Spacer()
            VStack(spacing: 50) {
                Text("You can't touch this")
                Text("Break it down!")
            }
            .textSelection(.enabled)
            
            List(0..<100) { index in
                Text("Row \(index)")
            }
            .textSelection(.enabled)
        }

    }
}

struct TextSelection_Previews: PreviewProvider {
    static var previews: some View {
        TextSelection()
    }
}
