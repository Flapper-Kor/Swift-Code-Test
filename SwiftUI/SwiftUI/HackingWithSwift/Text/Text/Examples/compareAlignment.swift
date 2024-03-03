//
//  compareAlignment.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

import SwiftUI

struct compareAlignment: View {
    let alignments: [TextAlignment] = [.leading, .center, .trailing]
    @State private var alignment = TextAlignment.leading

    var body: some View {
        VStack {
            Picker("Text alignment", selection: $alignment) {
                ForEach(alignments, id: \.self) { alignment in
                    Text(String(describing: alignment))
                }
            }

            Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
                .font(.largeTitle)
                .multilineTextAlignment(alignment)
                .frame(width: 300)
        }.pickerStyle(.segmented)
    }
}

struct compareAlignment_Previews: PreviewProvider {
    static var previews: some View {
        compareAlignment()
    }
}
