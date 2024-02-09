//
//  ModifierForUIViewRepresentable.swift
//  Composing Views
//
//  Created by Slash on 2023/07/11.
//

import SwiftUI
/*
 Updated for Xcode 15 beta 1

 Wrapping a UIView in a UIViewRepresentable struct is a great way to bring existing UIKit into your SwiftUI app, and you can even add your own custom modifiers to adjust the way the view works at runtime.

 To make this work, you should create private properties for all the values you want to adjust on the underlying UIView, then create methods to adjust them. Each of these methods should take a copy of your SwiftUI representable – not the underlying UIView – then adjust the private properties you created earlier to reflect the new state.

 Once that’s done, SwiftUI will ensure your updateUIView() method is triggered, at which point you copy your private properties into the UIView to make sure it’s updated.

 As an example, you could create a UIViewRepresentable to bridge UISearchBar into SwiftUI, but you might want some aspect of it to be customizable, such as its placeholder text. First you create the representable with an extra private property for its placeholder:

 */

struct SearchField: UIViewRepresentable {
    @Binding var text: String

    private var placeholder = ""

    init(text: Binding<String>) {
        _text = text
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.placeholder = placeholder
        return searchBar
    }

    // Always copy the placeholder text across on update
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
        uiView.placeholder = placeholder
    }
}

/*
 Second, create a modifier on that representable to adjust the private property:
 */
// Any modifiers to adjust your search field – copy self, adjust, then return.
extension SearchField {
    func placeholder(_ string: String) -> SearchField {
        var view = self
        view.placeholder = string
        return view
    }
}
/*
 And now you’re all set to use it. For example, this creates a SearchField view with our placeholder() modifier, but every time the button is clicked we randomize the placeholder so you can see everything in action:
 */

struct ModifierForUIViewRepresentable: View {
    @State private var text = ""
    @State private var placeHolder = "Hello, world!"

    var body: some View {
        VStack {
            SearchField(text: $text)
                .placeholder(placeHolder)
            

            Button("Tap me") {
                // randomize the placeholder every press, to
                // prove this works
                placeHolder = UUID().uuidString
            }
        }
    }
}

struct ModifierForUIViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        ModifierForUIViewRepresentable()
    }
}
