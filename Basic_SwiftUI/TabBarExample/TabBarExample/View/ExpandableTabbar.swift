import SwiftUI

struct TabbarButton: View {
    
    @Binding var selected : Int
    var numberSelected: Int
    var image: String
    
    var body: some View {
        Button(action: {
            self.selected = numberSelected
        }) {
            VStack {
                Image(systemName: image)
                    .foregroundColor(self.selected == numberSelected ? .blue : .gray)
            }
        }
    }
}
struct ExpandableTabbar : View {
    
    @Binding var selected : Int
    @State var expand = false
    @State var angle = 90.0
    
    init(selected: Binding<Int>){
        self._selected = selected
        
    }
    
    var body : some View {

        VStack{
            Spacer(minLength: 0)
            HStack {
                Spacer(minLength: 0) // 접혔을 때 왼쪽으로 붙여놓기 위해서 외부 hstack 과 spacer를 사용하였음
                HStack{
                    
                    if !self.expand {
                        
                        Button(action: {
                            self.expand.toggle()
                        }) {
                            Image(systemName: "ellipsis")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                                .rotationEffect(
                                    Angle.degrees(angle))
                        }
                    } /// if end
                    else {
                        ForEach(Array(MENU_IMAGES.allCases.enumerated()), id: \.element.rawValue)
                        {
                            index, image in
                            TabbarButton(
                                selected: $selected,
                                numberSelected: index,
                                image: image.rawValue)
                            Spacer()
                            let _ = debugPrint(index)
                        }
                        
                        Button(action: {
                            self.expand.toggle()
                        }) {
                            Image(systemName: "ellipsis")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                        }
                    } /// else end
                } /// Inner HStack end
                .padding(.vertical,self.expand ? 8.9 : 16)
                .padding(.horizontal,self.expand ? 10 : 10)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 80))
                .padding(10)
                .shadow(color: .secondary, radius: 2, x: 2, y: 2)
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.0), value: UUID())
            } /// Outer HStack end
        }
    }
}
struct ExpandableTabbar_Previews: PreviewProvider {
    @State static var selected : Int = 0
    
    static var previews: some View {
        ExpandableTabbar(selected: $selected)
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
        ExpandableTabbar(selected: $selected)
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
    }
}
