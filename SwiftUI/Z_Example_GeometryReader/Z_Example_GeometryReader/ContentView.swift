//
//  ContentView.swift
//  Z_Example_GeometryReader
//
//  Created by Flapper on 2/11/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    var body: some View {
        innerView()
            .border(.black)
            .onReadSize {
                print($0)
            }
    }
}

struct innerView: View {
    
    
    var body: some View{
        VStack{
            Button("click"){
            }
            Text("sdfasdf")
            
        }
        .border(.blue)
        .onReadSize {
            print($0)
        }
        
    }
}


extension View {
    @ViewBuilder
    func onReadSize(_ perform: @escaping (CGSize) -> Void) -> some View {
        self.customBackground {
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        }
        .onPreferenceChange(SizePreferenceKey.self, perform: perform)
    }
    
    @ViewBuilder
    func customBackground<V: View>(alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View {
        self.background(alignment: alignment, content: content)
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) { }
}

#Preview {
    ContentView()
}
