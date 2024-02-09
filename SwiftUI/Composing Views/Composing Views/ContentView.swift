//
//  ContentView.swift
//  Composing Views
//
//  Created by Slash on 2023/07/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TabView{
                InsertImageIntoText()
                ModifierForUIViewRepresentable()
                WrappingUIView()
                CustomModifier()
                StoreViewAsProperty()
                CombineTextViews()
                Create()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabItem{
                Image(systemName: "ipad.landscape.badge.play")
                Text("HWS")
            }
//            .border(.red)
        }
        .accentColor(.purple)                                               // 선택된 컬러 및 뷰 내부의 버튼 등의 색깔...
        .onAppear {
            UITabBar.appearance().backgroundColor = .black                  // 탭뷰 백그라운드 컬러
            UITabBar.appearance().unselectedItemTintColor = UIColor.white   // 선택되지 않은 탭뷰 아이템의 컬러
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
