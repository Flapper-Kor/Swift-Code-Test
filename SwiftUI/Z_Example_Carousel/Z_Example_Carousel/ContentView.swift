//
//  ContentView.swift
//  Z_Example_Carousel
//
//  Created by Flapper on 2/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedID: UUID?
    @FocusState private var focusID: UUID?
    private let initialID: UUID

    var items: [Item]

    init(){
        items = [Item]()
        for _ in 1...30 {
            items.append(Item())
        }
        initialID = items.first!.id
        focusID = items.first?.id
        
    }
    
    var body: some View {
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 0) {
//                ForEach(items) { item in
//                    ItemView(item: item)
//                        .containerRelativeFrame(.horizontal, count: 3, span: <#T##Int#>, spacing: <#T##CGFloat#>, alignment: <#T##Alignment#>)
//                        .border(.red)
//                        .frame(width: 15, height: 15, alignment: .center)
//                }
//                
//
//            }
//        }
//        ItemView(item: items[0])
//        HStack{
//            
//            ForEach(items) { item in
//                ItemView(item: item)
//                        .aspectRatio(3.0 / 2.0, contentMode: .fit)
//                    .containerRelativeFrame(
//                        .horizontal,        // 규직을 정의할 방향
//                        count: 5,           // 컨테이너를 나눌 수 (아래의 span과 반대)
//                        span: 1,            // 뷰가 실제로 차지해야 하는 행이나 열의 수
//                        spacing: 0,         // 컨테이너 사이의 간격
//                        alignment: .bottom  //
//                    )
//            }
//        }
        
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 0) {
//                ForEach(items) { item in
//                    ItemView(item: item)
////                        .aspectRatio(3.0 / 2.0, contentMode: .fit)
//                        .containerRelativeFrame(
//                            .horizontal,        // 규직을 정의할 방향
//                            count: 5,           // 컨테이너를 나눌 수 (아래의 span과 반대)
//                            span: 1,            // 뷰가 실제로 차지해야 하는 행이나 열의 수
//                            spacing: 0,         // 컨테이너 사이의 간격
//                            alignment: .bottom  //
//                        )
//                }
//            }
//            .border(.red)
//        }
//        .safeAreaPadding(.horizontal, 20.0)
        
        

        
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(items) { item in
                        ItemView(item: item)
//                            .containerRelativeFrame(.horizontal) { width, _ in
//                                min(width, .infinity)
//                            }
                            .containerRelativeFrame(
                                .horizontal,        // 규직을 정의할 방향
                                count: 10,           // 컨테이너를 나눌 수 (아래의 span과 반대)
                                span: 1,            // 뷰가 실제로 차지해야 하는 행이나 열의 수
                                spacing: 0,         // 컨테이너 사이의 간격
                                alignment: .center  // 잘 모르겠음
                            )
//                            .containerRelativeFrame(.horizontal)
//                            .focused($focusID, equals: item.id)
                            .onTapGesture {
                                if (item.id != selectedID){
                                    selectedID = item.id
                                    print(selectedID)
                                }
                            }
                    }
                }
            }
            .scrollPosition(id: $selectedID)
            .scrollIndicators(.never)          // 스크롤 막대 숨기기
            .scrollTargetBehavior(.paging)
        }
        .background()
        .onAppear { selectedID = initialID }
        .onChange(of: selectedID) { focusID = $1 }
        .border(.red)
    }
}


struct ItemView : View {
    var item : Item
    
    @State private var _currentOffset: CGSize = .zero
    
    var currentOffset: CGSize{
        get { return self._currentOffset }
    }

    @State private var isDragging = false
    
    @State private var draggedOffset = CGSize.zero
    @State private var accumulatedOffset = CGSize.zero
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                withAnimation(.spring()) {
                    draggedOffset = accumulatedOffset + gesture.translation
                }
            }
            .onEnded { gesture in
                withAnimation(.spring()) {
                    accumulatedOffset = accumulatedOffset + gesture.translation
                }
            }
    }
    

    
    var body: some View{
        VStack{
            Text("\(currentOffset.width)")
            Text(item.string)
        }
        .frame(width: 200, height: 400)
        .background(Color.blue)
        .border(.black)
        .offset(draggedOffset)
        .gesture(drag)
    }

}

extension CGSize {
  static func + (lhs: Self, rhs: Self) -> Self {
    CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
  }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: 0.5
        )
    }
}

// model
class Item : Identifiable {
    var id : UUID = UUID()
    var string : String
    init(){
        string = id.uuidString
    }
}



#Preview {
    ContentView()
}
