//
//  CombineTextViews.swift
//  Composing Views
//
//  Created by Slash on 2023/07/09.
//

import SwiftUI

struct CombineTextViews: View {
    
    var body: some View {
        VStack{
            Text("SwiftUI ")
                .font(.largeTitle).foregroundColor(Color.red).fontWeight(.black)
            + Text("is ")
                .font(.headline).foregroundColor(.orange)
            + Text("awesome")
                .font(.footnote).foregroundColor(.blue)
        }
    }
}

struct CombineTextViews_Previews: PreviewProvider {
    static var previews: some View {
        CombineTextViews()
    }
}
