//
//  TextSize.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/09.
//
/*
 Updated for Xcode 15 beta 1

 From iOS 16 and onwards, SwiftUI can animate text beautifully right out of the box – it takes no extra work from us. So, code like this smoothly animate some text between two different sizes, re-rendering the text automatically so it’s always crisp:
 */
import SwiftUI

struct TextSize: View {
    @State private var flip = false
    @State private var fontSize = 30.0
    @State private var fontSize2 = 30.0
    @State private var fontSize3 = 30.0
    
    var body: some View {
        
        VStack{
            Text("Hello, World!")
            .font(.custom("Georgia", size: fontSize))
            .onTapGesture {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1)) {
                    flip.toggle()
                    if flip{
                        fontSize = 72
                    }else{
                        fontSize = 32
                    }
                    
                }
            }
            
            
            /*
             If you need to target iOS 15 and below then SwiftUI doesn’t have a built-in way to animate text size, but we can create an animatable view modifier that makes the effect possible. This is not the same as using a simple scaleEffect() modifier – that will cause your text to become blurry when scaled up, whereas this custom animation will re-render your text correctly so it looks great at all sizes.

             This takes several steps:

             Creating an animatable view modifier that accepts a name and size, and uses the size property for its animatable data.
             Wrapping that in a View extension to make it easier to use.
             Trying it out in a SwiftUI View.
             Here’s a complete example in code:
             */
            Text("Hello, World!")
                .animatableFont(name: "Georgia", size: fontSize2)
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                        fontSize2 = 72
                    }
                }
            
            /*
             That’s it! To try it out, make an @State property to store your font size, then pass that into animatableFont().

             If you wanted to use Apple’s system fonts, the best way to do that is with a separate modifier. This way you can be sure your UI stays updated if the font ever changes.

             Here’s how that looks:
             */
            Text("Hello, World!")
                .animatableSystemFont(size: fontSize3)
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                        fontSize3 = 80
                    }
                }
        }
    }
}

// A modifier that animates a font through various sizes.
struct AnimatableCustomFontModifier: ViewModifier, Animatable {
    var name: String
    var size: Double

    var animatableData: Double {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.custom(name, size: size))
    }
}

struct AnimatableSystemFontModifier: ViewModifier, Animatable {
    var size: Double
    var weight: Font.Weight
    var design: Font.Design

    var animatableData: Double {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

extension View {
    func animatableSystemFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
    }
}

// To make that easier to use, I recommend wrapping
// it in a `View` extension, like this:
extension View {
    func animatableFont(name: String, size: Double) -> some View {
        self.modifier(AnimatableCustomFontModifier(name: name, size: size))
    }
}

struct TextSize_Previews: PreviewProvider {
    static var previews: some View {
        TextSize()
    }
}
