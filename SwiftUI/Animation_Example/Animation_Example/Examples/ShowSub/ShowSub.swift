import SwiftUI

struct ShowSub: View {
    @State var showingSubview = false
    @Environment (\.grProxy) var grProxy

    var body: some View {
        VStack{

            HStack{
                if (showingSubview){
                    Spacer()
                }
                VStack (alignment: .center){
                    Button("Show Subview") {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            showingSubview.toggle()
                        }
                    }
                    .frame(maxWidth: .infinity)

                    if showingSubview {
                        Text("Subview")
                            .padding()
                            .background(Color.green)
                    }
                    if (showingSubview){
                        Spacer()
                    }
                }
                .padding()
                .background(Color.yellow)
                .frame(width: grProxy.size.width/2, height: grProxy.size.height/2)
                .clipped() /// 1.
                .scaleEffect(1) /// 2.
    //            .offset(x: showingSubview ? 150 : 0, y: 0)
                .border(.black)
                
                
                if(!showingSubview){
                    Spacer()
                }
            }
            if (showingSubview){
                Spacer()
            }
        }
    }
}

struct ShowSub_Previews: PreviewProvider {
    static var previews: some View {
        ShowSub()
    }
}
