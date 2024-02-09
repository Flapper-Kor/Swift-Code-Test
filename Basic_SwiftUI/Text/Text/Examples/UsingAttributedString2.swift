//
//  UsingAttributedString2.swift
//  Text
//
//  Created by Slash on 2023/07/28.
//

import SwiftUI

struct UsingAttributedString2: View {
    var message1: AttributedString {
        var result = AttributedString("Hello")
        result.font = .largeTitle
        result.foregroundColor = .white
        result.backgroundColor = .red
        return result
    }

    var message2: AttributedString {
        var result = AttributedString("World!")
        result.font = .largeTitle
        result.foregroundColor = .white
        result.backgroundColor = .blue
        return result
    }

    var body: some View {
        Text(message1 + message2)
    }
}

struct UsingAttributedString2_Previews: PreviewProvider {
    static var previews: some View {
        UsingAttributedString2()
    }
}


