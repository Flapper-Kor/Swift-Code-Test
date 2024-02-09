//
//  DragNDrop_Canvas.swift
//  Animation_Example
//
//  Created by Slash on 2023/07/05.
//

import SwiftUI

struct RenderTextView: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundStyle(.red)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}


struct DragNDrop_Canvas: View {
    @Environment(\.displayScale) var displayScale
    
    let sports = [
        "figure.badminton",
        "figure.cricket",
        "figure.fencing",
        "figure.disc.sports",
        "figure.archery",
        "figure.barre",
        "figure.basketball",
        "figure.baseball",
        "figure.bowling"
    ]
    
    @State private var message = "여기에 SFSymbol을 드래그"
    @State private var resolvedImage = Image("image")
    @State private var renderedImage = Image("image")

    @MainActor func render(text : String) {
        let renderer = ImageRenderer(content: RenderTextView(text: text))

        // make sure and use the correct display scale for this device
        renderer.scale = displayScale

        if let uiImage = renderer.uiImage {
            renderedImage = Image(uiImage: uiImage)
        }
    }
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(sports, id: \.self) { sport in
                        Image(systemName: sport)
                            .frame(minWidth: 50, minHeight: 50)
                            .background(.red)
                            .foregroundStyle(.white)
                            .draggable(sport)
                            .draggable(Image(systemName: sport))
                    }
                }
            }
            
            Canvas { context, size in
                context.draw(renderedImage, in: CGRect(origin: .zero, size: size))
                
                if let resolvedImage = context.resolveSymbol(id: 1){
                    context.draw(resolvedImage, at: CGPoint(x: size.width / 2, y: size.height / 2), anchor: .center)
                }
            }symbols: {
                //MARK : Giving Image With ID
                ResolvedImage(currentImage: message)
                    .tag(1)
            }
            .dropDestination(for: String.self) { items, location in
                message = items.first ?? ""
                self.resolvedImage = Image(message)
                return true
            }
            
            .border(.black)
        }
        .onAppear{
            render(text: message)
        }
    }
}

struct DragNDrop_Canvas_Previews: PreviewProvider {
    static var previews: some View {
        DragNDrop_Canvas()
//            .environment(\.displayScale, displayScale)
    }
}
