//
//  UsingAttributedString5.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

import SwiftUI

struct UsingAttributedString5: View {
    var message: AttributedString {
        var result = AttributedString("Learn Swift here")
        result.font = .largeTitle
        result.link = URL(string: "https://www.hackingwithswift.com")
        return result
    }

    var body: some View {
        Text(message)
    }
}

struct UsingAttributedString5_Previews: PreviewProvider {
    static var previews: some View {
        UsingAttributedString5()
    }
}
