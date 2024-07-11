//
//  CalenderView.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 11/07/24.
//

import SwiftUI

struct CalenderView: View {
    
    @State private var date = Date()
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        return min...max
    }

    var body: some View {
        VStack {
            DatePicker(
                    "Start Date",
                    selection: $date,
                    in: dateClosedRange,
                    displayedComponents: [.date]
                )
            .datePickerStyle(.graphical)
            
            ScrollView(.horizontal){
                HStack(spacing: 20){
                    CalendarPicker()
                    CalendarPicker()
                    CalendarPicker()
                    CalendarPicker()
                    CalendarPicker()
                    CalendarPicker()
                    CalendarPicker()
                    CalendarPicker()
                    CalendarPicker()
                    CalendarPicker()
                }
            }
            .padding()
            
            
            Spacer()

        }
    }
}

#Preview {
    CalenderView()
}

struct CalendarPicker: View {
    var body: some View {
        VStack(spacing: 10){
            Text("MON")
                .font(.footnote)
            Text("1")
        }
    }
}
