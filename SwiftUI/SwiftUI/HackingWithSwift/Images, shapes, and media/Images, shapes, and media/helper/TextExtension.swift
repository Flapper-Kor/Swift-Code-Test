//
//  TextExtension.swift
//  Images, shapes, and media
//
//  Created by Flapper on 2/9/24.
//
import SwiftUI

// MARK: - SwiftUI 에서 text outline 적용하기 위한 modifier 및 extension
// MARK:   using View.stroke()
extension Text {
    
    /**
     stroke and return the Text
     This function is simply calling the shadow function as many times as the linewidth.
     
     > Usage:
     >```
     > var body : some View {
     >    Text("hello").stroke(color: .black, lineWidth: 5)
     > }
     >```
     
     > Tip:
     > this method return some View, not Text
     > It should be called last.
     > Use like below
     >```
     >  Text("Hello")
     >      .font(.system(size: 48))
     >      .foregroundColor(.white)
     >      .stroke(color: .black, lineWidth: 4)
     >```
     
     > Warning:
     > Don't Use like below
     >```
     > Text("Hello")
     >      .stroke(color: .black, lineWidth: 4)
     >      .font(.system(size: 48))
     >      .foregroundColor(.white)
     >```
     - Author: Flapper
     - Parameters:
        - color: Color for stroke
        - lineWidth: Stroke/shadow width ( greater than 0 ).
                     0 or a negative number returns itself as some View.
                     this function just calling the shadow() function as many times as the linewidth.
     
     - returns: some View with stroke effect applied
     */
    func stroke(color: Color, lineWidth: Int) -> some View {
        self.modifier(Stroked(color: color, lineWidth: lineWidth))
    }
    
    struct Stroked : ViewModifier{
        var color: Color
        var lineWidth: Int
        
        func body(content: Content) -> some View {
            applyShadow(content: AnyView(content), lineWidth: lineWidth)
        }
        
        func applyShadow(content:AnyView, lineWidth: Int)-> AnyView{
            if lineWidth <= 0{
                return content
            }else{
                return applyShadow(content: AnyView(content.shadow(color: color, radius: 1)), lineWidth: lineWidth - 1)
            }
        }
    }
}
