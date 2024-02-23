//
//  UsingAttributedString1.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

import SwiftUI

struct UsingAttributedString1: View {
    var message: AttributedString {
        var result = AttributedString("Hello, world!")
        result.font = .largeTitle
        result.foregroundColor = .white
        result.backgroundColor = .red
        return result
    }

    var body: some View {
        Text(message)
    }
}

struct UsingAttributedString1_Previews: PreviewProvider {
    static var previews: some View {
        UsingAttributedString1()
    }
}
