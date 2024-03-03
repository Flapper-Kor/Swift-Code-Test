//
//  ContentView.swift
//  Drawing
//
//  Created by Slash on 2023/07/05.
//

import SwiftUI
import FlapperLayout

@MainActor
var viewList : [ViewItem] = [
    ViewItem(subject: "myShape", view: myShape()),
    ViewItem(subject: "Animation With Timeline View", view: AnimationWithTimelineView()),
    ViewItem(subject: "Blurring", view: Blurring()),
    ViewItem(subject: "Rendering To PDF", view: RenderingToPDF()),
    ViewItem(subject: "Convert View To Image", view: ConvertViewToImage()),
    ViewItem(subject: "Bezier Curve", view: BezierCurve()),
    ViewItem(subject: "Draw Some Shape2", view: DrawSomeShape2()),
    ViewItem(subject: "Draw Some Shape1", view: DrawSomeShape1()),
    ViewItem(subject: "CostomPath", view: CostomPath()),
    ViewItem(subject: "BuiltinShapes", view: BuiltinShapes())
]

struct ContentView: View {
    @State var currentID: ViewItem.ID?

    var body: some View{
        if #available(iOS 17, *){
            VStack(spacing: 0){
                if (!(viewList.isEmpty)){
                    if let currentItem = viewList.filter({$0.id == currentID}).first{
                        Text(currentItem.subject)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.purple)
                            .font(.footnote)
                    }
                }
                else{
                    Text("Loading . . .")
                }
                
                Carousel_ID(
                    items: viewList,
                    currentID: $currentID,
                    stackStyle: .lazy
                ) { item in
                    AnyView(item.view)
                }
            }
            .onAppear{
                // case using Carousel_ID
                self.currentID = viewList.first?.id
            }
        }
        else{
            VStack(spacing: 0){
                if (!(viewList.isEmpty)){
                    if let currentItem = viewList.filter({$0.id == currentID}).first{
                        //                if let currentItem = viewList.list.indices.contains(currentindex) ? viewList.list[currentindex] : nil{
                        Text(currentItem.subject)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.purple)
                            .font(.footnote)
                    }
                }
                else{
                    Text("Loading . . .")
                }
                
                Carousel_ID_lowerVersion(
                    items: viewList,
                    currentID: $currentID
                ) { item in
                    AnyView(item.view)
                }
            }
        }
    }
//    
//    var body: some View {
//        TabView{
//            myShape()
//            AnimationWithTimelineView()
//            Blurring()
//            RenderingToPDF()
//            ConvertViewToImage()
//            BezierCurve()
//            DrawSomeShape2()
//            DrawSomeShape1()
//            CostomPath()
//            BuiltinShapes()
//            
//            
//        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
//        .border(.yellow)
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
