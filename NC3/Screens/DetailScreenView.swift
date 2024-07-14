//
//  DetailScreenView.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import SwiftUI

struct DetailScreenView: View {
    
    // UI to test add to calendar
    let currentLocation = Recommendation().locations[1]
    let date = "2024/07/20 06:00"
    
    let event = EventManager()
    
    var body: some View {
        Button(action: {
            event.requestAccessAndSaveEvent(title: currentLocation.locationName, date: date)
        }, label: {
            Text("Add to Calendar")
        })
    }
}

#Preview {
    DetailScreenView()
}
