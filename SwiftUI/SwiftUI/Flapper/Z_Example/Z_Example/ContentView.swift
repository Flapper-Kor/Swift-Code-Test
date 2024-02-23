//
//  ContentView.swift
//  Z_Example
//
//  Created by Flapper on 2/22/24.
//

import SwiftUI
import FlapperLayout

struct ContentView: View {
    @State var currentID: ViewItem.ID?
    var list : [ViewItem] = []
    
    init(){
        self.list.append(ViewItem(subject: "SomeTest", view: SomeTest()))
        
        self.list.append(ViewItem(subject: "Geometry Reader (화면 방향 전환하여 사이즈 확인)", view: GeometryReader_Basic()))
        self.list.append(ViewItem(subject: "FocusState Basic", view: FocusState_Basic()))
        self.list.append(ViewItem(subject: "ScrollView Basic", view: ScrollView_Basic()))
        self.list.append(ViewItem(subject: "Codable Basic", view: Codable_Basic()))
        self.list.append(ViewItem(subject: "TabView Basic", view: TabView_Basic()))
        self.list.append(ViewItem(subject: "IndexStyle CustomIndexStyle", view: IndexStyle_CustomIndexStyle()))
        self.list.append(ViewItem(subject: "Clipping Basic", view: Clipping_Basic()))
        
//        self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
//        self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
//        self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
//        self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
        
        /*
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
                self.list.append(ViewItem(subject: "<#subject#>", view: <#view#>()))
         */
        
    }
    
    var body: some View{
        if #available(iOS 17, *){
            VStack(spacing: 0){
                if (!(list.isEmpty)){
                    if let currentItem = list.filter({$0.id == currentID}).first{
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
                    items: list, currentID: $currentID
                ) { item in
                    AnyView(item.view)
                }
            }
            .onAppear{
                // case using Carousel_ID
                self.currentID = list.first?.id
            }
        }
        else{
            VStack(spacing: 0){
                if (!(list.isEmpty)){
                    if let currentItem = list.filter({$0.id == currentID}).first{
                        //                if let currentItem = viewList.list.indices.contains(currentindex) ? viewList.list[currentindex] : nil{
                        Text(currentItem.subject)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.purple)
                        .font(.footnote)                    }
                }
                else{
                    Text("Loading . . .")
                }
                
                Carousel_ID_lowerVersion(
                    items: list,
                    currentID: $currentID
                ) { item in
                    AnyView(item.view)
                }
            }
            .onAppear{
                
            }
        }
    }
}

#Preview {
    ContentView()
}
