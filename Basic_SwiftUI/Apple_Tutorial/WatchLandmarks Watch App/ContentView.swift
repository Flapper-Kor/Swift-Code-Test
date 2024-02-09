//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Slash on 2023/07/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
