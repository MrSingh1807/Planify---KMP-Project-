import SwiftUI
import Shared

struct ContentView: View {
    
    private let sharedPref = SharedModule().sharedPref
    
    @EnvironmentObject private var nav: NavStack
    
    var body: some View {
        
        VStack {
            Button("Splash Screen") {
                withAnimation {
                    nav.navigate(.onboard)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        .onAppear {
            // Delay 5 seconds, then trigger navigation
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                let isAlreadyLoggedIn = sharedPref.getBoolean(key: isLoggedIn, defaultValue: false)
                
                if isAlreadyLoggedIn {
                    nav.navigate(.home)
                } else {
                    nav.navigate(.onboard)
                }
            }
            
        }
    }
    
    
//    @ViewBuilder
//    func screen(for route: Route) -> some View {
//        switch route {
//            //              case .splash: ContentView()
//        case .onboard: OnboardScreen()
//        case .login: LoginScreen()
//        case .signup: SignUpScreen()
//        case .home: HomeScreen()
//        case .profile(let id): ProfileScreen(userID: id)
//        case .statistics: StatisticsScreen()
//        case .task_group: TasksScreen()
//        case .settings: SettingScreen()
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
