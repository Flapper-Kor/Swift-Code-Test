//
//  TabView_Basic.swift
//  Z_Example
//
//  Created by Flapper on 2/22/24.
//
import SwiftUI


// tabview는 태깅해서 사용한다.
// 기본적인 UI 를 쓰지 않고, 탭바 스타일을 변경해서 사용할 수도 있지만,
// 그렇게 사용하려면 스크롤뷰나 HStack을 사용한 스크롤 뷰를 따로 만들어서 사용하는 것이 좋을 수 있다.
// 최대 탭 개수가 10개로 제한되어 있다.
//
struct TabView_Basic: View{
    @State private var index = 0

    var body: some View {
        TabView(selection:$index) {
            VStack{
                Text("SomeView1")

                Text("Go LoginView").onTapGesture {
                    self.index = 2
                }
                Text("Go HelloView").onTapGesture {
                    self.index = 3
                }
            }
            .tag(0)
            .tabItem {
                Image(systemName: "arrow.right.circle.fill")
                Text("Login")
            }
            
            VStack{
                Text("SomeView2")
                
            }
            .tag(1)
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Hello")
            }
            
            VStack{
                Text("SomeView3")

            }
            .tag(2)
            .badge(2)
            .tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
            VStack{
                Text("SomeView3")

            }
            .tag(3)
            .badge(2)
            .tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
            VStack{
                Text("SomeView3")

            }
            .tag(4)
            .badge(2)
            .tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
            VStack{
                Text("SomeView3")

            }
            .tag(3)
            .badge(2)
            .tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
            VStack{
                Text("SomeView3")

            }
            .tag(5)
            .badge(2)
            .tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
            VStack{
                Text("SomeView3")

            }
            .tag(3)
            .badge(2)
            .tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
            VStack{
                Text("SomeView3")

            }
            .tag(6)
            .badge(2)
            .tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
            VStack{
                Text("SomeView3")

            }
            .tag(7)
            .badge(2)
            .tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
            VStack{
                Text("SomeView3")

            }
            .tag(8)
            .badge(2)
            .tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
        }
//        .tabViewStyle(.verticalPage) // only watchOS
//        .tabViewStyle(.page)
//        .tabViewStyle(.page(indexDisplayMode: .always))
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

        .accentColor(.purple)                                               // 선택된 컬러 및 뷰 내부의 버튼 등의 색깔...
        .onAppear {
            #if canImport(UIKit)
            UITabBar.appearance().backgroundColor = .black                  // 탭뷰 백그라운드 컬러
            UITabBar.appearance().unselectedItemTintColor = UIColor.white   // 선택되지 않은 탭뷰 아이템의 컬러
            #endif
        }
    }
}
