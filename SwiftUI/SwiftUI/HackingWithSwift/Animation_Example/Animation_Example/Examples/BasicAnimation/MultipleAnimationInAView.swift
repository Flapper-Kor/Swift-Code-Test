//
//  MultipleAnimationInAView.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/08.
//
/*
 Updated for Xcode 15 beta 1

 Improved in iOS 17

 The order in which we use SwiftUI’s animation() modifier affects which modifiers get animated, and it’s also possible to add multiple animation() modifiers in order to get different animations.

 There are two ways of doing this: A newer, clearer approach that’s available from iOS 17 and later, and an older alternative that also works in iOS 16 and earlier.

 First, the new approach. In this code we animate the background color over one second, and the clip shape over two seconds:
 
 */
import SwiftUI

struct MultipleAnimationInAView: View {
    @State private var isEnabled = false
    
    @State private var bgcolor = Color.black
    @State private var cornerRadius: Double = 0
    @State private var width: CGFloat = 200
    @State private var height: CGFloat = 200
    private var size: (CGFloat, CGFloat) {
        (self.width, self.height)
    }
    
    var body: some View {

        VStack{
            
    // Using iOS in 17
    //        Button("Press Me") {
    //            isEnabled.toggle()
    //        }
    //        .foregroundStyle(.black)
    //        .frame(width: 200, height: 200)
    //        .animation(.easeInOut(duration: 1)) { content in
    //            content
    //                .background(isEnabled ? .green : .red)
    //        }
    //        .animation(.easeInOut(duration: 2)) { content in
    //            content
    //                .clipShape(.rect(cornerRadius: isEnabled ? 100 : 0))
    //        }
            
            // 이전 버전들의 solution
            // 1. 각각의 변경될 속성 수정자 뒤에 애니메이션을 붙여서 정의 해주었다. (1번은 수정자에 그루핑이 되어있지 않아서 코드 수정하다가 순서가 뒤바뀌거나 누락되거나 할 확률이 존재)
            // 2. 혹은 withAnimation으로 애니메이션 적용될 범위를 지정 사용 (2번은 애니메이션과 수정자들의 관계가 명확하게 한눈에 파악하기 힘들다는 단점)
            Button("Press Me") {
                isEnabled.toggle()
            }
            .foregroundStyle(.white)
            .frame(width: 200, height: 200)
            .background(isEnabled ? .green : .red)
            .animation(.easeInOut(duration: 1), value: isEnabled)
            .clipShape(RoundedRectangle(cornerRadius: isEnabled ? 100 : 0))
            .animation(.default, value: isEnabled)
            
            Button("Press Me") {
                isEnabled.toggle()
                
                withAnimation (.easeInOut(duration: 1)){
                    self.bgcolor = isEnabled ? .green : .red

                }
                withAnimation {
                    self.cornerRadius = isEnabled ? 100 : 0
                    self.width = isEnabled ? 300 : 200
                }
            }
            .foregroundStyle(.white)
            .frame(width: self.width, height: self.height)
            .background(self.bgcolor)
            .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
        }

        
        

    }
}

struct MultipleAnimationInAView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleAnimationInAView()
    }
}
