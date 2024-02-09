//
//  Composing_ViewsApp.swift
//  Composing Views
//
//  Created by Slash on 2023/07/09.
//

import SwiftUI


private struct GeomeryReaderProxyEnvironmentKey: EnvironmentKey {
    static let defaultValue: (size: CGSize, leading:CGFloat, trailing:CGFloat, top: CGFloat, bottom: CGFloat) = (CGSize(width: 0,height: 0), 0, 0, 0, 0)
}

extension EnvironmentValues {
    var grProxy: (size: CGSize, leading:CGFloat, trailing:CGFloat, top: CGFloat, bottom: CGFloat) {
        get { self[GeomeryReaderProxyEnvironmentKey.self] }
        set { self[GeomeryReaderProxyEnvironmentKey.self] = newValue }
    }
}

@main
struct Composing_ViewsApp: App {
    @State private var grProxy: (size: CGSize, leading:CGFloat, trailing:CGFloat, top: CGFloat, bottom: CGFloat) = GeomeryReaderProxyEnvironmentKey.defaultValue
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                GeometryReader { proxy in
                    Color.clear.onAppear {
                        grProxy = (proxy.size, proxy.safeAreaInsets.leading, proxy.safeAreaInsets.trailing, proxy.safeAreaInsets.top, proxy.safeAreaInsets.bottom)
                    }
                }
                ContentView()
                    .environment(\.grProxy, grProxy)
            }
        }
    }
}
