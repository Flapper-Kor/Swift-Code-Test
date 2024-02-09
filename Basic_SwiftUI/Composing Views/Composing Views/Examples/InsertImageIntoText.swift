//
//  InsertImageIntoText.swift
//  Composing Views
//
//  Created by Slash on 2023/07/11.
//
/*
 Updated for Xcode 15 beta 1

 SwiftUI lets you combine text views using +, but you can also place images directly into text using a simple Text initializer. This allows you to place images directly inside text, including having the text and images wrap as needed.

 For example, this writes “Hello World” with a star image in the middle:
 */

import SwiftUI

struct InsertImageIntoText: View {
    var body: some View {
        VStack{
            Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!")
            
            (Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!"))
                .foregroundStyle(.blue)
                .font(.largeTitle)
            
            Text("Goodbye ")
            + Text(Image(systemName: "star"))
            + Text(" World!").foregroundColor(.blue).font(.largeTitle)
        }
        
    }
}

struct InsertImageIntoText_Previews: PreviewProvider {
    static var previews: some View {
        InsertImageIntoText()
    }
}
