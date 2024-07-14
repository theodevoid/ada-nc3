//
//  ToggleButton.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 12/07/24.
//

import SwiftUI

struct ToggleButton: View {
    
    @Binding var selectedTime: String
    
    var body: some View {
        Picker(selection: $selectedTime, label: Text("Time")) {
            Text("Morning").tag("Morning")
            Text("Noon").tag("Noon")
        }
    }
}
