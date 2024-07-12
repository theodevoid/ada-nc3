//
//  ToggleButton.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 12/07/24.
//

import SwiftUI


struct ToggleButton: View {
    
    @Binding var isNoon: Bool
    
    
    var body: some View {
        Toggle(isOn: $isNoon) {
        }
        .toggleStyle(SymbolToggleStyle(systemImage: "sunrise.fill", activeColor: .orange))
    }
}
