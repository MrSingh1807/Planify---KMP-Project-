//
//  Day.swift
//  iosApp
//
//  Created by Mayank Singh on 29/06/25.
//


import SwiftUI

struct Day: Identifiable {
    let id = UUID()
    let date: Date
    let isInCurrentMonth: Bool
}

class CalendarViewModel: ObservableObject {
    @Published var days: [Day] = []
    @Published var currentMonth: Date = Date()

    private let calendar = Calendar.current

    init() {
        generateDays(for: currentMonth)
    }

    func generateDays(for date: Date) {
        days.removeAll()

        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date))!
        let range = calendar.range(of: .day, in: .month, for: startOfMonth)!
        let firstWeekday = calendar.component(.weekday, from: startOfMonth)

        // Add empty days before month starts
        let paddingDays = (firstWeekday + 6) % 7
        for _ in 0..<paddingDays {
            days.append(Day(date: Date(), isInCurrentMonth: false))
        }

        for day in range {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: startOfMonth) {
                days.append(Day(date: date, isInCurrentMonth: true))
            }
        }
    }

    func goToPreviousMonth() {
        if let previous = calendar.date(byAdding: .month, value: -1, to: currentMonth) {
            currentMonth = previous
            generateDays(for: currentMonth)
        }
    }

    func goToNextMonth() {
        if let next = calendar.date(byAdding: .month, value: 1, to: currentMonth) {
            currentMonth = next
            generateDays(for: currentMonth)
        }
    }
    


    func monthYearString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: currentMonth)
    }
}
