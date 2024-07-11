//
//  DateViewModel.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 11/07/24.
//

import SwiftUI

class CalendarViewModel: ObservableObject {
    @Published var nextSevenDays: [CustomDate] = []
    
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
        
        self.updateDates()
    }
    
    private func updateDates() {
        var dates: [CustomDate] = []
        let calendar = Calendar.current
        let today = Date()
        
        for i in 0..<10 {
            if let nextDate = calendar.date(byAdding: .day, value: i, to: today) {
                let dateString = dateFormatter.string(from: nextDate)
                let dayString = dayFormatter.string(from: nextDate)
                let timeString = timeFormatter.string(from: nextDate)
                
                let customDate = CustomDate(date: dateString, day: dayString, time: timeString)
                dates.append(customDate)
            }
        }
        
        self.nextSevenDays = dates
    }
}
