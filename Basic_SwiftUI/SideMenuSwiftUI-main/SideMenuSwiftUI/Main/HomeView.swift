//
//  HomeView.swift
//  SideMenuSwiftUI
//
//  Created by Zeeshan Suleman on 04/03/2023.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack{
            Spacer()
            Text("Home View")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}
