//
//  DateViewModel.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 11/07/24.
//

import Foundation
import Combine

enum CalendarViewModelStatus{
    case loading
    case result
}


class CalendarViewModel: ObservableObject {
    @Published var nextSevenDays: [CustomDate] = []
    @Published var recommendedLocation: [RecommendedLocation] = []
    @Published var status: CalendarViewModelStatus = .result
    
    private let dateService: DateService
    private let recommendationService = RecommendationService()
    
    init(dateService: DateService = DateService()) {
        self.dateService = dateService
        self.updateDates()
    }
    
    public func getRecommendationCalendar(date: Date){
        
        Task{
            status = .loading
            let locations = try await recommendationService.getRecommendedLocationsByDate(date: date)
            
            recommendedLocation = locations
            status = .result
        }
    }
    
    private func updateDates() {
        self.nextSevenDays = dateService.getNextSevenDays()
    }
}

