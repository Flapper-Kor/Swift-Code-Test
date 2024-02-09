//
//  ContentView.swift
//  Text
//
//  Created by Slash on 2023/07/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TabView{
                TextSelection()
                CustomizeTheWayLinkOpened()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabItem {
                Image(systemName: "ipad.landscape.badge.play")
                Text("Link")
            }
            TabView{
                MarkdownContents()
                PrivateContents()
                placeholder()
                UsingImageInText()
                TextCase()
                DateInText()
                Spacing()
                FommatText()
                compareAlignment()
                multilineTextAlignment_Ex1()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabItem{
                Image(systemName: "ipad.landscape.badge.play")
                Text("Text")
            }
            
            TabView{
                UsingAttributedString9() // handle structured information (Measure)
                UsingAttributedString8() // handle structured information (Name)
                UsingAttributedString7() // handle structured information (Date)
                UsingAttributedString6() // keep metadata (like accessibilitySpeechSpellsOutCharacters)
                UsingAttributedString5() // Link Property
                UsingAttributedString4() // baseLineOffset ++ Async thread
                UsingAttributedString3() // underlineStyle
                UsingAttributedString2() // combine String
                UsingAttributedString1() // background, foreground
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabItem{
                Image(systemName: "ipad.landscape.badge.play")
                Text("Attributed String")
            }
            

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
