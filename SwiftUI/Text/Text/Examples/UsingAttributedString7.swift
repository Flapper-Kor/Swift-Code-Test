//
//  UsingAttributedString7.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

import SwiftUI

struct UsingAttributedString7: View {
    var message: AttributedString {
        var result = Date.now.formatted(.dateTime.weekday(.wide).day().month(.wide).attributed)
        result.foregroundColor = .secondary

        let weekday = AttributeContainer.dateField(.weekday)
        let weekdayStyling = AttributeContainer.foregroundColor(.primary)
        
        
        // both are AttributeContainer type
        print(weekday, type(of: weekday))
        print(weekdayStyling, type(of: weekdayStyling))
        
        result.replaceAttributes(weekday, with: weekdayStyling)

        return result
    }

    var body: some View {
        Text(message)
    }
}

struct UsingAttributedString7_Previews: PreviewProvider {
    static var previews: some View {
        UsingAttributedString7()
    }
}
