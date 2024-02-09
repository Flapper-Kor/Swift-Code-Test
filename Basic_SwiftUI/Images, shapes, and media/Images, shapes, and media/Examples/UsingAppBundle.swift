//
//  UsingAppBundle.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/01.
//

import SwiftUI

/*
 참고 :
    번들이랑 웹킷은 UIKit부터 사용하던 녀석들이고, swiftUI는 스위프트 패키지 번들로부터 이미지를 로딩하는 것을 지원하지 않는다.
    따라서 UIImage 및 NSImage캑체를 사용하여 생성해야 하고,
    또 이를 쉽게 활용하기 위해 Image struct 를 확장하여 사용할 수 있다.
    참고 : 
    https://www.enekoalonso.com/articles/displaying-images-in-swiftui-views-from-swift-package-resources
 */

struct UsingAppBundle: View {
    var body: some View {
        Image(packageResource: "Slash 프로필(배경제거)", ofType: "png").resizable().scaledToFit().frame(width: 300) // Works well ✅
    }
}

struct UsingAppBundle_Previews: PreviewProvider {
    static var previews: some View {
        UsingAppBundle()
    }
}
