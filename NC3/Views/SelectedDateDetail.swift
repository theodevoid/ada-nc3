//
//  SelectedDateDetail.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 15/07/24.
//

import SwiftUI

struct SelectedDateDetail: View {
    
    @Binding var selectedDay: String
    @Binding var selectedDate: String
    
    var body: some View {
        Text("\(selectedDay), \(selectedDate)")
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(Color(red: 0.808, green: 0.55, blue: 0.32))
            .padding(.horizontal)
    }
}

#Preview {
    SelectedDateDetail(selectedDay: .constant("Monday"), selectedDate: .constant("15 Jul 2024"))
}
