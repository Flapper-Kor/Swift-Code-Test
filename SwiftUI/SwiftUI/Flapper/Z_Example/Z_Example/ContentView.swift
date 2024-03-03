//
//  ContentView.swift
//  Z_Example
//
//  Created by Flapper on 2/22/24.
//

import SwiftUI
import FlapperLayout
import Collections


class ViewList: ObservableObject{
    
//    var list = views // COW(Copy On Write) 로 복사
    var views : [ViewItem] =
    [
        ViewItem(subject: "SomeTest", view: SomeTest()),
        ViewItem(subject: "Geometry Reader (화면 방향 전환하여 사이즈 확인)", view: GeometryReader_Basic()),
        ViewItem(subject: "FocusState Basic", view: FocusState_Basic()),
        ViewItem(subject: "ScrollView Basic", view: ScrollView_Basic()),
        ViewItem(subject: "Codable Basic", view: Codable_Basic()),
        ViewItem(subject: "TabView Basic", view: TabView_Basic()),
        ViewItem(subject: "IndexStyle CustomIndexStyle", view: IndexStyle_CustomIndexStyle()),
        ViewItem(subject: "Clipping Basic", view: Clipping_Basic()),
        ViewItem(subject: "Sheet Basic", view: Sheet_Basic()),
        
        // 여기서부터는 순서 다시 정의
        // 위 항목들은 처음 것부터 정령해서 넣을 것
        ViewItem(subject: "Collection Basic", view: Collections_Basic())
        
    //    ViewItem(subject: "<#subject#>", view: <#view#>())
    //    ViewItem(subject: "<#subject#>", view: <#view#>())
    //    ViewItem(subject: "<#subject#>", view: <#view#>())
    ]
    
    @Published var current: ViewItem?
    
    @AppStorage ("currentIndex") var _currentIndex: Int = 0
    
    var currentIndex: Int{
        get{
            return self._currentIndex
        }
        set{
            if( 0 <= newValue && newValue < self.views.count){
                self._currentIndex = newValue
            }
        }
    }
    
    init(){
        
        print(self.currentIndex)
        self.current = views[self.currentIndex]
    }
    
    var hasNext : Bool {
        return (currentIndex < (self.views.count - 1))
    }
    
    var hasPrevious: Bool{
        return (currentIndex > 1)
    }
    
    var next : ViewItem? {
        if(self.hasNext){
            self.currentIndex += 1
            
            return self.current
        }
        else{
            return current
        }
    }
}

//struct ContentView: View{
//    var viewList = ViewList()
//    
//    var body: some View{
//        Container {
//            AnyView(viewList.views[8].view)
//            
//        }.border(.black)
//    }
//}
//
//struct Container <Content> : View where Content: View{
//    var content: ()-> Content
//    
//    init(@ViewBuilder _ content: @escaping () -> Content) {
//        self.content = content
//    }
//    
//    var body: some View{
//        ZStack{
//            Color.clear.background()
//            content()
//        }
//    }
//}


struct ContentView: View {
    @StateObject var viewList = ViewList()
    
    var body: some View{
        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *){
            ZStack{
                VStack(spacing: 0){
                    if let currentItem = viewList.current{
                        Text(currentItem.subject)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.purple)
                            .font(.footnote)
                    }
                    
                    else{
                        Text("Error : current is nil")
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.red)
                            .font(.footnote)
                    }
                    
                    Carousel(
                        items: viewList.views,
                        current: $viewList.current,
                        stackStyle: .normal
                    ) { item in
                        AnyView(item.view)
                    }
                }
                VStack{
                    HStack{
                        Image(systemName: "arrow.left")
                            .onTapGesture {
                                self.viewList.currentIndex -= 1
                            }
                            .disabled(!self.viewList.hasPrevious)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .onTapGesture {
                                self.viewList.currentIndex += 1
                            }
                            .disabled(!self.viewList.hasNext)
                            .foregroundStyle(Color.blue, Color.gray)
                    }
                    Spacer()
                }
            }
            .onChange(of: viewList.current) { _, newValue in
                if let index = self.viewList.views.firstIndex(of: viewList.current!){
                    self.viewList.currentIndex = index
                    print(self.viewList.currentIndex)
                }
            }
            .onChange(of: viewList.currentIndex) { newValue in
                self.viewList.current = viewList.views[self.viewList.currentIndex]
            }
            
        }
        else{
            VStack(spacing: 0){
                if let currentItem = viewList.current{
                    Text(currentItem.subject)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.purple)
                        .font(.footnote)
                }
                else{
                    Text("Loading . . .")
                }
                
                Carousel_lowerVersion(
                    items: viewList.views,
                    current: $viewList.current
                ) { item in
                    AnyView(item.view)
                }
            }
            .onChange(of: viewList.current) { newValue in
                if let index = self.viewList.views.firstIndex(of: viewList.current!){
                    viewList.currentIndex = index
                }
            }
            .onChange(of: viewList.currentIndex) { newValue in
                self.viewList.current = viewList.views[self.viewList.currentIndex]
            }
        }
    }
    
    

    
}

#Preview {
    ContentView()
}
