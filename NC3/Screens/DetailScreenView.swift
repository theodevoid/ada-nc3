//
//  DetailScreenView.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import SwiftUI
import SwiftData

struct DetailScreenView: View {
    
///     UI to test add to calendar
///    let currentLocation = Recommendation().locations[1]
///    let date = "2024/07/20 06:00"
///
///    let event = EventManager()
    
    @Query var recommendedLocations: [RecommendedLocation]
    @Environment(\.modelContext) var modelContext
    
    @State var locationsData: [RecommendedLocation] = []
    
    let recommendationService = RecommendationService()
    
    var body: some View {
        NavigationView {
            List(locationsData) { recLoc in
                NavigationLink(destination: DetailView(recommendedLocation: recLoc)) {
                    HStack {
                        Text(recLoc.location.locationName)
                        Text("\(recLoc.time)")
                        if (contains(recLoc)) {
                            Spacer()
                            Image(systemName: "heart.fill")
                        }
                    }
                }
            }
            .navigationTitle("Locations")
        }
        .onAppear {
            Task {
                let (locations, _) = try await self.recommendationService.getRecommendedLocationsForTheWeekend()
                
                locationsData = locations
            }
        }
    }
    
    func contains(_ recommendedLocation: RecommendedLocation) -> Bool {
        for recLoc in recommendedLocations {
            if ((recLoc.location.locationName == recommendedLocation.location.locationName) && (recLoc.time == recommendedLocation.time)) {
            return true
        }
    }
    return false

    }
}

struct DetailView: View {
    
    @Query var recommendedLocations: [RecommendedLocation]
    @Environment(\.modelContext) var modelContext
    let recommendedLocation : RecommendedLocation?
    let event = EventManager()
    
    
    var body: some View {
        VStack {
            Button(action: {
                if (contains(recommendedLocation!)) {
                    remove(recommendedLocation!)
                } else {
                    add(recommendedLocation!)
                }
            }, label: {
                if (contains(recommendedLocation!)) {
                    Text("Remove from Bookmarks")
                } else {
                    Text("Add to Bookmarks")
                }
            })
            
            Button(action: {
                if (event.bool) {
                    
                } else {
                    event.requestAccessAndSaveEvent(title: recommendedLocation!.location.locationName, date: recommendedLocation!.date, time: recommendedLocation!.time)
                }
            }, label: {
                if (event.bool) {
                    Text("Disabled")
                } else {
                    Text("Add to calendar")
                }
            })
        }.navigationTitle((recommendedLocation?.location.locationName)!)
    }
    
    func contains(_ recommendedLocation: RecommendedLocation) -> Bool {
        for recLoc in recommendedLocations {
            if ((recLoc.location.locationName == recommendedLocation.location.locationName) && (recLoc.time == recommendedLocation.time)) {
                return true
            }
        }
        return false
    }
    
    func add(_ recommendedLocation: RecommendedLocation) {
        modelContext.insert(recommendedLocation)
    }
    
    // remove dr array
    func remove(_ recommendedLocation: RecommendedLocation) {
        modelContext.delete(recommendedLocation)
    }
}
//
//#Preview {
//    DetailScreenView()
//}
