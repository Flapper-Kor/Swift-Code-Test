//
//  Z_Example_GeometryReaderApp.swift
//  Z_Example_GeometryReader
//
//  Created by Flapper on 2/11/24.
//

import SwiftUI

//private struct GRPKey: EnvironmentKey {
//    static let defaultValue: GeometryProxy? = nil
//}
//
//extension EnvironmentValues {
//    var GRP: GeometryProxy? {
//        get { self[GRPKey.self] }
//        set { self[GRPKey.self] = newValue }
//    }
//}


@main
struct Z_Example_GeometryReaderApp: App {
    
    var body: some Scene {
        WindowGroup {
            ZStack{
//                GeometryReader { proxy in
                    ContentView()
//                        .environment(\.GRP, proxy)
//                }
//                .frame(alignment: .center)
            }
        }
    }
}
