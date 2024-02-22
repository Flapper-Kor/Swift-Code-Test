//  GeometryReader_Basic
//  Created by Flapper on 2/11/24.

import SwiftUI
import RealityKit

/*
 Geometry Reader는 가장 가까운 부모뷰의 크기를 알아냄과 동시에 적용된 자식뷰의 크기를 부모뷰의 크기로 확장한다.
 
 parentView{
    GeometryReader{
        childView{
            이럴 경우 별도의 padding이 적용되지 않은 경우 자식뷰의 사이즈를 부모뷰의 사이즈와 같게 만든다.
        }
    }
 }
 */

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) { }
}
struct AnotherSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) { }
}

struct GeometryReader_Basic: View {
    
    @State var outerSize: CGSize?
    @State var innerSize: CGSize?
    @State var textSize: CGSize?
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    HStack{
                        Text("outer")
                        Text(String(format: "Width : %.2f", self.outerSize?.width ?? 0))
                        Text(String(format: "height : %.2f", self.outerSize?.height ?? 0))
                    }
                    HStack{
                        Text("inner")
                        Text(String(format: "Width : %.2f", self.innerSize?.width ?? 0))
                        Text(String(format: "height : %.2f", self.innerSize?.height ?? 0))
                    }
                    HStack{
                        Text("inner")
                        Text(String(format: "Width : %.2f", textSize?.width ?? 0))
                        Text(String(format: "height : %.2f", textSize?.height ?? 0))
                    }
                }
//                .border(.black)
                ZStack{
                    Color.secondary.background()
                    innerView(textSize: $textSize)
//                        .border(.blue)
                        .onReadSize { size in
                            innerSize = size
                        }
                        .border(.red)
                        .padding(50)
                        
                    
                }
                .border(.red)
                .onReadSize { size in
                    outerSize = size
                }
            }
        }
    }
}

struct innerView: View {
    @Binding var textSize: CGSize?
    var body: some View{
        VStack{
            Button("click"){
            }
            Text("sdfasdf")
        }
        .border(.black)
        .anotherOnReadSize { size in
            textSize = size
        }
//        GeometryReader{proxy in
//            VStack{
//                Button("click"){
//                }
//                Text("sdfasdf")
//            }
//            .border(.gray)
//            .onAppear{
//                textSize = proxy.size
//            }
//        }
    }
}


extension View {
    @ViewBuilder
    func onReadSize(_ perform: @escaping (CGSize) -> Void) -> some View {
//        self.customBackground {
            GeometryReader { geometryProxy in
//                Color.clear
                self
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
//        }
        .onPreferenceChange(SizePreferenceKey.self, perform: perform)
    }
    
    @ViewBuilder
    func anotherOnReadSize(_ perform: @escaping (CGSize) -> Void) -> some View {
        self.customBackground {
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: AnotherSizePreferenceKey.self, value: geometryProxy.size)
            }
        }.onPreferenceChange(AnotherSizePreferenceKey.self, perform: perform)
    }
    
    @ViewBuilder
    func customBackground<V: View>(alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View {
        self.background(alignment: alignment, content: content)
    }
}

#Preview {
    ContentView()
}
