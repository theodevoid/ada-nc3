//
//  EventManager.swift
//  NC3
//
//  Created by Gracella Noveliora on 14/07/24.
//

import Foundation
import EventKit

class EventManager {
    
    static let shared = EventManager()
    let eventStore: EKEventStore = EKEventStore()
    
    /// Request access to calendar
    /// Save event to calendar
    ///
    /// - Parameter title: The location name
    /// - Parameter date: The event date (still in String format)

    func requestAccessAndSaveEvent(title: String, date: String) {
        eventStore.requestFullAccessToEvents { (granted, error) in
            if granted && error == nil {
                print("Access granted: \(granted)")
                
                // Formatting String into date format
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm"
                let date = formatter.date(from: date)

                let event = EKEvent(eventStore: self.eventStore)
                event.title = title
                event.startDate = date
                event.endDate = date!.addingTimeInterval(60 * 60 * 2)
                event.notes = "This is a note"
                event.calendar = self.eventStore.defaultCalendarForNewEvents

                do {
                    try self.eventStore.save(event, span: .thisEvent)
                    print("Saved Event")
                } catch let error as NSError {
                    print("Failed to save event with error: \(error)")
                }
            } else {
                print("Failed to save event with error: \(error?.localizedDescription ?? "Unknown error") or access not granted")
            }
        }
    }
}
