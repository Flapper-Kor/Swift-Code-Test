//
//  StoreViewAsProperty.swift
//  Composing Views
//
//  Created by Slash on 2023/07/09.
//
/*
 Updated for Xcode 15 beta 1

 If you have several views nested inside another view, you might find it useful to create properties for some or all of them to make your layout code easier. You can then reference those properties inline inside your view code, helping to keep it clear.

 For example, this creates two text views as properties, then places them inside a VStack:
 */

import SwiftUI

struct StoreViewAsProperty: View {
    let title = Text("Paul Hudson")
                    .bold()
    let subtitle = Text("Author")
                    .foregroundColor(.secondary)

    var body: some View {
        VStack {
            title
            title.foregroundColor(.blue)
            subtitle
        }
    }
}

struct StoreViewAsProperty_Previews: PreviewProvider {
    static var previews: some View {
        StoreViewAsProperty()
    }
}
