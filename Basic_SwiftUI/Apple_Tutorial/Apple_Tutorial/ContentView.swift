import SwiftUI

struct ContentView: View {
    @State private var selection : Tab = .featured
    @State private var navigationEnable: Bool = true
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection){
//            CategoryHome(navigationEnable: $navigationEnable)
            CategoryHome()
                .tabItem{
                    Label("featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
//            LandmarkList(navigationEnable: $navigationEnable)
            LandmarkList()
                .tabItem({
                    Label("List", systemImage: "list.bullet")
                })
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
