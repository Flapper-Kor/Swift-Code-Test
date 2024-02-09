//
//  multilineTextAlignment_Ex1.swift
//  Text
//
//  Created by Slash on 2023/07/29.
//

/*
 Updated for Xcode 15 beta 1

 When SwiftUI’s Text views wrap across multiple lines, they align to their leading edge by default. If you want to change that, use the multilineTextAlignment() modifier to specify an alternative, such as .center, or .trailing.
 */

import SwiftUI

struct multilineTextAlignment_Ex1: View {

    var text = "This is an extremely long text string that will never fit even the widest of phones without wrapping"
    var textfield : Text {
        Text(text)
    }
    
    var body: some View {
        textfield
//            .font(.largeTitle)
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
            .frame(width: 300)
//        size 설정
//        (custom, system 두 함수 중 하나 선택하여 서체 및 사이즈, weight 등 설정 가능)
            .font(.custom("Academy Engraved LET", size: 18))
//            .font(.system(size: 15, design: .none))
        
/*
 폰트에 관한 공식 문서 링크들
 커스텀 폰트 적용 방법 : https://developer.apple.com/documentation/swiftui/applying-custom-fonts-to-text/#Apply-a-font-supporting-dynamic-sizing
 시스템 폰트 https://developer.apple.com/fonts/system-fonts/?q=font
 */
//

//
/*
 이 외 참고할 만한 문서
 https://jerry-bakery.tistory.com/entry/iOS-폰트-적용하는-법
 */
        
    }
}

struct multilineTextAlignment_Ex1_Previews: PreviewProvider {
    static var previews: some View {
        multilineTextAlignment_Ex1()
    }
}
