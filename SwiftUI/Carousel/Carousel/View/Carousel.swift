//
//  Carousel.swift
//  Carousel
//
//  Created by Flapper on 2/20/24.
//


import SwiftUI

class State_ID<T>: ObservableObject where T:Hashable, T:Identifiable{
    @Published var currentID : T.ID?
    init(currentID: T.ID? = nil){
        self.currentID = currentID
    }
}

class IDSet<T>: ObservableObject where T:Hashable, T:Identifiable{
    @Published var currentID : T.ID?
    init(currentID: T.ID? = nil){
        self.currentID = currentID
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)  // containerRelativeFrame, scrollTargetLayout ...
struct Carousel<T, Content:View>: View where T: Hashable, T:Identifiable{
    
//    @State private var currentItem: T?
    @Binding private var currentItem: T?
    
    var content: (T) -> Content
    var items: [T]
    
    init (
        // necessary properties
        items: [T],
        
        // content
        currentItem: Binding<T?>,
        @ViewBuilder content: @escaping (T) -> Content
    )
    {
        // content
        self.content = content
        
        // necessary properties
        self.items = items
        
        self._currentItem = currentItem
    }
    
    @ViewBuilder
    var body: some View {
        VStack (spacing: 0){
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(items) { item in
                        Group{
                            Container{
                                content(item)
                            }
                            // id 는 foreach 구분 내부의 가장 바깥쪽 view 에 위치시키도록 한다.
                            // 만약 그렇게 하지 않으면, id 값이 제대로 먹지 않는 경우가 있다.
                            // 참고로 group은 뷰가 아니다.
                            .id(item)
                            // containerRelativeFrame의 위치는 id 값과는 달리 크게 상관 없다.
                            .containerRelativeFrame(.horizontal) { width, _ in
                                return width
                            }
                        }
                    }
                }
                // 해당 속성은
                .scrollTargetLayout()
            }
            .scrollPosition(id: $currentItem)  // scrollPosition : 스크롤 뷰에서 포지셔닝을 위한 id 값 바인딩
            .scrollIndicators(.hidden)          // 스크롤 뷰 인디케이터
            .scrollTargetBehavior(.paging)
        }
        .onAppear {
            // binding update
            guard let _ = self.currentItem else { self.currentItem = self.items.first; return }
            // End of binding update
        }
        .onChange(of: currentItem) { _, newValue in
            // binding update
            // 스크롤 포지션이 변할 때, 바인딩 된 값을 업데이트
            self.currentItem = newValue
            // End of binding update
        }
    }
}


@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
struct Carousel_ID<T, Content:View>: View where T: Hashable, T:Identifiable{
    
    var content: (T) -> Content
    var items: [T]
    
//    @State var currentID : T.ID?
    @Binding var currentID : T.ID?
    
    init (
        // necessary properties
        items: [T],
        currentID: Binding<T.ID?>,
        
        @ViewBuilder content: @escaping (T) -> Content
    )
    {
        // content
        self.content = content
        
        // necessary properties
        self.items = items
//        if let ids = idSet{
//            self.idSet = ids
//        }
        self._currentID = currentID
    }
    var body: some View {
        VStack (spacing: 0){
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
//                    ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    ForEach(items){ item in
                        Container{
                            content(item)
                        }
                        .id(item.id)
                        .containerRelativeFrame(.horizontal) { width, _ in
                            return width
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $currentID)  // scrollPosition : 스크롤 뷰에서 포지셔닝을 위한 id 값 바인딩
            //            .scrollPosition(id: idSet.$currentID, anchor: UnitPoint(x: 0, y: 0))
            .scrollIndicators(.hidden)          // 스크롤 뷰 인디케이터
            .scrollTargetBehavior(.paging)
        }
        .background()
        .onAppear {
        }
        .onChange(of: currentID) { oldValue, newValue in
            
        }
    }
}


/**
 this is for seperate code, in layout and loops
 
 This struct is designed to separate the design and data loop function code.
 Since nested binding variables are not allowed, input and output IDs are provided to replace nested binding through idSet (reference type).
  
  - Parameters:
    - items: Data array to be displayed in a carousel
    - idSet: IDs to specify selected item
             for more infomation, see the [IDSet](IDSetDocC)
    - content: The view closure to be rendered
 
 
  - Authors: Flapper
 */
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
struct Carousel_IDSet<T, Content:View>: View where T: Hashable, T:Identifiable{
    
    var content: (T) -> Content
    var items: [T]
    
    @ObservedObject var idSet: IDSet<T>

    init (
        // necessary properties
        items: [T],
        idSet: IDSet<T>,
        
        @ViewBuilder content: @escaping (T) -> Content
    )
    {
        // content
        self.content = content
        
        // necessary properties
        self.items = items
//        if let ids = idSet{
//            self.idSet = ids
//        }
        self.idSet = idSet
    }
    var body: some View {
        Carousel_IDSet_layout(idSet: self.idSet) {
//            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
            ForEach(items){ item in
                Container{
                    content(item)
                }
                .id(item.id)
                .containerRelativeFrame(.horizontal) { width, _ in
                    //                            print(width)
                    return width
                }
            }
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
fileprivate struct Carousel_IDSet_layout<T, Content:View>: View where T: Hashable, T:Identifiable{
    
    var content: () -> Content
    @ObservedObject var idSet: IDSet<T>
    
    init (
        // necessary properties
        idSet: IDSet<T>,
        
        @ViewBuilder content: @escaping () -> Content
    ){
        // content
        self.content = content
        
        // necessary properties
        self.idSet = idSet
    }
    
    var body: some View{
        VStack (spacing: 0){
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    content()
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $idSet.currentID)  // scrollPosition : 스크롤 뷰에서 포지셔닝을 위한 id 값 바인딩
            //            .scrollPosition(id: idSet.$currentID, anchor: UnitPoint(x: 0, y: 0))
            .scrollIndicators(.hidden)          // 스크롤 뷰 인디케이터
            .scrollContentBackground(.hidden)
            .scrollTargetBehavior(.paging)
        }
        .onAppear {  }
    }
}

// To for Accepting List...
/**
 Carousel using HStack, GeomertyReader,
 
 For iOS 17.0 and higher, it is recommended to use a scroll view and a carousel using the containerRelativeFrame modifier.
 
 This refers to the Carousel class.
 
 - Parameters:
   - spacing: space between items (pixel)
   - trailingSpace: Distance to be additionally exposed to the screen (pixel)
   - index: index for items (binding)
   - items: Array of items to be displayed in the carousel
   - content: Composition of content to be expressed
 
 > Usage:
 if let post
 ```
 struct Post: Identifiable {
     var id = UUID().uuidString
     var postImage: String
 }
 
 ```
 > Warning: Use the Carousel() instead in upper os versions below
 > iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0
 */
@available(iOS, deprecated: 17.0, obsoleted: 10000.0, message: "use the Carousel instead in upper os versions")
@available(macOS, deprecated: 14.0, obsoleted: 10000.0, message: "use the Carousel instead in upper os versions")
@available(tvOS, deprecated: 17.0, obsoleted: 10000.0, message: "use the Carousel instead in upper os versions")
@available(watchOS, deprecated: 10.0, obsoleted: 10000.0, message: "use the Carousel instead in upper os versions")
struct Carousel_lowerVersion<Content: View, T: Identifiable>: View {
    var content: (T) -> Content
    var items: [T]
    
    // Properties...
    var spacing: CGFloat = 0
    var trailingSpace: CGFloat = 0

//
    @Binding var currentID: T.ID?
    
    // offset....
    @GestureState var offset: CGFloat = 0
    
//    @State var index: Int = 0
    @State var currentIndex: Int = 0
    
    /**
     Carousel using HStack, GeomertyReader,
     
     For iOS 17.0 and higher, it is recommended to use a scroll view and a carousel using the containerRelativeFrame modifier.
     
     This refers to the Carousel class.
     
     - Parameters:
       - index: index for items (binding)
       - items: Array of items to be displayed in the carousel
       - spacing: space between items (pixel)
       - trailingSpace: Distance to be additionally exposed to the screen (pixel)
       - content: Composition of content to be expressed
     */
    init(
        currentID: Binding<T.ID?>,
        items: [T],
        spacing: CGFloat = 0,
        trailingSpace: CGFloat = 0,
        @ViewBuilder content: @escaping (T) -> Content
    ){
        self.items = items
        self._currentID = currentID
        
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self.content = content
        
    }
    
    var body: some View{
        
        GeometryReader{ proxy in
            // One Sieded Snap Carousel....
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustMentWidth = (trailingSpace / 2) - spacing
            let contentWidth = proxy.size.width - trailingSpace
            
            ZStack{
//                Rectangle()
//                    .foregroundStyle(Color.clear)
                // Setting correct Width for snap Carousel.....
                
                LazyHStack(spacing: spacing){
                    ForEach(items){ item in
                        Container{
                            content(item)
                        }
                        .frame(width: contentWidth) // space
                        .id(item.id)
                        .onAppear{
                            self.currentID = item.id
                        }
                    }
                }
                .padding(.horizontal, spacing)
                .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : adjustMentWidth) + offset)
                
                
            }
            
            .gesture(
                DragGesture()
                    .updating($offset, body: {value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded { value in
                        // updating Current Index....
                        let offsetX = value.translation.width
                        
                        // were going to convert the translation into progress (0 - 1)
                        // and round the value....
                        // based the progress increasing or decreasing the currentIndex...
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(roundIndex), items.count - 1), 0)
                    }
                    .onChanged{ value in

                    }
            )
            // Animating when offset = 0
            .animation(.easeInOut, value: offset == 0)
            .onAppear{
                setIndex(currentID: self.currentID)
            }
            .onChange(of: currentIndex) { newValue in
                self.currentID = self.items[newValue].id
            }
        }
    }
    
    func setIndex(currentID:T.ID?){
        if currentID == nil {
            self.currentIndex = 0
        }else{
            if let idx = self.items.firstIndex(where: { Identifiable in Identifiable.id == currentID})
            {
                self.currentIndex = idx
            }else{
                self.currentIndex = 0
            }
        }
    }
}






/**
 캐러셀에 들어갈 뷰 아이템의 속성 설정
 
 캐러셀로 만들 컨텐츠에 대한 형태를 여기서 정의한다.
 Rectangle
    Rectangle 의 역할은 형태를 잡아주기 위함이다.
    ZStack 으로 Rectangle 을 구성하지 않으면 상위 뷰는 컨텐츠에 따라 크기가 변하기 때문에 이렇게 구성한다.
 */
fileprivate struct Container<Content:View>: View {
    
    @ViewBuilder let content: Content // in swift 5.4 or higher, if are not necessary initializer
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
            content
                .foregroundStyle(Color.black)
        }
        .background()
//        .aspectRatio(2, contentMode: .fit)
//        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
//        .background(Color.black)
//        .padding(.horizontal, 8)
        .border(.black)
    }
}
