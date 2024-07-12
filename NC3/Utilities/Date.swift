//
//  Date.swift
//  NC3
//
//  Created by Theodore Mangowal on 12/07/24.
//

import Foundation

extension Date {
    static func nearestWeekend(from date: Date) -> (saturday: Date, sunday: Date) {
        var calendar = Calendar.current
        var dateComponents = DateComponents()
        let currentDateTime = Date()
        
        calendar.timeZone = TimeZone(secondsFromGMT: 7 * 3600)!
        
        // Get today's weekday (Sunday is 1, Saturday is 7)
        let weekday = calendar.component(.weekday, from: currentDateTime)
        
        // Calculate days until next Saturday
        let daysUntilSaturday = (7 - weekday + 6) % 7  // Adding 6 to ensure positive result
        
        // Calculate days until next Sunday
        let daysUntilSunday = (7 - weekday + 7) % 7  // Adding 7 to ensure positive result
        
        dateComponents.hour = 7
        
        // Set date components for Saturday
        dateComponents.day = daysUntilSaturday + 1
        guard let nextSaturday = calendar.date(byAdding: dateComponents, to: calendar.startOfDay(for: currentDateTime) ) else {
            fatalError("Error calculating next Saturday")
        }
        
        // Set date components for Sunday
        dateComponents.day = daysUntilSunday + 1
        guard let nextSunday = calendar.date(byAdding: dateComponents, to: calendar.startOfDay(for: currentDateTime)) else {
            fatalError("Error calculating next Sunday")
        }
        
        return (nextSaturday, nextSunday)
    }
}
