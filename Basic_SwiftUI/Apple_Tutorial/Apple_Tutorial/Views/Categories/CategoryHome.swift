import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
//    @Binding var navigationEnable: Bool
    
    var body: some View {
        
        NavigationView{
            List{
//                modelData.features[0].image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 200)
//                    .clipped()
////                    .listRowInsets(EdgeInsets(NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)))
//                    .listRowInsets(EdgeInsets())
                
                PageView(pages: modelData.features.map{ FeatureCard(landmark: $0 )})
                    .aspectRatio(3/2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self){ key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
//                .border(.black)
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
//            .border(.black)
            .navigationTitle("Featured")
//            .navigationBarTitle("Featured", displayMode: .automatic)
//            .navigationBarHidden(navigationEnable)
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
//        .onAppear{
//            self.navigationEnable = false
//        }
//        .onDisappear{
//            self.navigationEnable = true
//        }
//        .border(.black)
    }
}

struct CategoryHome_Previews: PreviewProvider {
    @State static var navigationEnable: Bool = false
    static var previews: some View {
//        CategoryHome(navigationEnable: $navigationEnable)
        CategoryHome()
            .environmentObject(ModelData())
    }
}
