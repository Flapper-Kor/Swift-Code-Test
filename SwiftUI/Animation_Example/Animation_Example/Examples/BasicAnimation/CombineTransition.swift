//
//  CombineTransition.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/09.
//
/*
 Updated for Xcode 15 beta 1

 When adding or removing a view, SwiftUI lets you combine transitions to make new animation styles using the combined(with:) method.

 For example, you can make a view move (one transition) and fade (a second transition) at the same time like this:
 
 */
import SwiftUI


extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .leading).combined(with: .scale).combined(with: .identity)
        
    }
}


struct CombineTransition: View {
    @State private var showDetails = false

    var body: some View {
        VStack{
            // MARK: - using combined
            VStack {
                Button("combined opacity, slide") {
                    withAnimation {
                        showDetails.toggle()
                    }
                }
                
                if showDetails {
                    Text("Details go here.")
                    
                        .transition(AnyTransition.opacity.combined(with: .slide))
                }
            }
            
            // MARK: - combined extention in AnyTransition for reuse
            VStack {
                Button("combined move&scale") {
                    withAnimation {
                        showDetails.toggle()
                    }
                }
                
                if showDetails {
                    Text("Details go here.")
                        .transition(.moveAndScale)
                }
            }
            // MARK: - combined extention in AnyTransition for reuse
            VStack {
                Button("identity") {
                    withAnimation {
                        showDetails.toggle()
                    }
                }
                
                if showDetails {
                    Text("Details go here.")
                        .transition(.offset(CGSize(width: 15, height: 15)))
                }
            }
        }
    }
}

struct CombineTransition_Previews: PreviewProvider {
    static var previews: some View {
        CombineTransition()
    }
}
