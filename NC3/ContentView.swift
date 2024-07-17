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
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                CalenderView()
                    
            }
            .tabItem {
                Label("Home", systemImage: "calendar")
            }
            .tag(0)

            NavigationStack {
                CalenderView()
                    
            }
            .tabItem {
                Label("Home", systemImage: "calendar")
            }
            .tag(1)
            

        }
        .tint(Color(UIColor.orange))
    }
}

#Preview {
    ContentView()
}
