//
//  ContentView.swift
//  ModalExample
//
//  Created by 이희웅 on 2023/06/02.
//

import SwiftUI

//struct ContentView: View {
//
//    @State var presentingModal = false
//
//    var body: some View {
//        Button("Present") { self.presentingModal = true }
//        .sheet(isPresented: $presentingModal) { ModalView(presentedAsModal: self.$presentingModal) }
//    }
//}
//
//struct ModalView: View {
//    @Binding var presentedAsModal: Bool
//    var body: some View {
//        VStack {
//            Button("dismiss") { self.presentedAsModal = false }
//        }
//    }
//}
//import SwiftUI

struct ContentView: View {
    
    @State var isShownSheet = false
    @State var isShownFullScreenCover = false
    
    @State var isHover = false
    
    var body: some View {


        VStack {
            
            Button {
                self.isShownSheet.toggle()
            } label: {
                Text("Show sheet")
            }
            .sheet(isPresented: $isShownSheet) {
                Text("sheet view")
                    .onTapGesture {
                        self.isShownSheet.toggle()
                    }.presentationDetents([.fraction(0.7)])
            }
            .padding()
            
            Button {
                self.isShownFullScreenCover.toggle()
            } label: {
                Text("Show Full Screen Cover")
                    .onTapGesture {
                        self.isShownFullScreenCover.toggle()
                    }
            }
            .fullScreenCover(isPresented: $isShownFullScreenCover) {
                Text("Full Screen Cover")
                    .onTapGesture {
                        self.isShownFullScreenCover.toggle()
                    }
            }
        }
    }
}
