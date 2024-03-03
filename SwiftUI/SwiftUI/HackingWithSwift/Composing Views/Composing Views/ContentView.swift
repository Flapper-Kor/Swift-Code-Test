//
//  ContentView.swift
//  Composing Views
//
//  Created by Slash on 2023/07/09.
//

import SwiftUI
import FlapperLayout

@MainActor
var viewList : [ViewItem] = [
    ViewItem(subject: "Insert Image Into Text", view: InsertImageIntoText()),
    ViewItem(subject: "Modifier For UIView Representable", view: ModifierForUIViewRepresentable()),
    ViewItem(subject: "Wrapping UIView", view: WrappingUIView()),
    ViewItem(subject: "Custom Modifier", view: CustomModifier()),
    ViewItem(subject: "StoreView As Property", view: StoreViewAsProperty()),
    ViewItem(subject: "Combine Text Views", view: CombineTextViews()),
    ViewItem(subject: "Create", view: Create())
//    ViewItem(subject: "<#Name#>", view: <#view#>()),
//    ViewItem(subject: "<#Name#>", view: <#view#>()),
//    ViewItem(subject: "<#Name#>", view: <#view#>()),
//    ViewItem(subject: "<#Name#>", view: <#view#>()),
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
