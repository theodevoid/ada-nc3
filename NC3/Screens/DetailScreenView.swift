//
//  DetailScreenView.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import SwiftUI

struct DetailScreenView: View {
    
    @StateObject var detailScreenViewModel = DetailScreenViewModel()
    
    var body: some View {
        Button(action: {
            detailScreenViewModel.addToCalendar(title: detailScreenViewModel.currentLocation.locationName, date: detailScreenViewModel.date)
        }, label: {
            Text("Add to Calendar")
        })
    }
}

#Preview {
    DetailScreenView()
}
