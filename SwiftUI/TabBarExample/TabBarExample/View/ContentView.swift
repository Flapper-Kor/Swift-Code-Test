import SwiftUI

//public struct Options_Tabbar{
//    var value:Int = 0
//}

struct ContentView: View {
    @State private var expandableTabbarSelectedNumber : Int = 0
    
    init(){
        debugPrint("ContentView initiate...")
    }
    
    var body: some View {
        
        ZStack{
            ExpandableTabbar(selected: self.$expandableTabbarSelectedNumber)
            
            VStack {

                Canvas{ context, size in
                    if let resolvedImage = context.resolveSymbol(id: 1){
                        context.draw(resolvedImage, at: CGPoint(x: size.width / 2, y: size.height / 2), anchor: .center)
                    }

                    let _ = debugPrint(size)
                } symbols: {
                    //MARK : Giving Image With ID
//                    View()
                    Image(systemName: Array(MENU_IMAGES.allCases.enumerated())[self.expandableTabbarSelectedNumber].element.rawValue)
                        .tag(1)
                        
                        
    //                    .frame(UIScreen)
                }

                .frame(height:350)
                .border(.black, width: 2)
                .onTapGesture {
                    print("캔버스 클릭")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
