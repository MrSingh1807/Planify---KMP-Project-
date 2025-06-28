//
//  Nav.swift
//  iosApp
//
//  Created by Mayank Singh on 28/06/25.
//

import SwiftUI

@MainActor
final class NavStack: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func navigate(_ route: Route) {
        path.append(route)
    }

    func replace(with route: Route) {
        path = NavigationPath([route])
    }

    func popBackStack() {
        path.removeLast()
    }

    func reset() {
        path.removeLast(path.count - 1)
    }
}
