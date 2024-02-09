//
//  ContentView.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            TabView{
                if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *){
                    GetRGBFromColor()
                }
                else{
                    GetRGBFromColor_obsolated()
                }
                VideosUsingPhotosPicker()
                UsingSprite()
                UsingVideoPlayer()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabItem {
                Image(systemName: "ipad.landscape.badge.play")
                Text("media")
            }
            .tag(0)
            TabView{
                ContainerRelativeShape()
                UsingTrim()
                FillAndStrokeShapes()
                SolidShapes()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabItem{
                Image(systemName: "ipad.landscape.badge.play")
                Text("Shapes")
            }
            .tag(1)
            
            TabView{
//                AnimateSFSymbol()  // iOS 17.0 or later
                PicturesUsingPhotosPicker()
                DynamicSFSymbol()
                LoadRemoteImage()
                UsingAppBundle()
                BackgroundImage()
                UsingGradient()
                SFSymbol()
                TileImage()
                ScaledImage()
                DrawUsingImageView()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabItem{
                Image(systemName: "ipad.landscape.badge.play")
                Text("Images")
            }
            .tag(2)
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
