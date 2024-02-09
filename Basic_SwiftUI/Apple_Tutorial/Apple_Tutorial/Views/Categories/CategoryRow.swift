import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items:[Landmark]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
//                .border(.black)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(items){ landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        }label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
//            .border(.black)
            .frame(height: 185)
            
        }
//        .border(.black)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
            )
    }
}
