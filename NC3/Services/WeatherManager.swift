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
    
    /// Returns the hourly forecast of a given location
    ///
    /// - Parameter location: The requested location
    /// - Returns: The hourly forecast of a location
    ///
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
    
    /// Returns the hourly forecast of a given location between 6 - 8 AM and 4 - 6 PM
    ///
    /// - Parameter location: The requested location
    /// - Returns: Hourly forecast of a location filtered only between 6 - 8 AM and 4 - 6 PM
    ///
    func filteredHourlyForecast(for location: CLLocation) async -> [HourWeather]? {
        guard let hourlyForecast = await hourlyForecast(for: location) else {
            return nil
        }
        
        // Filter the forecast for the specific times
        let filteredForecast = hourlyForecast.forecast.filter { hourWeather in
            let hour = Calendar.current.component(.hour, from: hourWeather.date)
            return (6...).contains(hour) || (16...).contains(hour)
        }
        
        return filteredForecast
    }
    
    /// Returns the hourly forecast of a give location on a specific date
    ///
    /// - Parameter location: The requested location
    /// - Parameter date: The specific date to check the weather for
    /// - Returns: Hourly forecast of a location on the specified date
    ///
    func getHourlyForecastByLocationAndDate(for location: CLLocation, date: Date) async throws -> Forecast<HourWeather> {
        let calendar = Calendar.current
        
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: tomorrow)
        dateComponents.hour = 23
        dateComponents.minute = 59
        dateComponents.second = 59
        
        let hourlyForecast = try await Task.detached(priority: .userInitiated) {
            let forecast = try await self.service.weather(
                for: location,
                including: .hourly(startDate: date, endDate: endDate)
            )
            return forecast
        }.value
        
        return hourlyForecast
    }
    
    func getMorningAndAfternoonForecast(for forecast: Forecast<HourWeather>) -> (HourWeather, HourWeather) {
        let morningForecast = forecast.filter { hourWeather in
            let hour = Calendar.current.component(.hour, from: hourWeather.date)
            return (6...).contains(hour)
        }.first!
        
        let afternoonForecast = forecast.filter { hourWeather in
            let hour = Calendar.current.component(.hour, from: hourWeather.date)
            return (16...).contains(hour)
        }.first!
        
        return (morningForecast, afternoonForecast)
    }
    
    var temperatureFormatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.numberFormatter.maximumFractionDigits = 0
        return formatter
    }()
}

