//
//  Locations.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import Foundation

struct Recommendation {
    let locations = [
        Location(city: String(localized: "Central Jakarta"), locationName: "Monumen Nasional", latitude: -6.175090110202744, longitude: 106.82715973200976, description: String(localized: "The National Monument of Indonesia, symbolizing the fight for independence."), map: "https://maps.app.goo.gl/boeRTHztuxJEB3P28"),
        Location(city: String(localized: "Central Jakarta"), locationName: "Taman Ismail Marzuki", latitude: -6.190523341432358, longitude: 106.83851895819372, description: String(localized: "A cultural center in Jakarta, featuring theaters, galleries, and a planetarium."), map: "https://maps.app.goo.gl/QMaA3rQtsGVvsXfP8"),
        // Location(city: String(localized: "Central Jakarta"), locationName: "Gelora Bung Karno", latitude: -6.218377879572654, longitude: 106.80314968014764, description: String(localized: "A large sports complex in Jakarta, home to the main stadium."), map: "https://maps.app.goo.gl/XXm2JYLDz4oAvjyM6"),
        Location(city: String(localized: "West Jakarta"), locationName: "Kota Tua", latitude: -6.134887332378714, longitude: 106.81405498299371, description: String(localized: "The old town area of Jakarta, known for its Dutch colonial buildings."), map: "https://maps.app.goo.gl/yuAhMYVUdpGEkgq27"),
        Location(city: String(localized: "West Jakarta"), locationName: "Hutan Kota Srengseng", latitude: -6.2078096277373715, longitude: 106.78582546338775, description: String(localized: "An urban forest park offering greenery and recreational activities."), map: "https://maps.app.goo.gl/7wiDwHmrEymYPWRAA"),
        //Location(city: String(localized: "West Jakarta"), locationName: "Glodok Chinatown Market", latitude: -6.141373268390721, longitude: 106.8178678876332, description: String(localized: "A bustling market in Jakarta's Chinatown, known for its food and cultural items."), map: "https://maps.app.goo.gl/9C45oiWNkMr85iZPA"),
        Location(city: String(localized: "North Jakarta"), locationName: "Batavia PIK", latitude: -6.093302474370933, longitude: 106.74004847539916, description: String(localized: "A modern waterfront area with dining, entertainment, and leisure activities."), map: "https://maps.app.goo.gl/cdPSYpsuZKzH4sXc7"),
        Location(city: String(localized: "North Jakarta"), locationName: "Taman Impian Jaya Ancol", latitude: -6.120830369801389, longitude: 106.84305079902163, description: String(localized: "A large recreational park with beaches, amusement parks, and sea world."), map: "https://maps.app.goo.gl/BNjsLsBYWQqUvUnJA"),
        //Location(city: String(localized: "North Jakarta"), locationName: "Mangrove Ecotourism Centre PIK", latitude: -6.121578688548888, longitude: 106.76108225330802, description: String(localized: "An ecotourism area focused on mangrove conservation."), map: "https://maps.app.goo.gl/WX8Wks7m2CaF5WvP8"),
        Location(city: String(localized: "East Jakarta"), locationName: "Taman Mini Indonesia Indah", latitude: -6.301782657540661, longitude: 106.89062195686209, description: String(localized: "A cultural park showcasing the diversity of Indonesian culture."), map: "https://maps.app.goo.gl/BK92fqyPsQrn4pEH9"),
        Location(city: String(localized: "East Jakarta"), locationName: "Taman Cempaka", latitude: -6.32086131926508, longitude: 106.92836210432965, description: String(localized: "A local park offering green space and recreational facilities."), map: "https://maps.app.goo.gl/89PXnxAo7Xfusm3T9"),
        //Location(city: String(localized: "East Jakarta"), locationName: "Monumen Pancasila Sakti", latitude: -6.283557610488182, longitude: 106.91098822285167, description: String(localized: "A monument commemorating the heroes of the Pancasila movement."), map: "https://maps.app.goo.gl/ANuCEcdR75ZJxBTNA"),
        Location(city: String(localized: "South Jakarta"), locationName: "Taman Margasatwa Ragunan", latitude: -6.3063830478877545, longitude: 106.82137118194929, description: String(localized: "A large zoo in Jakarta, home to various animal species."), map: "https://maps.app.goo.gl/hzuMtjPHbncSYapm9"),
        Location(city: String(localized: "South Jakarta"), locationName: "Urban Forest Cipete", latitude: -6.276450708063709, longitude: 106.80363808466818, description: String(localized: "A small urban forest providing a green oasis in the city."), map: "https://maps.app.goo.gl/mzrF66SVmezt8Eo46"),
        //Location(city: String(localized: "South Jakarta"), locationName: "Tebet Eco Park", latitude: -6.234905596592048, longitude: 106.86030095782644, description: String(localized: "An eco-friendly park focusing on sustainability and recreation."), map: "https://maps.app.goo.gl/DQTzWttEz6i49aPn9"),
        Location(city: String(localized: "Bogor"), locationName: "Kebun Raya Bogor", latitude: -6.596136807942131, longitude: 106.80390424821069, description: String(localized: "A botanical garden in Bogor, known for its vast plant collections."), map: "https://maps.app.goo.gl/ezagv7AJDgZzXsKG7"),
        Location(city: String(localized: "Bogor"), locationName: "Taman Buah Mekarsari", latitude: -6.412251558839007, longitude: 106.99743965206189, description: String(localized: "A large fruit garden and recreational park in Bogor."), map: "https://maps.app.goo.gl/qR8T9ZZPNtSBj8SQ6"),
        //Location(city: String(localized: "Bogor"), locationName: "Kebun Teh Puncak Bogor", latitude: -6.7024839430966106, longitude: 106.97789549154749, description: String(localized: "A scenic tea plantation in the Puncak area of Bogor."), map: "https://maps.app.goo.gl/9ApELH1BApKc3K7c7"),
        Location(city: String(localized: "Depok"), locationName: "Situ Rawa Besar", latitude: -6.393196120850545, longitude: 106.8169006866245, description: String(localized: "A lake in Depok, popular for fishing and boating."), map: "https://maps.app.goo.gl/EsEkiMsAMErV9ydf9"),
        Location(city: String(localized: "Depok"), locationName: "Hutan Kota Depok", latitude: -6.385139488884015, longitude: 106.7820747931492, description: String(localized: "An urban forest in Depok, offering green space and nature trails."), map: "https://maps.app.goo.gl/9RVEJ9hWgKza8ndJA"),
        //Location(city: String(localized: "Depok"), locationName: "Taman Bunga Wiladatika", latitude: -6.370056054970446, longitude: 106.89394390803777, description: String(localized: "A flower garden in Depok, known for its colorful displays."), map: "https://maps.app.goo.gl/e4oYA4pPDhkDWyWK6"),
        Location(city: String(localized: "Tangerang"), locationName: "Scientia Square Park", latitude: -6.256231365167142, longitude: 106.61700237558101, description: String(localized: "A modern park in Tangerang, featuring various outdoor activities."), map: "https://maps.app.goo.gl/q7Ak6JjZ1LDWxuCF9"),
        Location(city: String(localized: "Tangerang"), locationName: "Taman Bambu", latitude: -6.193685852748541, longitude: 106.63423834434427, description: String(localized: "A bamboo-themed park in Tangerang."), map: "https://maps.app.goo.gl/WfEYF7LdF7LZqt7y9"),
        //Location(city: String(localized: "Tangerang"), locationName: "Telaga Biru Cisoka", latitude: -6.277275513485609, longitude: 106.432742605, description: String(localized: "A picturesque blue lake in Tangerang."), map: "https://maps.app.goo.gl/NrThv8146NzLVbxV8"),
        Location(city: String(localized: "Bekasi"), locationName: "Pantai Mekar", latitude: -6.023428962533171, longitude: 107.0058319688315, description: String(localized: "A coastal area in Bekasi, popular for beach activities."), map: "https://maps.app.goo.gl/qw5Sbg4iL5sQwhsU6"),
        Location(city: String(localized: "Bekasi"), locationName: "Bukit Deltamas", latitude: -6.347711770376964, longitude: 107.18986351164001, description: String(localized: "A residential and commercial area in Bekasi."), map: "https://maps.app.goo.gl/dSudhpPK1NJFBqsx9")
    ]
    
    public func getLocations() -> [Location] {
        return locations;
    }
}
