//
//  ContentView.swift
//  Text
//
//  Created by Slash on 2023/07/28.
//

import SwiftUI
import FlapperLayout


struct ContentView: View {
    @State var currentID: ViewItem.ID?
    var list : [ViewItem] = []
    
    init(){
        self.list.append(ViewItem(subject: "Text Selection", view: TextSelection()))
        self.list.append(ViewItem(subject: "Customize The Way Link Opened", view: CustomizeTheWayLinkOpened()))
        self.list.append(ViewItem(subject: "Markdown Contents", view: MarkdownContents()))
        self.list.append(ViewItem(subject: "Private Contents", view: PrivateContents()))
        self.list.append(ViewItem(subject: "placeholder", view: placeholder()))
        self.list.append(ViewItem(subject: "Using Image In Text", view: UsingImageInText()))
        self.list.append(ViewItem(subject: "Text Case", view: TextCase()))
        self.list.append(ViewItem(subject: "Date In Text", view: DateInText()))
        self.list.append(ViewItem(subject: "Spacing", view: Spacing()))
        self.list.append(ViewItem(subject: "Fommat Text", view: FommatText()))
        self.list.append(ViewItem(subject: "compare Alignment", view: compareAlignment()))
        self.list.append(ViewItem(subject: "multiline Text Alignment", view: multilineTextAlignment_Ex1()))
        self.list.append(ViewItem(subject: "UsingAttributedString9", view: UsingAttributedString9()))
        self.list.append(ViewItem(subject: "UsingAttributedString8", view: UsingAttributedString8()))
        self.list.append(ViewItem(subject: "UsingAttributedString7", view: UsingAttributedString7()))
        self.list.append(ViewItem(subject: "UsingAttributedString6", view: UsingAttributedString6()))
        self.list.append(ViewItem(subject: "UsingAttributedString5", view: UsingAttributedString5()))
        self.list.append(ViewItem(subject: "UsingAttributedString4", view: UsingAttributedString4()))
        self.list.append(ViewItem(subject: "UsingAttributedString3", view: UsingAttributedString3()))
        self.list.append(ViewItem(subject: "UsingAttributedString2", view: UsingAttributedString2()))
        self.list.append(ViewItem(subject: "UsingAttributedString1", view: UsingAttributedString1()))
        
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
