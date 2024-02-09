//
//  TextCase.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

import SwiftUI

struct TextCase: View {
    @State private var name = "Paul"

    var body: some View {
        TextField("Shout your name at me", text: $name)
            .textFieldStyle(.roundedBorder)
            .textCase(.uppercase)
            .padding(.horizontal)
    }
}

struct TextCase_Previews: PreviewProvider {
    static var previews: some View {
        TextCase()
    }
}
