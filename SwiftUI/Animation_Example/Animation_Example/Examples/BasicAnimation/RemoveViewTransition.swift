//
//  RemoveViewTransition.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/09.
//


/*
 Updated for Xcode 15 beta 1

 You can include or exclude a view in your design just by using a regular Swift condition. For example, this adds or removes some details text when a button is tapped:
 */
import SwiftUI

struct RemoveViewTransition: View {
    @State private var showDetails = false

    var body: some View {
        TabView{
            DefaultRemoveView()
                .tabItem{
                    Image(systemName: "home")
                    Text("기본스타일")
                }
                
            TransitionView()
                .tabItem {
                    Image(systemName: "home")
                    Text("transition")
                }
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = .black                  // 탭뷰 백그라운드 컬러
            UITabBar.appearance().unselectedItemTintColor = UIColor.brown   // 선택되지 않은 탭뷰 아이템의 컬러
        }
        .border(.green)
    }
}


struct DefaultRemoveView: View{
    
    @State private var showDetails = false

    var body: some View {
        HStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }

            if showDetails {
                Text("Details go here.")
            }
        }
    }
}

struct TransitionView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }

            if showDetails {
                // Moves in from the bottom
                Text("Details go here.")
                    .transition(.move(edge: .top))

                // Moves in from leading out, out to trailing edge.
                Text("Details go here.")
                    .transition(.slide)

                // Starts small and grows to full size.
                Text("Details go here.")
                    .transition(.scale)
            }
        }
    }
}

struct RemoveViewTransition_Previews: PreviewProvider {
    static var previews: some View {
        RemoveViewTransition()
    }
}
