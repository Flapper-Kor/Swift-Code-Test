//
//  ContainerRelativeShape.swift
//  Images, shapes, and media
//
//  Created by Slash on 2023/08/01.
//

import SwiftUI


/*
 SwiftUI has a number of built-in shapes that are self-explanatory, but there’s one that stands out: ContainerRelativeShape. This isn’t a fixed shape, but is instead designed to be an insettable version of whatever shape it’s placed inside, which is particularly important when creating home screen widgets.

 Important: At this time, ContainerRelativeShape works only inside widgets. You can use it elsewhere, but it will just make a rectangle.

 For example, we could write code that draws a blue shape in our widget, and use ContainerRelativeShape to make sure it’s the same shape as the widget itself:
 */
struct ContainerRelativeShape: View {
    var body: some View {
        ZStack {
//            ContainerRelativeShape()
//                .inset(by: 4)
//                .fill(.blue)

            Text("Hello, World!")
                .font(.title)
        }
        .frame(width: 300, height: 200)
        .background(.red)
        .clipShape(Capsule())
    }
}

struct ContainerRelativeShape_Previews: PreviewProvider {
    static var previews: some View {
        ContainerRelativeShape()
    }
}
