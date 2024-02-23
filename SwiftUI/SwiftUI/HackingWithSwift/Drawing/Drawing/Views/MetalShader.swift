//
//  MetalShader.swift
//  Drawing
//
//  Created by Slash on 2023/07/05.
//
/*
 Updated for Xcode 15 beta 1

 New in iOS 17

 SwiftUI provides extensive integration with Metal shaders, right at the very view level – we can manipulate colors, shapes, and more with remarkable performance.

 Trying this out takes three steps:

 Creating a Metal file with your shader. This must have an exact function signature, which varies depending on what kind of effect you’re trying to apply.
 Creating your SwiftUI views, and attaching one or more effect.
 Optionally adding a visual effect to your view, in order to read the view’s size without changing its layout.
 I’ve created a selection of Metal shaders for you to try out here: sample SwiftUI Metal shaders. Each one looks a bit like this:
 */


// 아직 베타 버전에서 가능한 기능들인 듯

//
//import SwiftUI
//
//struct MetalShader: View {
//    var body: some View {
//        Image(systemName: "figure.run.circle.fill")
//            .font(.system(size: 300))
//            .colorEffect(ShaderLibrary.checkerboard(.float(10), .color(.blue)))
//    }
//}
//
//struct MetalShader_Previews: PreviewProvider {
//    static var previews: some View {
//        MetalShader()
//    }
//}
