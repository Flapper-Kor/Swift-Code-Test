//
//  ContentView.swift
//  TEMP
//
//  Created by Flapper on 2/27/24.
//

import SwiftUI
//
//struct ContentView: View {
//    @State var scrollID: TestStruct?
//    
//    var data: [TestStruct] = [
//    TestStruct(name: "123", price: "34555"),
//    TestStruct(name: "432", price: "543"),
//    TestStruct(name: "423", price: "23"),
//    TestStruct(name: "523", price: "543")
//    ]
//    
//    var body: some View {
//        
//        VStack {
//            ScrollView(.horizontal) {
//                LazyHStack(spacing: 0) {
//                    ForEach (data) { item in
//                        VStack {
//                            Text(item.name)
//                            Text(item.price)
//                        }
//                        .id(item)
//                        .containerRelativeFrame(.horizontal)
//                    }
//                }
//                .scrollTargetLayout()
//            }
//            .scrollPosition(id: $scrollID)
//            .scrollTargetBehavior(.paging)
//            
//            
//            Text("test: \(scrollID?.name ?? "NONE")")
//        }
//        .onAppear{
//            // if initializing is needed
//            if let first = data.first{
//                self.scrollID = first
//            }
//        }
//    }
//}
//
//class TestStruct: Identifiable {
//    
//    let name: String
//    let price: String
//    
//    init(name: String, price: String) {
//        self.name = name
//        self.price = price
//    }
//}
//
//
//
//extension TestStruct: Hashable {
//    static func == (lhs: TestStruct, rhs: TestStruct) -> Bool {
//        lhs.id == rhs.id
//    }
//    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//}






//
//struct ContentView: View {
//    @State var scrollID: TestStruct.ID?
//
//    var data: [TestStruct] = [
//    TestStruct(name: "123", price: "34555"),
//    TestStruct(name: "432", price: "543"),
//    TestStruct(name: "423", price: "23"),
//    TestStruct(name: "523", price: "543")
//    ]
//    
//    var body: some View {
//        
//        VStack {
//            ScrollView(.horizontal) {
//                LazyHStack(spacing: 0) {
//                    ForEach (data) { item in
//                        VStack {
//                            Text(item.name)
//                            Text(item.price)
//                        }
//                        .containerRelativeFrame(.horizontal)
//                    }
//                }
//                .scrollTargetLayout()
//            }
//            .scrollPosition(id: $scrollID)
//            .scrollTargetBehavior(.paging)
//            
//            
//            Text(data.filter{$0.id == scrollID}.first?.name ?? "none")
//        }
//        .onAppear{
//            // if initializing is needed
//            if let first = data.first{
//                self.scrollID = first.id
//            }
//        }
//    }
//}
//
//struct TestStruct: Identifiable {
//    
//    let name: String
//    let price: String
//    let id:UUID = UUID()
//    init(name: String, price: String) {
//        self.name = name
//        self.price = price
//    }
//}
//



//struct ContentView: View {
//    // if using struct : can't using ID
//    @State var scrollID: TestStruct.ID?
//    
//    var data: [TestStruct] = [
//    TestStruct(name: "123", price: "34555"),
//    TestStruct(name: "432", price: "543"),
//    TestStruct(name: "423", price: "23"),
//    TestStruct(name: "523", price: "543")
//    ]
//    
//    var body: some View {
//        
//        VStack {
//            ScrollView(.horizontal) {
//                // LazyHStack  - probably HStack is not working with scrollPosition()
//                // spacing: 0  - probably you need if you want exact positioning (default spacing : 8)
//                LazyHStack(spacing: 0) {
//                    ForEach (data) { item in
//                        VStack {
//                            Text(item.name)
//                            Text(item.price)
//                        }
//                        .containerRelativeFrame(.horizontal)
//                        .border(.black)
//                    }
//                }
//                .scrollTargetLayout()
//            }
//            .scrollPosition(id: $scrollID)
//            .scrollTargetBehavior(.paging)
//            
//            
//            Text(data.filter{$0.id == scrollID}.first?.name ?? "none")
//        }
//        .onAppear{
//            // if initializing is needed
//            if let first = data.first{
//                self.scrollID = first.id
//            }
//        }
//    }
//}
//
struct TestStruct: Identifiable, Hashable {
    
    let name: String
    let price: String
    let id: UUID = UUID()
    
    init(name: String, price: String) {
        self.name = name
        self.price = price
    }
    
    static func == (lhs: TestStruct, rhs: TestStruct) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.price == rhs.price
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(price)
        hasher.combine(name)
    }
}


struct ContentView: View {
    @State var currentID: UUID?
    @State var currentIndex: Int?
    @State var currentStruct: TestStruct?
    
    var data: [TestStruct] = [
    TestStruct(name: "123", price: "34555"),
    TestStruct(name: "432", price: "543"),
    TestStruct(name: "423", price: "23"),
    TestStruct(name: "523", price: "543")
    ]
    
    var body: some View {
        
        VStack {
            ScrollView(.horizontal) {
                // LazyHStack  - probably HStack is not working with scrollPosition()
                // spacing: 0  - probably you need if you want exact positioning (default spacing : 8)
                HStack(spacing: 0) {
                    ForEach(data, id: \.self) { item in           // need here if use the hashable struct/class for identifier
                        VStack {
                            Text(item.name)
                            Text(item.price)
                        }
                        .containerRelativeFrame(.horizontal)
                        .background()
                        .border(Color.black)
                        .onTapGesture {
                            print(item.id)
                        }
                    }
                }
                .scrollTargetLayout()
            }
//            .scrollPosition(id: $currentIndex)                              // for index
//            .scrollPosition(id: $currentID)                                 // for id
            .scrollPosition(id: $currentStruct)                             // for struct
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
            
            
//            Text(data.filter{$0.id == currentID}.first?.name ?? "none")     // for index
//            Text(data.filter{$0.id == currentID}.first?.name ?? "none")     // for id
            Text(currentStruct?.name ?? "none")                             // for struct
        }
        .background()
        .onAppear{
            // if initializing is needed
            if let first = data.first{
                self.currentID = first.id
            }
        }
//        .onChange(of: self.currentIndex) { oldValue, newValue in            // for index
//            self.currentID = data[newValue!].id
//            print(newValue, self.currentIndex, oldValue)
//        }
//        .onChange(of: self.currentID) { oldValue, newValue in               // for id
//            print(newValue, self.currentID, oldValue)
//        }
        .onChange(of: self.currentStruct) { oldValue, newValue in           // for struct
            print(newValue, self.currentStruct, oldValue)
        }
    }
}

