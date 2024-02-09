//
//  FavoriteView.swift
//  SideMenuSwiftUI
//
//  Created by Zeeshan Suleman on 04/03/2023.
//

import SwiftUI

struct FavoriteView: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack{
            Spacer()
            Text("Favorite View")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}
