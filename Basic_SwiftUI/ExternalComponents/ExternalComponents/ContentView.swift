//
//  ContentView.swift
//  ExternalComponents
//
//  Created by Slash on 2023/07/05.
//

import SwiftUI

struct ContentView: View {
    @Environment (\.grProxy) var grProxy
    
    var body: some View {
        TabView{
            UsingTabViewIndex()
            
//            let _ = print(grProxy)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(Color(red: 100, green: 100, blue: 100))
//        .border(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
