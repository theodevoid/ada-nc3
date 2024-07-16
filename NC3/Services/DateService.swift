//
//  DateService.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 15/07/24.
//

import Foundation

class DateService {
    private let dateFormatter: DateFormatter
    private let dayFormatter: DateFormatter
    private let timeFormatter: DateFormatter
    
    init() {
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateStyle = .medium
        
        self.dayFormatter = DateFormatter()
        self.dayFormatter.dateFormat = "EEEE"
        
        self.timeFormatter = DateFormatter()
        self.timeFormatter.timeStyle = .short
    }
    
    func getNextSevenDays() -> [CustomDate] {
        var dates: [CustomDate] = []
        let calendar = Calendar.current
        let today = Date()
        
        for i in 0..<8 {
            if let nextDate = calendar.date(byAdding: .day, value: i, to: today) {
                let fullDate = nextDate
                let dateString = dateFormatter.string(from: nextDate)
                let dayString = dayFormatter.string(from: nextDate)
                let timeString = timeFormatter.string(from: nextDate)
                
                let customDate = CustomDate(fulldate: fullDate, date: dateString, day: dayString, time: timeString)
                dates.append(customDate)
            }
        }
        
        return dates
    }
}
