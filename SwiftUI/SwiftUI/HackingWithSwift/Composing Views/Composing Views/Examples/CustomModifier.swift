//
//  CustomModifier.swift
//  Composing Views
//
//  Created by Slash on 2023/07/09.
//

/*
 Updated for Xcode 15 beta 1

 If you find yourself constantly attaching the same set of modifiers to a view – e.g., giving it a background color, some padding, a specific font, and so on – then you can avoid duplication by creating a custom view modifier that encapsulates all those changes. So, rather than say “make it red, make it use a large font” and so on, you can just say “make it look like a warning,” and apply a pre-made set of modifiers.

 If you want to make your own, define a struct that conforms to the ViewModifier protocol. This protocol requires that you accept a body(content:) method that transforms some sort of content however you want, returning the result.

 For example, this creates a new PrimaryLabel modifier that adds padding, a red background, white text, and a large font, then uses it in a view:
 */

import SwiftUI

struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.red)
            .foregroundStyle(.white)
            .font(.largeTitle)
    }
}

struct customModifiers {
    
    //MARK: - modifiers
    struct myListModifider: ViewModifier {
        func body(content: Content) -> some View {
            content
            .padding(30)
            .background(Color(Color.RGBColorSpace.sRGBLinear, red: 0.5, green: 0.5, blue: 0.5, opacity: 0.2))
            // 참고 : 색 값의 범위는 swift에서  대부분 0~1 값을 가진다.
            .foregroundStyle(.black)
            .font(.custom("Georgia", size: 14))
//            .frame(width: 300 ,alignment: .center)
            .border(.red)
//            .multilineTextAlignment(.center)
        }
    }
    
    struct myTextModifiers: ViewModifier {
        func body(content: Content) -> some View {
            content
                .border(.black)
        }
    }
}

private struct CenterHorizontallyModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack(spacing: 0) {
            Spacer()
            content
            Spacer()
        }
    }
}

extension View {
    func myListmodifier() -> some View {
        modifier(customModifiers.myListModifider())
    }
    func centerHorizontally() -> some View {
        modifier(CenterHorizontallyModifier())
    }
}

private class ListCellModifier{
    
    struct ListCellBackground: ViewModifier{
        @State private var tapped : Bool = false
        
        var colorOn : Color = Color.clear
        var colorOff : Color = Color.clear
        var colorBack : Color = Color.clear
        var colorfore : Color = Color.clear
        var opacity : Double = 1.0
        
        
        func body(content: Content)-> some View {
            content
                .listRowSeparator(.hidden)                       // 리스트 구분선 삭제
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 5)
                    .background(colorBack)
                    .foregroundColor(tapped ? colorOn : colorOff)
                    .opacity(opacity))
                .contentShape(Rectangle())                      // 터치 인식 부분이 spacer 및 공백 포함
                .onTapGesture {
                    print("클릭 \($0)", type(of: $0))
                    tapped.toggle()
                }
                .border(.black)
        }
    }

    struct ListCellModifierCenter: ViewModifier{
        
        func body(content:Content)-> some View{
            GeometryReader{ geomerty in
                VStack(alignment: .center) {
                    Spacer()
                    content
                    Spacer()
                }.frame(width: geomerty.size.width, alignment: .center)
//                let _ = print(geomerty.size)
            }
        }
    }
}

struct CustomModifier: View {
    
    @State private var list = [1,2,3,4,5,6,7,8,9,10]
    
    var body: some View {
        VStack{
            Text("Hello, SwiftUI")
                .modifier(PrimaryLabel())
                .frame(alignment: .center)
            
            List{
                ForEach(list, id:\.self) { i in
                    HStack(alignment: .lastTextBaseline){
                        Text("\(i)")
                        Image(systemName: "house")
                    }
                    .modifier(ListCellModifier.ListCellModifierCenter())
                            .centerHorizontally()
                    .modifier(ListCellModifier.ListCellBackground(colorOn: .black, colorOff: .green))
                }
                .onDelete { indexSet in
                    self.removeList(at: indexSet)
//                    print(list)
                }
                .onMove(perform: self.moveList)
            }
            .modifier(customModifiers.myListModifider())
            .border(.red)
            
        }
    }
    
    func removeList(at offsets: IndexSet) {
        list.remove(atOffsets: offsets)
    }
    
    func moveList(from source: IndexSet, to destination: Int) {
        list.move(fromOffsets: source, toOffset: destination)
    }
}

struct CustomModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifier()
    }
}
