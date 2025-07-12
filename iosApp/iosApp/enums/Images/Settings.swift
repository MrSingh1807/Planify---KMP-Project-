//
//  SettingIcon.swift
//  iosApp
//
//  Created by Mayank Singh on 12/07/25.
//

import Foundation


enum Settings : String, CaseIterable, Identifiable {
    
    var id: String { self.rawValue } // Conform to Identifiable
    
    case change_password
    case go_premium
    case theme
    case color_scheme
    case feedback
    case rate_us
    case terms
    case about_us
    case logout
    
    var value : String {
        switch self {
        case .change_password: return "Change Password"
        case .go_premium: return "Go Premium"
        case .theme: return "Theme"
        case .color_scheme: return "Color Scheme"
        case .feedback: return "Feedback"
        case .rate_us: return "Rate Us"
        case .terms: return "Terms"
        case .about_us: return "About Us"
        case .logout: return "Logout"
        }
    }
    
    var icon : String {
        switch self {
        case .change_password: return "change_password"
        case .go_premium: return "go_premium"
        case .theme: return "theme"
        case .color_scheme: return "color_scheme"
        case .feedback: return "feedback"
        case .rate_us: return "rate_us"
        case .terms: return "terms_of_use"
        case .about_us: return "about_us"
        case .logout: return "logout"
        }
    }
    
}
