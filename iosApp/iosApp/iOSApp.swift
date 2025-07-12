import SwiftUI
import Shared

@main
struct iOSApp: App {
    
    init() {
        KoinInitializerIOS().initialize()
    }
    
    @StateObject private var nav = NavStack()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $nav.path) {
                ContentView()
                    .navigationDestination(for: Route.self) { route in
                        screen(for: route)
                    }
            }
            .toolbar(.hidden, for: .navigationBar)
            .environmentObject(nav)
        }
    }
    
    @ViewBuilder
      func screen(for route: Route) -> some View {
          switch route {
//              case .splash: ContentView()
              case .onboard: OnboardScreen()
              case .login: LoginScreen()
              case .signup: SignUpScreen()
              case .home: HomeScreen()
              case .profile(let id): ProfileScreen(userID: id)
          case .task_group : TasksScreen()
              case .settings: SettingScreen()
          case .statistics: StatisticsScreen()
          }
      }
    
    
}
