//
//  Caros.swift
//  iosApp
//
//  Created by Mayank Singh on 06/07/25.
//

import Foundation

enum Caros : String, CaseIterable, Identifiable {
    
    var id: String { self.rawValue } // Conform to Identifiable
    
    
    case regular
    case medium
    case bold
    
    var font: String {
        switch self {
        case .regular:      return "Caros"
        case .medium:   return "Caros Medium"
        case .bold:  return "Caros Bold"
        }
    }
    
    
    
}
