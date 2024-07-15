//
//  DetailScreenView.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import SwiftUI

struct DetailScreenView: View {
    
///     UI to test add to calendar
///    let currentLocation = Recommendation().locations[1]
///    let date = "2024/07/20 06:00"
///
///    let event = EventManager()

    let locations = Recommendation().getLocations()
    @State private var bookmarks = Bookmarks()
    
    
    var body: some View {
        NavigationView {
            List(locations) { location in
                NavigationLink(destination: DetailView(location: location)) {
                    HStack {
                        Text(location.locationName)

                        if bookmarks.contains(location) {
                            Spacer()
                            Image(systemName: "heart.fill")
                        }
                        
                    }
                }
            }
            .navigationTitle("Locations")
        }.environment(bookmarks)
///        Button(action: {
///            event.requestAccessAndSaveEvent(title: currentLocation.locationName, date: date)
///        }, label: {
///            Text("Add to Calendar")
///        })
    }
}

struct DetailView: View {
    
    let location : Location?
    @Environment(Bookmarks.self) var bookmarks
    
    var body: some View {
        VStack {
            Button(action: {
                if (bookmarks.contains(location!)) {
                    bookmarks.remove(location!)
                } else {
                    bookmarks.add(location!)
                }
            }, label: {
                if (bookmarks.contains(location!)) {
                    Text("Remove from Bookmarks")
                } else {
                    Text("Add to Bookmarks")
                }
            })
        }.navigationTitle(location!.locationName)
        
        
    }
}

#Preview {
    DetailScreenView()
}
