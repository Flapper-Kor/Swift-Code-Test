//
//  Blurring.swift
//  Drawing
//
//  Created by Slash on 2023/07/05.
//

/*
 Updated for Xcode 15 beta 1
 New in iOS 15

 SwiftUI has a brilliantly simple equivalent to UIVisualEffectView, that combines ZStack, the background() modifier, and a range of built-in materials.
 For example, this places some text over an image, applying a standard blur effect to the text:
 */
import SwiftUI

struct Blurring: View{
    var body: some View{
        ZStack {
            Image("singapore")
                .resizable()
                .scaledToFit()
                .clipped()
            
/*
 You can adjust the “thickness” of your material – how much of the background content shines through – by using one of several material types. From thinnest to thickest, they are:

 .ultraThinMaterial
 .thinMaterial
 .regularMaterial
 .thickMaterial
 .ultraThickMaterial
 
 If you’re using the secondary foreground style, SwiftUI automatically adjusts the text color so that it has a vibrant effect and can stand out from the background:
 */
            Text("Visit Singapore")
                .foregroundStyle(.secondary)
                .padding()
                .background(.ultraThinMaterial)
//                .background(.thinMaterial)
        }
    }
}

struct Blurring_Previews: PreviewProvider {
    static var previews: some View {
        Blurring()
    }
}
