import SwiftUI

struct ContentView: View{
    var body: some View{
        TabView{
            TabView{
                OverrideAnimation()
                TextSize()
                CustomTranstion()
                CombineTransition()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabItem{
                Image(systemName: "ipad.landscape.badge.play")
                Text("HWS")
            }
            .border(.red)
            TabView{
                RemoveViewTransition()
                SynchronizeAnimation()
                MultipleAnimationInAView()
                ViewExtensionForAnimation()
                AnimationInOnAppear()
                DelayAnAnimation()
                ExplicitAnimation()
                AnimationWithBinding()
                Spring()
                AnimationModifier()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabItem{
                Image(systemName: "ipad.landscape.badge.play")
                Text("HWS")
            }
            .border(.red)
            TabView{
                Drag_Views()
                DragNDrop_Canvas()
                DragNDrop_Views()
                DragNDrop() // Drag N Drop
                FlipTestView() // flip TEST 1
                FlipEx2() // flip TEST 2
                ShowSub() // subview
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabItem{
                Image(systemName: "ipad.landscape.badge.play")
                Text("My")
            }
//            .border(.red)
        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

        .accentColor(.purple)                                               // 선택된 컬러 및 뷰 내부의 버튼 등의 색깔...
        .onAppear {
            UITabBar.appearance().backgroundColor = .black                  // 탭뷰 백그라운드 컬러
            UITabBar.appearance().unselectedItemTintColor = UIColor.white   // 선택되지 않은 탭뷰 아이템의 컬러
        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//        .background(Color(red: 0.5, green: 0.5, blue: 0.5))
//        .border(.yellow)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
