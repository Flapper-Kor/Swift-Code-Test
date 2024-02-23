//
//  UsingAttributedString3.swift
//  Text
//
//  Created by Slash on 2023/07/28.
//

import SwiftUI

struct UsingAttributedString3: View {
    var message: AttributedString {
        var result = AttributedString("Testing 1 2 3!")
        result.font = .largeTitle
        result.foregroundColor = .white
        result.backgroundColor = .blue
        result.underlineStyle = Text.LineStyle(pattern: .solid, color: .white)
        return result
    }

    var body: some View {
        Text(message)
    }
}

struct UsingAttributedString3_Previews: PreviewProvider {
    static var previews: some View {
        UsingAttributedString3()
    }
}
