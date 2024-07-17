//
//  Location.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import Foundation

struct Location: Identifiable, Codable {
    var id = UUID()
    var city: String
    var locationName: String
    var latitude: Double
    var longitude: Double
    var desc: String?
    var map: String
    
    init(city: String, locationName: String, latitude: Double, longitude: Double, description: String? = nil, map: String) {
        self.city = city
        self.locationName = locationName
        self.latitude = latitude
        self.longitude = longitude
        self.desc = description
        self.map = map
    }
}
