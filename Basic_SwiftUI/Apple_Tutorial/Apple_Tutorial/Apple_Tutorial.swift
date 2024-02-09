import SwiftUI

@main
struct Apple_Tutorial__2App: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
#if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
#endif
#if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
#endif
        
#if os(macOS)
Settings {
    LandmarkSettings()
}
#endif
    }
}
