//
//  ProfileView.swift
//  SideMenuSwiftUI
//
//  Created by Zeeshan Suleman on 04/03/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                } label: {
                    Image("menu")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
            }
            .border(.black)
            Spacer()
                .border(.black)
            Text("Profile View")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .border(.black)
            Spacer()
                .border(.black)
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
//        .padding(.horizontal, 24)
        .border(.red)
    }
}
