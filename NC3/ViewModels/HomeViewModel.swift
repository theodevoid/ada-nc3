//
//  HomeViewModel.swift
//  NC3
//
//  Created by Leonardo Marhan on 15/07/24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var currentIndex: Int = 0
    @Published var model: [RecommendedLocation] = []
    @Published var selectedSide: String = "Morning"
    @Published var saturdayRecommendations: [RecommendedLocation] = []
    @Published var sundayRecommendations: [RecommendedLocation] = []

    private var recommendationService = RecommendationService()
    
    var filteredSaturdayRecommendations: [RecommendedLocation] {
        saturdayRecommendations.filter { $0.time == (selectedSide == "Morning" ? .morning : .afternoon) }
    }
    
    var filteredSundayRecommendations: [RecommendedLocation] {
        sundayRecommendations.filter { $0.time == (selectedSide == "Morning" ? .morning : .afternoon) }
    }

    init() {
        fetchRecommendations()
    }

    func formatDayDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMMM | h:mm a"
        return formatter.string(from: date)
    }
    
    func formatDate(date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "d MMMM yyyy"
            return formatter.string(from: date)
        }

    
    func fetchRecommendations() {
        Task {
            do {
                let (saturday, sunday) = try await recommendationService.getRecommendedLocationsForTheWeekend()
                DispatchQueue.main.async {
                    self.saturdayRecommendations = saturday
                    self.sundayRecommendations = sunday
                    self.model = saturday + sunday
                }
            } catch {
                print("Failed to fetch recommendations: \(error)")
            }
        }
    }
}

