//
//  EventManager.swift
//  NC3
//
//  Created by Gracella Noveliora on 14/07/24.
//

import Foundation
import EventKit

let eventStore: EKEventStore = EKEventStore()

class EventManager {
    
    /// Request access to calendar
    /// Save event to calendar
    ///
    /// - Parameter title: The location name
    /// - Parameter date: The event date (still in String format)
    ///
    
    var bool = false

    func requestAccessAndSaveEvent(title: String, date: Date, time: RecommendedLocationTime) {
        
        eventStore.requestFullAccessToEvents { (granted, error) in
            if granted && error == nil {
                print("Access granted: \(granted)")

                let event = EKEvent(eventStore: eventStore)
                event.title = title
                
                let calendar = Calendar.current
                
                if (time == .morning) {
                    var dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
                    dateComponents.hour = 6
                    dateComponents.minute = 0
                    dateComponents.second = 0
                    
                    let morningDate = calendar.date(from: dateComponents)
                    
                    event.startDate = morningDate
                    event.endDate = morningDate!.addingTimeInterval(60 * 60 * 2)
                } else {
                    var dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
                    dateComponents.hour = 16
                    dateComponents.minute = 0
                    dateComponents.second = 0
                    
                    let afternoonDate = calendar.date(from: dateComponents)
                    event.startDate = afternoonDate
                    event.endDate = afternoonDate!.addingTimeInterval(60 * 60 * 2)
                }
            
                event.notes = "This is a note"
                event.calendar = eventStore.defaultCalendarForNewEvents

                do {
                    try eventStore.save(event, span: .thisEvent)
                    print("Saved Event")
                    self.bool = true
                } catch let error as NSError {
                    print("Failed to save event with error: \(error)")
                }
            } else {
                print("Failed to save event with error: \(error?.localizedDescription ?? "Unknown error") or access not granted")
            }
        }
    }
    
}
