//
//  Color.swift
//  ToDo
//
//  Created by Mayank Singh on 01/04/25.
//

import Foundation
import SwiftUICore

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        if hexSanitized.count == 6 {
            let scanner = Scanner(string: hexSanitized)
            var rgbValue: UInt64 = 0
            scanner.scanHexInt64(&rgbValue)
            
            let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgbValue & 0x0000FF) / 255.0
            
            self.init(red: red, green: green, blue: blue)
        } else {
            self.init(.gray) // fallback in case of invalid hex
        }
    }
}

extension Color {
    static func rgba(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Double) -> Color {
        return Color(
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0,
            opacity: alpha
        )
    }
}


