//
//  DateManager.swift
//  iosApp
//
//  Created by Mayank Singh on 29/06/25.
//

import Foundation

struct DateManager {
    
    private let date = Date()
    
    func today() -> String {
        return date.formatted(Date.FormatStyle().weekday(.wide))
    }
    
    func dateString() -> String {
        return date.formatted(date: .long, time: .omitted)
    }
    
    
    func isPastDate(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let target = calendar.startOfDay(for: date)
        return target < today
    }
    
    func formatTimestampToDateString(format : String , _ timestamp: TimeInterval,) -> String {
        let date = Date(timeIntervalSince1970: timestamp / 1000) // Convert from milliseconds to seconds
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
}
