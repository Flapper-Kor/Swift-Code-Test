//
//  UsingAttributedString6.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

import SwiftUI

struct UsingAttributedString6: View {
    var message: AttributedString {
        var password = AttributedString("abCayer-muQai")
        password.accessibilitySpeechSpellsOutCharacters = true
        return "Your password is: " + password
    }

    var body: some View {
        Text(message)
    }
}

struct UsingAttributedString6_Previews: PreviewProvider {
    static var previews: some View {
        UsingAttributedString6()
    }
}
