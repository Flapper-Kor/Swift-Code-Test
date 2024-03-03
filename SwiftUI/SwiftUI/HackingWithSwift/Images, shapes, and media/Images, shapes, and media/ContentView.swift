//
//  ContentView.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI
import FlapperLayout

struct ContentView: View {
    @State var currentID: ViewItem.ID?
    var list : [ViewItem] = []
    
    init(){
        
        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *){
            self.list.append(ViewItem(subject: "컬러로부터 RGB 색상값 가져오기", view: GetRGBFromColor()))
        }
        else{
            self.list.append(ViewItem(subject: "컬러로부터 RGB 색상값 가져오기", view: GetRGBFromColor_obsolated()))
        }
        
        self.list.append(ViewItem(subject: "PhotosPicker 사용한 비디오", view: VideosUsingPhotosPicker()))
        self.list.append(ViewItem(subject: "Sprite 사용", view: UsingSprite()))
        self.list.append(ViewItem(subject: "VideoPlayer 사용", view: UsingVideoPlayer()))
        self.list.append(ViewItem(subject: "Using ContainerRelativeShape(위젯에서만 사용 가능)", view: UsingContainerRelativeShape()))
        self.list.append(ViewItem(subject: "Using trim", view: UsingTrim()))
        self.list.append(ViewItem(subject: "Fill and Stroke", view: FillAndStrokeShapes()))
        self.list.append(ViewItem(subject: "SolidShape", view: SolidShapes()))
        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *){
            self.list.append(ViewItem(subject: "Animate SF Symbol", view: AnimateSFSymbol()))
        }
        
        self.list.append(ViewItem(subject: "Pictures Using PhotosPicker", view: PicturesUsingPhotosPicker()))
        self.list.append(ViewItem(subject: "Dynamic SF Symbol", view: DynamicSFSymbol()))
        self.list.append(ViewItem(subject: "Load Remote Image", view: LoadRemoteImage()))
        self.list.append(ViewItem(subject: "Using App Bundle", view: UsingAppBundle()))
        
        self.list.append(ViewItem(subject: "Background Image", view: BackgroundImage()))
        self.list.append(ViewItem(subject: "Using Gradient", view: UsingGradient()))
        self.list.append(ViewItem(subject: "SF Symbol", view: SFSymbol()))
        self.list.append(ViewItem(subject: "Tile Image", view: TileImage()))
        self.list.append(ViewItem(subject: "Scaled Image", view: ScaledImage()))
        self.list.append(ViewItem(subject: "Draw Using ImageView", view: DrawUsingImageView()))
        
//        self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
//        self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
    }
    
    var body: some View{
        if #available(iOS 17, *){
            VStack(spacing: 0){
                if (!(list.isEmpty)){
                    if let currentItem = list.filter({$0.id == currentID}).first{
                        Text(currentItem.subject)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.purple)
                            .font(.footnote)
                    }
                }
                else{
                    Text("Loading . . .")
                }
                
                Carousel_ID(
                    items: list,
                    currentID: $currentID,
                    stackStyle: .normal
                ) { item in
                    AnyView(item.view)
                }
            }
            .onAppear{
                // case using Carousel_ID
                self.currentID = list.first?.id
            }
        }
        else{
            VStack(spacing: 0){
                if (!(list.isEmpty)){
                    if let currentItem = list.filter({$0.id == currentID}).first{
                        //                if let currentItem = viewList.list.indices.contains(currentindex) ? viewList.list[currentindex] : nil{
                        Text(currentItem.subject)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.purple)
                            .font(.footnote)
                    }
                }
                else{
                    Text("Loading . . .")
                }
                
                Carousel_ID_lowerVersion(
                    items: list,
                    currentID: $currentID
                ) { item in
                    AnyView(item.view)
                }
            }
        }
    }
}
        
        
//        TabView(selection: $selection){
//            TabView{
//                if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *){
//                    GetRGBFromColor()
//                }
//                else{
//                    GetRGBFromColor_obsolated()
//                }
//                VideosUsingPhotosPicker()
//                UsingSprite()
//                UsingVideoPlayer()
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//            .tabItem {
//                Image(systemName: "ipad.landscape.badge.play")
//                Text("media")
//            }
//            .tag(0)
//            TabView{
//                UsingContainerRelativeShape()
//                UsingTrim()
//                FillAndStrokeShapes()
//                SolidShapes()
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//            .tabItem{
//                Image(systemName: "ipad.landscape.badge.play")
//                Text("Shapes")
//            }
//            .tag(1)
            
//            TabView{
//                AnimateSFSymbol()  // iOS 17.0 or later
//                PicturesUsingPhotosPicker()
//                DynamicSFSymbol()
//                LoadRemoteImage()
//                UsingAppBundle()
//                BackgroundImage()
//                UsingGradient()
//                SFSymbol()
//                TileImage()
//                ScaledImage()
//                DrawUsingImageView()
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//            .tabItem{
//                Image(systemName: "ipad.landscape.badge.play")
//                Text("Images")
//            }
//            .tag(2)
//        }
//        .accentColor(.purple)                                               // 선택된 컬러 및 뷰 내부의 버튼 등의 색깔...
//        .onAppear {
//            UITabBar.appearance().backgroundColor = .black                  // 탭뷰 백그라운드 컬러
//            UITabBar.appearance().unselectedItemTintColor = UIColor.white   // 선택되지 않은 탭뷰 아이템의 컬러
//        }
//    }
//}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
