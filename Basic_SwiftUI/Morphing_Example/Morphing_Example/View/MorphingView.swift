import SwiftUI

struct MorphingView: View {
    @State var currentImage: CustomShape = .cloud
    
    var body: some View {
        
        VStack{
            // MARK : Morphing Shapes With the Help of Canvas and Filters
            Canvas{context, size in
                if let resolvedImage = context.resolveSymbol(id: 1){
                    context.draw(resolvedImage, at: CGPoint(x: size.width / 2, y: size.height / 2), anchor: .center)
                }
            } symbols: {
                //MARK : Giving Image With ID
                ResolvedImage(currentImage: $currentImage)
                    .tag(1)
            }
            .frame(height:350)
            Picker("", selection: $currentImage){
                ForEach(CustomShape.allCases, id: \.rawValue){ shape in
                    Image(systemName: shape.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(15)
        }
    }
}

struct ResolvedImage: View{
    @Binding var currentImage: CustomShape
    
    var body: some View{
        Image(systemName : currentImage.rawValue)
            .font(.system(size:200))
            .frame(width:300, height: 300)
    }
}

struct MorphingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
