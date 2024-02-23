//
//  DateInText.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

import SwiftUI

struct DateInText: View {
    var body: some View {
        
        VStack{
            Spacer()
            VStack{
                Text(Date.now...Date.now.addingTimeInterval(600))
            }
            Spacer()
            VStack{
                // show just the date
                Text(Date.now.addingTimeInterval(600), style: .date)

                // show just the time
                Text(Date.now.addingTimeInterval(600), style: .time)

                // show the relative distance from now, automatically updating
                Text(Date.now.addingTimeInterval(600), style: .relative)

                // make a timer style, automatically updating
                Text(Date.now.addingTimeInterval(600), style: .timer)
            }
            Spacer()
        }

    }
}

struct DateInText_Previews: PreviewProvider {
    static var previews: some View {
        DateInText()
    }
}
