//
//  Priority.swift
//  iosApp
//
//  Created by Mayank Singh on 14/07/25.
//

import Foundation

enum Priority: String, CaseIterable, Identifiable {
    case low
    case medium
    case high

    var id: String { self.rawValue.capitalized }
}
