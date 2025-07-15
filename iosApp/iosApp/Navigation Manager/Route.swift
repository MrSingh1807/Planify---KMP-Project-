//
//  Route.swift
//  iosApp
//
//  Created by Mayank Singh on 28/06/25.
//


enum Route: Hashable {
//    case splash
    case onboard
    case login
    case signup
    case home
    case profile(userID: String)
    case statistics
    case task_group
    case settings
    case create_task
    case choose_category
    // Add more as needed
}
