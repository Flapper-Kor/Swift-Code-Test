//
//  MarkdownContents.swift
//  Text
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI

struct MarkdownContents: View {
    var body: some View {
        VStack {
            Text("This is regular text.")
            
            Text("""
                    * This is **bold** text,
                    this is *italic* text,
                    and this is ***bold, italic*** text.
                """)
            
            Text("~~A strikethrough example~~")
            
            Text("`Monospaced works too`")
            
            Text("Visit Apple: [click here](https://apple.com)")
            
            Text("Visit Apple: [click here](https://apple.com)")
                .tint(.indigo)
            
            MarkdownContents_SubView()
        }
    }
}

struct MarkdownContents_SubView: View{
    let markdownText: LocalizedStringKey = "* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text."

    var body: some View {
        Text(markdownText)
    }
}

struct MarkdownContents_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownContents()
    }
}
