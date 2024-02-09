//
//  LnadmarkList.swift
//  WatchLandmarks Watch App
//
//  Created by Slash on 2023/07/13.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData : ModelData
    @State private var showFavoriteOnly : Bool = false
    
    var filteredLandMark : [Landmark]{
        modelData.landmarks.filter{landmark in
            (!showFavoriteOnly||landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{

            List{
                Toggle(isOn: $showFavoriteOnly){
                    Text("Favorite Only")
                }
                ForEach(filteredLandMark) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }

    }
}

struct LandmarkList_Previews: PreviewProvider {
    @State static var navigationEnable : Bool = false
    
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
