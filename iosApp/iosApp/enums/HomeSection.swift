//
//  HomeSection.swift
//  iosApp
//
//  Created by Mayank Singh on 06/07/25.
//

import Foundation

enum HomeSection : String, CaseIterable, Identifiable{
    var id: String { self.rawValue } // Conform to Identifiable
    
    case statistics
    case task
    case settings
   

    var displayName: String {
        switch self {
        case .statistics:      return "Statistics"
        case .task:   return "Task Groups"
        case .settings:  return "Settings"
        }
    }
    
    
    var icon: String {
        switch self {
        case .statistics:      return "statistics"
        case .task:   return "task_groups"
        case .settings:  return "settings"
        }
    }
}
