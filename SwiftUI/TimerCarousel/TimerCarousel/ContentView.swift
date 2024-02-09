//
//  ContentView.swift
//  TimerCarousel
//
//  Created by Slash on 2023/07/07.
//

// 결론부터 말하면...
/*
    탭뷰의 인덱스 자체를 변경해보고자 하는 생각이 있다면 아래를 읽고 아니면 패스
 
    복잡하게 생각하지 말고 인덱스 스타일을 변경하고 싶으면
    TabViewStyle 이랑 IndexViewStyle 이런거 프로토콜을 구현하려고 생각하지 말고,
    따로 뷰 만들어서 탭인덱스 바인딩하고 태그 달고, 원래 탭뷰 인덱스를 숨기는 식으로 구현해서 사용할 것.
    위 두 프로토콜을 구현하는 방법에 대한 래퍼런스가 찾아볼 수가 없고, 언어도 오픈소스가 아니라서
    코드를 살펴볼 수가 없다.
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        carouselTabview()
    }
}
    
struct carouselTabview:View{
    @State private var index = 0
//    @State private var

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
            .tag(3)
            .badge(2)
            .tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
        }
        
//        .tabViewStyle(.page(indexDisplayMode: .always))
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

        .accentColor(.purple)                                               // 선택된 컬러 및 뷰 내부의 버튼 등의 색깔...
        .onAppear {
            UITabBar.appearance().backgroundColor = .black                  // 탭뷰 백그라운드 컬러
            UITabBar.appearance().unselectedItemTintColor = UIColor.white   // 선택되지 않은 탭뷰 아이템의 컬러
        }
    }
}

//struct myTabViewStyle: TabViewStyle{
//
//
//    static func _makeView<SelectionValue>(value: _GraphValue<_TabViewValue<myTabViewStyle, SelectionValue>>, inputs: _ViewInputs) -> _ViewOutputs where SelectionValue : Hashable {
////        fatalError()
//        inputs
//
//        SquircleIndexView()
//        return
//    }
//
//    static func _makeViewList<SelectionValue>(value: _GraphValue<_TabViewValue<myTabViewStyle, SelectionValue>>, inputs: _ViewListInputs) -> _ViewListOutputs where SelectionValue : Hashable {
//        fatalError()
//    }
//
//
//}

//struct myPageTabViewStyle: TabViewStyle{
//
//    @State private static var numberOfIndex : Decimal = 0
//    @State private static var currentIndex : Decimal = 0
//
//    static func _makeView<SelectionValue>(value: _GraphValue<_TabViewValue<myPageTabViewStyle, SelectionValue>>, inputs: _ViewInputs) -> _ViewOutputs where SelectionValue : Hashable {
//        print("makeView")
//        return SquircleIndexView(numberOfPages: numberOfIndex, currentIndex: currentIndex)
//    }
//
//    static func _makeViewList<SelectionValue>(value: _GraphValue<_TabViewValue<myPageTabViewStyle, SelectionValue>>, inputs: _ViewListInputs) -> _ViewListOutputs where SelectionValue : Hashable {
////        PageTabViewStyle._makeViewList(value: value, inputs: inputs)
//
//        return SquircleIndexView(numberOfPages: numberOfIndex, currentIndex: currentIndex)
//    }
////    typealias _ViewOutputs = SquircleIndexView
//}
//
//struct myindexViewStyle: IndexViewStyle{
////    typealias _Body =
//
////    public struct BackgroundDisplayMode {
////        /// Background will use the default for the platform.
////        public static let automatic: myindexViewStyle.BackgroundDisplayMode = .automatic
////
////        /// Background is always displayed behind the page index view.
////        public static let always: myindexViewStyle.BackgroundDisplayMode
////
////        /// Background is never displayed behind the page index view.
////        public static let never: myindexViewStyle.BackgroundDisplayMode
////    }
////
////    public init(backgroundDisplayMode: myindexViewStyle.BackgroundDisplayMode = .automatic)
//
//    @State private var indexDisplayMode: _Configuration
//    @State private var numberOfIndex : Decimal = 0
//    @State private var currentIndex : Decimal = 0
//
//    func _makeBody(configuration: _Configuration) -> SquircleIndexView {
//        print(configuration)
//        return _Body(numberOfPages: numberOfIndex, currentIndex: currentIndex)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
