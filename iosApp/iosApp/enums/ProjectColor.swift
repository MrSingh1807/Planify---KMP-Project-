//
//  ProjectColor.swift
//  iosApp
//
//  Created by Mayank Singh on 12/07/25.
//

import Foundation
import SwiftUI


enum ProjectColor : String, CaseIterable, Identifiable {
    
    var id: String { self.rawValue } // Conform to Identifiable
    
    
    case background1
    case selectedTextColor
    case unSelectedTextColor
    
    
    var color : Color {
        switch self {
        case .background1:  return Color(hex: "F4F6F6")
        case .selectedTextColor:  return Color.black
        case .unSelectedTextColor:  return Color(hex: "7E8491")
            
        }
    }
    
    
    
}
