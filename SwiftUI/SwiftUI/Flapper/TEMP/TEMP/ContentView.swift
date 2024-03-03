//
//  ContentView.swift
//  TEMP
//
//  Created by Flapper on 2/27/24.
//

import SwiftUI
import SwiftData
import Collections
import FlapperLayout

/*
public class ViewItem : Identifiable{
    
    public var subject : String
    public var view: any View
    
    public init(subject: String, view: any View) {
        self.subject = subject
        self.view = view
    }
}

extension ViewItem: Hashable {
    public static func == (lhs: ViewItem, rhs: ViewItem) -> Bool {
        lhs.id == rhs.id &&
        lhs.subject == rhs.subject
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(subject)
    }
}

 */


//@Model
class Entity : Identifiable, CustomStringConvertible{
    var subject : String
    var number : Int
    
    init(_ subject: String, _ number: Int) {
        self.subject = subject
        self.number = number
    }
    
    init(_ number: Int){
        self.number = number
        self.subject = number.description
    }
    
    var description: String{
        return "subject : " + self.subject + ", number : " + self.number.description
    }
}

extension Entity : Hashable {
    public static func == (lhs: Entity, rhs: Entity) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(subject)
    }
}

struct ContentView: View{
    @State var currentEntity: Entity?
    
    @AppStorage ("currentIndex") var currentIndex: Int = 0
    
    var items: [Entity]
    
    @State var stateString : String?
    
    init(){
        self.items = []
        for i in 1...10{
            self.items.append(Entity(i))
        }
        
        self._currentEntity = State<Entity?>(initialValue: self.items[self.currentIndex])
//        print(currentEntity)
    }
    
    var body: some View{
        ZStack{
            VStack{
                
                if let entity = currentEntity{
                    Text(entity.subject + entity.id.debugDescription)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.purple)
                        .font(.footnote)
                }
                if let stateus = stateString{
                    Text(stateus)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.purple)
                        .font(.footnote)
                }
                Carousel(
                    items: items,
                    current: $currentEntity)
                { item in
                    VStack{
                        Text(item.description)
                    }
                }
            }
            .onAppear{
                print("VStack onappear")
                /*
                 @State 변수는 이니셜라이저에서 초기화 하려면, 조금 복잡한 방법을 사용해야 함
                      self._currentEntity = State<Entity?>(initialValue: self.items[self.currentIndex])
                 @State 변수의 초기화는 onAppear 함수 내에서 실행하도록 한다.
                 
                 onAppear의 호출은 바깥쪽 뷰부터 안쪽 뷰로 계층적으로 이뤄진다.
                 */
    //            print(self.currentIndex)
    //            if currentEntity == nil{
    //                self.currentEntity = self.items[self.currentIndex]
    //                self.stateString = "onAppear : currentEntity are set"
    //
    //            }
    //            else{
    //                self.stateString = "onAppear : currentEntity are not set"
    //            }
            }

            
            VStack{
                HStack{
                    Image(systemName: "arrow.left")
                        .onTapGesture {
                            self.currentIndex += 1
                        }
                    Spacer()
                    Image(systemName: "arrow.right")
                        .onTapGesture {
                            self.currentIndex -= 1
                        }
                }
                Spacer()
            }
        }
        .onChange(of: currentEntity) { oldValue, newValue in
            print("onchange\n    currentEntity : ", currentEntity as Any, "\n    currentIndex  : ", currentIndex)
            if let index = items.firstIndex(of: currentEntity!){
                currentIndex = index
            }
        }
        
        .onAppear{
//            var array: Array<Int?> = []
//            array.append(nil)
//            array.append(nil)
//            array.append(3)
//            
//            print(array)
            
            
//            var set: Set<Float> = []
//            set.insert(0.1)
//            set.insert(0.2)
//            set.insert(0.4)
//            set.insert(0.3)
//            set.insert(0.5)
//            
//            print(set)
//            var res1 = set.contains(3) // 포함 여부
//            
//            var res2 = set.firstIndex(of: 0.1) // 인덱스 반환
//            var res3 = set.firstIndex(of: 0.2) // 인덱스 반환
//            var res4 = set.firstIndex(of: 0.3) // 인덱스 반환
//            
//            print(res1, type(of: res1))
//            print(res2, type(of: res2))
//            print(res3, type(of: res3))
//            print(res4, type(of: res4))
            

        }
    }
}




fileprivate extension Array where Element:Equatable, Element: Hashable {
    func hasValue(index: Int) -> Bool {
        if (self.isEmpty) { return false }
        if (0 <= index && index < self.count){ return true }
        return false
    }
    func hasNext(index: Int) -> Bool {
        if (self.hasValue(index: index)) { return false }
        if ( index < self.count - 2 ){ return true }
        return false
    }
    func hasPrevious(index: Int) -> Bool{
        if (self.hasValue(index: index)) { return false }
        if ( 1 < index ) { return true }
        return false
    }
    
    func next(index: Int) -> Element? {
        if (self.hasNext(index: index)) { return self[ index + 1 ] }
        return nil
    }
    
    func previous(index: Int) -> Element? {
        if (self.hasPrevious(index: index)) { return self[ index - 1 ] }
        return nil
    }
    
    func next(element: Element) -> Element?{
        guard let i = self.firstIndex(of: element) else { return nil }
        return self.next(index: i)
    }
    
    func previous(element: Element) -> Element?{
        guard let i = self.firstIndex(of: element) else { return nil }
        return self.previous(index: i)
    }
}

