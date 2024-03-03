//
//  ScrollView_Basic.swift
//  Z_Example
//
//  Created by Flapper on 2/22/24.
//
import SwiftUI


struct ScrollView_Basic: View {
    @State private var selectedID: UUID?
    var items: [Item]

    init(){
        items = [Item]()
        for _ in 1...30 {
            items.append(Item())
        }
    }
    
    var body: some View {
        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *){
            VStack{
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0) {
                            ForEach(items, id: \.id) { item in
                                ItemView(item: item)
                                    .containerRelativeFrame(.horizontal) { width, _ in
                                        min(width, .infinity)
                                    }
                                    .onTapGesture {
                                        if (item.id != selectedID){
                                            selectedID = item.id
                                            print(selectedID as Any)
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
                .border(.red)
                
                Spacer(minLength: 30)
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0) {
                            ForEach(items, id: \.id) { item in
                                ItemView(item: item)
                                    .containerRelativeFrame(
                                        .horizontal,        // 규직을 정의할 방향
                                        count: 2,           // 컨테이너를 나눌 수 (아래의 span과 반대)
                                        span: 1,            // 뷰가 실제로 차지해야 하는 행이나 열의 수
                                        spacing: -50,         // 컨테이너 사이의 간격
                                        alignment: .center  // 잘 모르겠음
                                    )
                                    .onTapGesture {
                                        if (item.id != selectedID){
                                            selectedID = item.id
                                            print(selectedID as Any)
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
                .border(.red)
            }
        }
    }
}


struct ItemView : View {
    var item : Item
    
    @State private var _currentOffset: CGSize = .zero
    
    var currentOffset: CGSize{
        get { return self._currentOffset }
    }

//    @State private var isDragging = false
    
    @State private var draggedOffset = CGSize.zero
    @State private var accumulatedOffset = CGSize.zero
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { gesture in
//                withAnimation(.snappy) {
                    draggedOffset = accumulatedOffset + gesture.translation
                print(draggedOffset)
//                }
            }
            .onEnded { gesture in
//                withAnimation(.spring()) {
                if(abs(draggedOffset.height) < 200){
                    draggedOffset = .zero
                }else{
                    
                }
                accumulatedOffset = .zero
//                    accumulatedOffset = accumulatedOffset + gesture.translation
//                }
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
