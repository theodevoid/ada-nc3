//
//  ContentView.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import SwiftUI
import SwiftData
import CoreLocation

struct ContentView: View {
    let recommendationService = RecommendationService()
    let cl = CLLocationManager()
    
    var body: some View {
        VStack {
            Text("Hello World")
        }
        .onAppear {
            cl.requestWhenInUseAuthorization()
            Task {
                try await recommendationService.getRecommendedLocationsForTheWeekend()
            }
        }
    }
}

#Preview {
    ContentView()
}
