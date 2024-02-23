//
//  BackgroundImage.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI
import UIKit

struct BackgroundImage: View {
    @State var attributedString = NSMutableAttributedString(string: "")
    @State var text = "Hacking with Swift"
    
    var body: some View {
        VStack{
            Text("Hacking with Swift")
                .font(.system(size: 48))
                .foregroundColor(.white)
//                .shadow(color: .purple, radius: 1)
//                .shadow(color: .purple, radius: 1)
//                .shadow(color: .purple, radius: 1)
//                .shadow(color: .purple, radius: 1)
//                .shadow(color: .purple, radius: 1)
                .stroke(color: .black, lineWidth: 4)  // .shadow 반복적용 하는 modifier를 만들어서 사용
//                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
                .padding(50)
                .background(
                    Image("singapore")
                        .resizable()
                )
            
            Text("Hacking with Swift")
                .font(.largeTitle)
                .padding()
                .background(Circle()
                    .fill(.red)
                    .frame(width: 50, height: 50))
            
            Text("Hacking with Swift")
                .font(.largeTitle)
                .padding()
                .background(
                    Circle()
                        .fill(.red)
                        .frame(width: 100, height: 100)
                )
                .clipped()
                
            ZStack{
                Image("singapore")
                .resizable()
                .scaledToFit()
                
                Text("Hacking with Swift")
                    .font(.system(size: 48))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 0.5)
                    .shadow(color: .black, radius: 0.5)
                    .shadow(color: .black, radius: 0.5)
                    .shadow(color: .black, radius: 0.5)
                    .shadow(color: .black, radius: 0.5)
                    .shadow(color: .black, radius: 0.5)
                    .shadow(color: .black, radius: 0.5)
                    .shadow(color: .black, radius: 0.5)
                    .shadow(color: .black, radius: 0.5)
            }


//            .frame(minWidth: grProxy.size.width, minHeight: 200)
        }
    }
}

struct BackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImage()
    }
}
