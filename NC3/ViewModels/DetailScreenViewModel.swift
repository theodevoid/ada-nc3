//
//  DetailScreenViewModel.swift
//  NC3
//
//  Created by Gracella Noveliora on 15/07/24.
//

import Foundation

class DetailScreenViewModel: ObservableObject {
    private let event = EventManager()
    
    @Published var currentLocation = Recommendation().locations[1]
    @Published var date = "2024/07/20 06:00"
    
    public func addToCalendar (title: String, date: String) {
        event.requestAccessAndSaveEvent(title: title, date: date)
    }
    
}
