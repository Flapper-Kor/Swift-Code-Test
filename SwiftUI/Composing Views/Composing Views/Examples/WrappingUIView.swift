//
//  WrappingUIView.swift
//  Composing Views
//
//  Created by Slash on 2023/07/11.
//
/*
 Updated for Xcode 15 beta 1

 Although SwiftUI does a good job of providing many of UIKit’s UIView subclasses, it doesn’t have them all yet at this time. Fortunately, it’s not hard to create custom wrappers for a UIView that you want.

 As an example, let’s create a simple SwiftUI wrapper for UITextView as the basis of a rich text editor. This takes four steps:

 Creating a struct that conforms to UIViewRepresentable.
 Defining one property that stores the text string we are working with.
 Giving it a makeUIView() method that will return our text view.
 Adding a updateUIView() method that will be called whenever the data for the text view has changed.
 In code we end up with this:
 */
import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var text: NSMutableAttributedString

    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
    }
}

let attributes : [NSAttributedString.Key : Any] = [
    .font: UIFont.systemFont(ofSize: 30.0, weight: .semibold),
    .foregroundColor: UIColor.black,
    .strokeColor: UIColor.blue,
    .strokeWidth: 2.0,
//    .paragraphStyle: NSParagraphStyle(),
//    .backgroundColor: UIColor.lightGray,
//    .underlineStyle: NSNumber(value: 1),
    .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle
]

struct WrappingUIView: View {
    @State var text = NSMutableAttributedString(string: "터치하여 작성", attributes: attributes)
    
    var body: some View {
        TextView(text: $text)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .border(.black)
            .onTapGesture {
                if(text.string == "터치하여 작성"){
                    text = NSMutableAttributedString(string: "", attributes: attributes)
                }
            }
    }
}

struct WrappingUIView_Previews: PreviewProvider {
    static var previews: some View {
        WrappingUIView()
    }
}
