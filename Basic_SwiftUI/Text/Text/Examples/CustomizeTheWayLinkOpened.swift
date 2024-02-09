//
//  CustomizeTheWayLinkOpened.swift
//  Text
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI

struct CustomizeTheWayLinkOpened: View {
    @State var linkText = ""
    
    var body: some View {
        VStack {
            Text(linkText)
            Spacer()
            
            VStack{
                Link("Visit Apple", destination: URL(string: "https://apple.com")!)
                
                Text("[Visit Apple](https://apple.com)")
                    .environment(\.openURL, OpenURLAction(handler: handleURL))
                
                Text("[Visit Apple](https://apple.com)")
                    .environment(\.openURL, OpenURLAction(handler: handleURLWithSystemAction))
                
                Text("[Visit Apple](https://apple.com)")
                    .environment(\.openURL, OpenURLAction(handler: handleURLWithSystemAction_AnotherUrl))
            }
            Spacer()
        }
    }

    /*
         Use .discarded if you mean you weren’t able to handle the link.
         Use .systemAction if you want to trigger the default behavior, perhaps in addition to your own logic.
         Use .systemAction(someOtherURL) if you want to open a different URL using the default behavior, perhaps a modified version of the URL that was originally triggered.
     */
    func handleURL(_ url: URL) -> OpenURLAction.Result {
        print("Handle \(url) somehow")
        print("")
        return .handled
    }
    
    func handleURLWithSystemAction(_ url: URL) -> OpenURLAction.Result {
        print("Handle \(url) somehow")
        
        print(url, type(of: url))
        linkText = url.absoluteString
        return .systemAction
    }
    
    func handleURLWithSystemAction_AnotherUrl(_ url: URL) -> OpenURLAction.Result {
        
        print(url, type(of: url))
        
        guard let url_inner = URL(string: url.absoluteString + "/macbook-pro") else { return .systemAction }
        
        linkText = url_inner.absoluteString
        
        return .systemAction(url_inner)
    }
}

struct CustomizeTheWayLinkOpened_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeTheWayLinkOpened()
    }
}
