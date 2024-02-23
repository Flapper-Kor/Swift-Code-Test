//
//  PrivateContents.swift
//  Text
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI

struct PrivateContents: View {
    @Environment(\.redactionReasons) var redactionReasons
    var body: some View {
        VStack{
            Section{
                Group{
                    PrivateContents_SubView()
                }
            }
            Section{
                Group{
                    PrivateContents_SubView2()
                }
                
            }
        }
        .redacted(reason: .privacy)
    }
}

struct PrivateContents_SubView : View{
    var body: some View {
        VStack {
            Text("Card number")
                .font(.headline)

            Text("1234 5678 9012 3456")
                .privacySensitive()
        }
    }
}

struct PrivateContents_SubView2: View{
    @Environment(\.redactionReasons) var redactionReasons

    var body: some View {
        VStack {
            Text("Card number")
                .font(.headline)

            if redactionReasons.contains(.privacy) {
                Text("[HIDDEN]")
            } else {
                Text("1234 5678 9012 3456")
            }
        }
    }
}

struct PrivateContents_Previews: PreviewProvider {
    static var previews: some View {
        PrivateContents()
    }
}
