//
//  ContentView.swift
//  Drawing
//
//  Created by Slash on 2023/07/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            myShape()
//            AnimationWithTimelineView()
            Blurring()
            RenderingToPDF()
            ConvertViewToImage()
            BezierCurve()
            DrawSomeShape2()
            DrawSomeShape1()
            CostomPath()
            BuiltinShapes()
            
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
        .border(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
