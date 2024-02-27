import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
//        VStack(alignment: .trailing) {
        VStack(alignment: .trailing, spacing: 0.3) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width:155, height: 155)
                .cornerRadius(5)
//                .border(.black)
            
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
//                .border(.black)
        }
        .padding(.leading, 15)
//        .border(.black)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
