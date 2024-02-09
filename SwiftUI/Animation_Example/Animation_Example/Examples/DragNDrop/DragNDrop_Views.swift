//
//  DragNDrop_Views.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/04.
//

import SwiftUI

struct DragNDrop_Views : View{
    let sports = ["figure.badminton", "figure.cricket", "figure.fencing"]
    @State private var viewList : Array<SomeView> = [SomeView]()
    @Environment (\.grProxy) var grProxy
    
    var body: some View{
        VStack {
            HStack {
                ForEach(sports, id: \.self) { sports in
                    SomeView(imgString: sports)
                        .frame(minWidth: 50, minHeight: 50)
                        .background(.red)
                        .foregroundStyle(.white)
                        .draggable(sports)
                        .border(.red)
                }
            }
            .frame(minWidth: 300, minHeight: 70)
            .background(.gray)
            
            Button("추출") {
                self.viewList.removeAll()
            }
            Spacer()    
            
            DragDesView<SomeView>(viewList: self.$viewList)
                .frame(width: grProxy.size.width, height: grProxy.size.height / 3)
                .background(.green)
                .foregroundStyle(.white)
                .dropDestination(for: String.self)  { items, location in
                    self.viewList.append(SomeView(imgString: items.first ?? "image"))
                    return true
                }
//                    let _ = print(items)
//                    if let item = items.first{
//                        self.viewList.append(items.first)
//                        return true
//                    }else{
//                        return false
//                    }
//                }
        }
    }
}

protocol HashableView : View, Hashable {
    
}

struct DragDesView<T:HashableView>: View{
    @State private var dropImage = Image(systemName: "photo")
    @Binding var viewList : Array<T>
    
    var body: some View{
        HStack{
            if viewList.isEmpty{
                let _ = print("here")
                dropImage
            }
            else{
//                ForEach(self.viewList.indices){ index in
//                    viewList[index]
//                }
                let _ = print("viewList is not empty")
                ForEach(self.viewList, id:\.self){ view in
                    view
                }
            }
        }
    }
}



struct ResolvedImage: View{
    var currentImage: String
    
    var body: some View{
        Image(systemName : currentImage)
            .font(.system(size:200))
            .frame(width:300, height: 300)
    }
}

struct SomeView: HashableView{
    
    var imgString : String = "photo"
    
    static func == (lhs: SomeView, rhs: SomeView) -> Bool {
        lhs.imgString == rhs.imgString
    }
    
    func hash(into hasher: inout Hasher){
        hasher.combine(imgString)
    }
    
    var body: some View{
        Canvas{context, size in
            if let resolvedImage = context.resolveSymbol(id: 1){
                context.draw(resolvedImage, at: CGPoint(x: size.width / 2, y: size.height / 2), anchor: .center)
            }
        } symbols: {
            //MARK : Giving Image With ID
            ResolvedImage(currentImage: imgString)
                .tag(1)
        }
        .frame(height:350)
//        Image(systemName: imgString)
//            .scaledToFill()
//            .border(.black)
    }
}
