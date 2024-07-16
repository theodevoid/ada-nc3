//
//  Location.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import Foundation

class Location {
    var city: String
    var locationName: String
    var latitude: Double
    var longitude: Double
    var description: String?
    
    init(city: String, locationName: String, latitude: Double, longitude: Double, description: String? = nil) {
        self.city = city
        self.locationName = locationName
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
    }
}
