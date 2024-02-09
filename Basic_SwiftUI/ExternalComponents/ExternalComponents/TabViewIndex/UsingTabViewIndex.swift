//
//  UsingTabViewIndex.swift
//  ExternalComponents
//
//  Created by Slash on 2023/07/06.
//
import SwiftUI

struct UsingTabViewIndex: View {
    
    @State private var currentIndex = 0
    private let colors: [Color] = [.red, .blue, .green, .yellow]
    @Environment (\.grProxy) var grProxy
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(colors.indices, id: \.self) { index in
                colors[index]
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
        .overlay {
            HStack {
                SquircleIndexView(
                    numberOfPages: Decimal(colors.count),
                    currentIndex: Decimal(currentIndex))
                
                StarIndexView(
                    numberOfPages: Decimal(colors.count),
                    currentIndex: Decimal(currentIndex))
//                    numberOfPages: Double(colors.count),
//                    currentIndex: Double(currentIndex))
            }
        }
    }
}

struct UsingTabViewIndex_Previews: PreviewProvider {
    static var previews: some View {
        UsingTabViewIndex()
    }
}
