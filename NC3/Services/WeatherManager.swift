//
//  WeatherManager.swift
//  NC3
//
//  Created by Gracella Noveliora on 11/07/24.
//

import Foundation
import WeatherKit
import CoreLocation

let currentDate = Date()
let endDate = Calendar.current.date(byAdding: .day, value: 8, to: currentDate)!

class WeatherManager {
    static let shared = WeatherManager()
    let service = WeatherService.shared
    
    // Fetch hourly forecast
    func hourlyForecast(for location: CLLocation) async -> Forecast<HourWeather>? {
        let hourlyForecast = await Task.detached(priority: .userInitiated) {
            let forecast = try? await self.service.weather(
                for: location,
                including: .hourly(startDate: currentDate, endDate: endDate)
            )
            return forecast
        }.value
        return hourlyForecast
    }
    
    // Function that filter hourly forecast into 6 - 8 am and 4 - 6 pm
    func filteredHourlyForecast(for location: CLLocation) async -> [HourWeather]? {
        guard let hourlyForecast = await hourlyForecast(for: location) else {
            return nil
        }
        
        // Filter the forecast for the specific times
        let filteredForecast = hourlyForecast.forecast.filter { hourWeather in
            let hour = Calendar.current.component(.hour, from: hourWeather.date)
            return (6...8).contains(hour) || (16...18).contains(hour)
        }
        
        return filteredForecast
    }
    
}

