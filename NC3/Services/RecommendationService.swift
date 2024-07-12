//
//  RecommendationService.swift
//  NC3
//
//  Created by Theodore Mangowal on 12/07/24.
//

import Foundation
import CoreLocation

class RecommendationService {
    let locations = Recommendation().getLocations()
    let weatherManager = WeatherManager.shared
    
    public func getRecommendedLocationsByDate(date: Date) async throws -> [RecommendedLocation] {
        var recommendedLocations = [RecommendedLocation]()
        
        for location in locations {
            let locationHourlyForecast = try await weatherManager.getHourlyForecastByLocationAndDate(
                for: CLLocation(latitude: location.latitude, longitude: location.longitude),
                date: date
            )
            
            let (morningForecast, afternoonForecast) = weatherManager.getMorningAndAfternoonForecast(for: locationHourlyForecast)
            
            let morningRecommendedLocation = RecommendedLocation(
                location: location,
                forecast: .init(
                    temperature: morningForecast.temperature.value,
                    uvIndex: morningForecast.uvIndex.value,
                    chanceOfRain: morningForecast.precipitationChance
                ),
                time: .morning,
                symbol: morningForecast.symbolName
            )
            
            let afternooonRecommendedLocation = RecommendedLocation(
                location: location,
                forecast: .init(
                    temperature: afternoonForecast.temperature.value,
                    uvIndex: afternoonForecast.uvIndex.value,
                    chanceOfRain: afternoonForecast.precipitationChance
                ),
                time: .afternoon,
                symbol: afternoonForecast.symbolName
            )
            
            if (determineLocationSuitability(location: morningRecommendedLocation)) {
                recommendedLocations.append(morningRecommendedLocation)
            }
            
            if (determineLocationSuitability(location: afternooonRecommendedLocation)) {
                recommendedLocations.append(afternooonRecommendedLocation)
            }
        }
        
        return recommendedLocations
    }
    
    public func getRecommendedLocationsForTheWeekend() async throws -> ([RecommendedLocation], [RecommendedLocation]){
        let (saturday, sunday) = Date.nearestWeekend(from: Date())
        
        var recommendedSaturday = try await self.getRecommendedLocationsByDate(date: saturday)
        var recommendedSunday = try await self.getRecommendedLocationsByDate(date: sunday)
        
        return (recommendedSaturday, recommendedSunday)
    }
    
    public func determineLocationSuitability(location: RecommendedLocation) -> Bool {
        let isSafeFromRain = location.forecast.chanceOfRain < 40
        let isSafeFromUV = location.forecast.uvIndex <= 5
        let isSafeFromTemperature = location.forecast.temperature <= 35 && location.forecast.temperature >= 20
        
        return isSafeFromUV && isSafeFromUV && isSafeFromTemperature
    }
}
