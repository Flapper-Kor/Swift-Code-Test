//
//  UsingGradient.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/07/31.
//

import SwiftUI

struct UsingGradient: View {
    
    @State var fontList: Array<String> = Array()
    @State var font : String = "AmericanTypewriter"
    
    var body: some View {
        ScrollView{
            Picker("choose the font", selection: $font) {
                ForEach(fontList, id: \.self) { font in
                    Text(font)
                }
            }
            
            ZStack{
                Rectangle().fill(.blue.gradient)
                    .frame(height: 200)
                Text("gradient 테스트").foregroundColor(.white).bold().font(.custom(font, size: 30))
            }

            
            Text("Hello World")
                .padding()
                .foregroundStyle(.white)
                .font(.largeTitle)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                )
            
            Text("Hello World")
                .padding()
                .foregroundStyle(.white)
                .font(.largeTitle)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom)
                )
            
            Text("Hello World")
                .padding()
                .foregroundStyle(.white)
                .font(.largeTitle)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .leading, endPoint: .trailing)
                )
            
            Circle()
                .fill(
                    RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 20, endRadius: 100)
                )
                .frame(width: 200, height: 200)
            
            Circle()
                .fill(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                )
                .frame(width: 200, height: 200)
            
            Circle()
                .strokeBorder(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
                    lineWidth: 50 // 0~100
                )
                .frame(width: 200, height: 200)
        }
        .task{
            for family in UIFont.familyNames {
              for sub in UIFont.fontNames(forFamilyName: family) {
                  self.fontList.append(sub)
              }
            }
            self.font = self.fontList.first!
        }
    }
}

struct UsingGradient_Previews: PreviewProvider {
    static var previews: some View {
        UsingGradient()
    }
}
