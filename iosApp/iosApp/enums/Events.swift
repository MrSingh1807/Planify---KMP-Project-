//
//  Events.swift
//  iosApp
//
//  Created by Mayank Singh on 06/07/25.
//

import Foundation
import SwiftUI


enum Event : String, CaseIterable, Identifiable{
    var id: String { self.rawValue } // Conform to Identifiable
    
    case hobby
    case personal
    case lifestyle
    case work
    case noList
    
    var displayName: String {
        switch self {
        case .hobby:      return "Hobby"
        case .personal:   return "Personal"
        case .lifestyle:  return "Lifestyle"
        case .work:       return "Work"
        case .noList:     return "No List"
        }
    }
    
    
    var color: Color {
        switch self {
        case .hobby:      return Color(hex: "F44725")
        case .personal:   return Color(hex: "037FFF")
        case .lifestyle:  return Color(hex: "00A86B")
        case .work:       return Color(hex: "F4AF25")
        case .noList:     return Color(hex: "D3D9D9")
        }
    }
    
    
    var secondaryColor : Color {
        switch self {
        case .hobby:      return Color.rgba(244, 71, 37, 0.16)
        case .personal:   return Color.rgba(3, 127, 255, 0.16)
        case .lifestyle:  return Color.rgba(0, 168, 107, 0.16)
        case .work:       return Color.rgba(244, 175, 37, 0.16)
        case .noList:     return Color.rgba(211, 217, 217, 0.16)
        }
    }
    
}
