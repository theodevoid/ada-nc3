//
//  RecommendedLocation.swift
//  NC3
//
//  Created by Theodore Mangowal on 12/07/24.
//

import Foundation
import SwiftData

struct SimplifiedForecast: Codable {
    var temperature: Double
    var uvIndex: Int
    var chanceOfRain: Double
    
    init (temperature: Double, uvIndex: Int, chanceOfRain: Double) {
        self.temperature = temperature
        self.uvIndex = uvIndex
        self.chanceOfRain = chanceOfRain
    }
}

enum RecommendedLocationTime: Codable {
    case morning
    case afternoon
}

@Model
class RecommendedLocation: Identifiable, Hashable {
    var id: String
    var location: Location
    var forecast: SimplifiedForecast
    var time: RecommendedLocationTime
    var symbol: String
    var date: Date
    
    init (location: Location, forecast: SimplifiedForecast, time: RecommendedLocationTime, symbol: String, date: Date) {
        self.location = location
        self.forecast = forecast
        self.time = time
        self.symbol = symbol
        self.date = date
        self.id = location.locationName + date.formatted() + "\(time)"
    }
}
