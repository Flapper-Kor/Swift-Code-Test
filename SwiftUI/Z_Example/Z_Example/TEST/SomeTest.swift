//
//  SomeTest.swift
//  Z_Example
//
//  Created by Flapper on 2/23/24.
//

import SwiftUI

struct SomeTest: View {

    @State private var isPresented = false
    
    var body: some View {
        VStack{
            HStack(spacing: 10) {
                Text("나랏말싸미 듕귁에 달아 문자와로 서르 사맛디 아니할쎄")
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(Color.blue)
                
                Text("이런 전차로 어린 백셩이 니르고져 홇베이셔도")
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(Color.green)
                
                Text("마참네 제 뜨들 시러펴디 몯핧 노미하니아 내 이랄 윙하야 어엿비너겨 새로 스믈 여듫 짜랄 맹가노니")
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(Color(CGColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 0.7)))
            }
            .border(.red)
            // 이부분은 따로 빼서 알아볼 것
            .fixedSize(horizontal: false, vertical: true)
//            .border(.red)
            .frame(maxHeight: 200)
            .border(.black)
            .kerning(2.0)
            .background(Color(CGColor(red: 0.2, green: 0.3, blue: 0.1, alpha: 0.5)))
            
//            Text("A single line of text, too long to fit in a box.")
            
            Text("A single line of text")
                .frame(width: 200, height: 200)
                .border(Color.gray)
       
            Text("A single line of text, too long to fit in a box.")
                .border(Color.gray)
                .fixedSize(horizontal: true, vertical: false)
//                .fixedSize()  //이건 위의 상황에서 둘다 false
                .frame(width: 200, height: 200)
                .border(Color.gray)
            
            
//            Text("A single line of text, too long to fit in a box.A single line of text, too long to fit in a box.A single line of text, too long to fit in a box.A single line of text, too long to fit in a box.A single line of text, too long to fit in a box.A single line of text, too long to fit in a box.A single line of text, too long to fit in a box.A single line of text, too long to fit in a box.A single line of text, too long to fit in a box.A single line of text, too long to fit in a box.A single line of text, too long to fit in a box.A single line of text, too long to fit in a box.")
//                .fixedSize(horizontal: false, vertical: false) // 둘다 false 로 한경우 없는것과 마찬가지.
//                .frame(width: 200, height: 200)
//                .border(Color.gray)
        }
    }
}

#Preview {
    SomeTest()
}
