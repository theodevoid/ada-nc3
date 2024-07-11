//
//  Locations.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import Foundation

struct Recommendation {
    let locations = [
        Location(city: "Jakarta Pusat", locationName: "Monumen Nasional", latitude: -6.175090110202744, longitude: 106.82715973200976),
        Location(city: "Jakarta Pusat", locationName: "Taman Ismail Marzuki", latitude: -6.190523341432358, longitude: 106.83851895819372),
        Location(city: "Jakarta Pusat", locationName: "Gelora Bung Karno", latitude: -6.218377879572654, longitude: 106.80314968014764),
        Location(city: "Jakarta Barat", locationName: "Kota Tua", latitude: -6.134887332378714, longitude: 106.81405498299371),
        Location(city: "Jakarta Barat", locationName: "Hutan Kota Srengseng", latitude: -6.2078096277373715, longitude: 106.78582546338775),
        Location(city: "Jakarta Barat", locationName: "Glodok Chinatown Market", latitude: -6.141373268390721, longitude: 106.8178678876332),
        Location(city: "Jakarta Utara", locationName: "Batavia PIK", latitude: -6.093302474370933, longitude: 106.74004847539916),
        Location(city: "Jakarta Utara", locationName: "Taman Impian Jaya Ancol", latitude: -6.120830369801389, longitude: 106.84305079902163),
        Location(city: "Jakarta Utara", locationName: "Mangrove Ecotourism Centre PIK", latitude: -6.121578688548888, longitude: 106.76108225330802),
        Location(city: "Jakarta Timur", locationName: "Taman Mini Indonesia Indah", latitude: -6.301782657540661, longitude: 106.89062195686209),
        Location(city: "Jakarta Timur", locationName: "Taman Cempaka", latitude: -6.32086131926508, longitude: 106.92836210432965),
        Location(city: "Jakarta Timur", locationName: "Monumen Pancasila Sakti", latitude: -6.283557610488182, longitude: 106.91098822285167),
        Location(city: "Jakarta Selatan", locationName: "Taman Margasatwa Ragunan", latitude: -6.3063830478877545, longitude: 106.82137118194929),
        Location(city: "Jakarta Selatan", locationName: "Urban Forest Cipete", latitude: -6.276450708063709, longitude: 106.80363808466818),
        Location(city: "Jakarta Selatan", locationName: "Tebet Eco Park", latitude: -6.234905596592048, longitude: 106.86030095782644),
        Location(city: "Bogor", locationName: "Kebun Raya Bogor", latitude: -6.596136807942131, longitude: 106.80390424821069),
        Location(city: "Bogor", locationName: "Taman Buah Mekarsari", latitude: -6.412251558839007, longitude: 106.99743965206189),
        Location(city: "Bogor", locationName: "Kebun Teh Puncak Bogor", latitude: -6.7024839430966106, longitude: 106.97789549154749),
        Location(city: "Depok", locationName: "Situ Rawa Besar", latitude: -6.393196120850545, longitude: 106.8169006866245),
        Location(city: "Depok", locationName: "Hutan Kota Depok", latitude: -6.385139488884015, longitude: 106.7820747931492),
        Location(city: "Depok", locationName: "Taman Bunga Wiladatika", latitude: -6.370056054970446, longitude: 106.89394390803777),
        Location(city: "Tangerang", locationName: "Scientia Square Park", latitude: -6.256231365167142, longitude: 106.61700237558101),
        Location(city: "Tangerang", locationName: "Taman Bambu", latitude: -6.193685852748541, longitude: 106.63423834434427),
        Location(city: "Tangerang", locationName: "Telaga Biru Cisoka", latitude: -6.277275513485609, longitude: 106.43274260573247),
        Location(city: "Bekasi", locationName: "Pantai Mekar", latitude: -6.023428962533171, longitude: 107.0058319688315),
        Location(city: "Bekasi", locationName: "Bukit Deltamas", latitude: -6.347711770376964, longitude: 107.18986351164001),
        Location(city: "Bekasi", locationName: "Taman Kemang Pratama", latitude: -6.269351556931544, longitude: 106.98828383570094)
    ]
    
    public func getLocations() -> [Location] {
        return locations;
    }
}
