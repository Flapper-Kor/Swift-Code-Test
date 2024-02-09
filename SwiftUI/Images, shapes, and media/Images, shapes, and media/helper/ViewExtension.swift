//
//  ViewExtension.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/01.
//

import SwiftUI

// MARK: - SwiftUI 에서 text outline 적용하기 위한 modifier 및 extension
// MARK:   using View.stroke()


extension View {
    /**
     stroke and return the View
     
     This function is simply calling the shadow function as many times as the linewidth.
     You can apply at Text, Shapes, any Views...
     
     Do not use at iOS 17 or later...
         
     iOS 17 include This built-in function
     
     > Usage :
     ```
     var body : some View {
        Text("hello").stroke(color: .black, lineWidth: 5)
     }
     ```
     
     - Parameters:
        - color: Color for stroke/shadow
        - lineWidth: Stroke/shadow width ( greater than 0 ).
                     0 or a negative number returns itself as some View.
                     this function just calling the shadow() function as many times as the linewidth.
     
     - returns: some View with stroke effect applied
     */
    @available(iOS, obsoleted:17.0, message: "iOS 17 include This built-in function")
    func stroke(color: Color, lineWidth: Int) -> some View {
        self.modifier(Stroked(color: color, lineWidth: lineWidth))
    }
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



// MARK: -
// MARK: =
extension View{
    
    @available(iOS, obsoleted:17.0, message: "iOS 17 include This built-in function")
    func onChange<V>(
        of value: V,
        initial: Bool = false,
        _ action: @escaping () -> Void
    ) -> some View where V : Equatable{
        
        if initial{
            action()
            return self.onChange(of: value) { newValue in
                action()
            }
            
        } else {
            return self.onChange(of: value) { newValue in
                action()
            }
        }
    }
    
    @available(iOS, obsoleted:17.0, message: "iOS 17 include This built-in function")
    func onChange<V>(
        of value: V,
        initial: Bool = false,
        _ action: @escaping (V) -> Void
    ) -> some View where V : Equatable{
        
        if initial{
            action(value)
            return self.onChange(of: value) { newValue in
                action(newValue)
            }
            
        } else {
            return self.onChange(of: value) { newValue in
                action(newValue)
            }
        }
    }
}
