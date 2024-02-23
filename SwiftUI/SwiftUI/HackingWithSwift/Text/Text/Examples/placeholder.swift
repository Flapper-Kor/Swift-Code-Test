//
//  placeholder.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

import SwiftUI

struct placeholder: View {
    
    @Environment(\.redactionReasons) var redactionReasons
    let bio = "The rain in Spain falls mainly on the Spaniards"
    
    @State var textfield = ""
    
    var body: some View {
        VStack{
            Text("This is placeholder text")
                .font(.title)
                .redacted(reason: .placeholder)
            
            VStack {
                Text("This is placeholder text")
                Text("And so is this")
            }
            .font(.title)
            .redacted(reason: .placeholder)

            
            
            VStack{
                Text(bio)
                    .redacted(reason: redactionReasons)
//  
//                if redactionReasons == .placeholder {
//                    Text("Loading…")
//                } else {
//                    Text(bio)
//                        .redacted(reason: redactionReasons)
//                }
            }
        }
    }
}

struct placeholder_Previews: PreviewProvider {
    static var previews: some View {
        placeholder()
    }
}
