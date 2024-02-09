import SwiftUI
import CoreGraphics
import CoreFoundation

struct DragNDrop: View {

    let sports = ["figure.badminton", "figure.cricket", "figure.fencing"]
    @State private var dropImage = Image(systemName: "photo")

    var body: some View {
        VStack {
            HStack {
                ForEach(sports, id: \.self) { sport in
                    Image(systemName: sport)
                        .frame(minWidth: 50, minHeight: 50)
                        .background(.red)
                        .foregroundStyle(.white)
                        .draggable(Image(systemName: sport))
                }
            }
            .frame(minWidth: 300, minHeight: 70)
            .background(.gray)

            dropImage
                .frame(width: 150, height: 150)
                .background(.green)
                .foregroundStyle(.white)
                .dropDestination(for: Image.self) { items, location in
                    dropImage = items.first ?? Image(systemName: "photo")
                    return true
                }
        }
    }
}


struct DragNDrop_Previews: PreviewProvider {
    static var previews: some View {
        DragNDrop()
    }
}
