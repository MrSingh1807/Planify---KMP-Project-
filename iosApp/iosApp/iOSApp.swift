import SwiftUI
import Shared

@main
struct iOSApp: App {

    init() {
        KoinInitializerIOS().initialize()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
