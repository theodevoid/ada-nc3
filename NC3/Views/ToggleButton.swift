//
//  ToggleButton.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 12/07/24.
//

import SwiftUI

struct ToggleButton: View {
    
    @Binding var selectedTime: RecommendedLocationTime
    
    var body: some View {
        Picker(selection: $selectedTime, label: Text("Time")) {
            Text("Morning").tag(RecommendedLocationTime.morning)
            Text("Afternoon").tag(RecommendedLocationTime.afternoon)
        }.background(Color(UIColor.tertiarySystemFill))
    }
}
