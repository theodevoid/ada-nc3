//
//  CalendarPicker.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 11/07/24.
//

import SwiftUI


struct CalendarPicker: View {
    @ObservedObject var calendarViewModel: CalendarViewModel
    @Binding var selectedDate: String
    @Binding var selectedDay: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(calendarViewModel.nextSevenDays) { customDate in
                    DatePicker(customDate: customDate, selectedDate: $selectedDate, selectedDay: $selectedDay)
                        .onTapGesture {
                            selectedDate = customDate.date
                            selectedDay = customDate.day
                        }
                }
            }
            .padding()
        }
        .background(LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.81, green: 0.56, blue: 0.32).opacity(0.5), location: 0.00),
                Gradient.Stop(color: Color(red: 0.81, green: 0.56, blue: 0.32).opacity(0), location: 0.47),
                Gradient.Stop(color: Color(red: 0.81, green: 0.56, blue: 0.32).opacity(0.5), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0, y: 0.5),
            endPoint: UnitPoint(x: 1, y: 0.5)
        ))
        .onAppear {
            if let firstDate = calendarViewModel.nextSevenDays.first {
                selectedDate = firstDate.date
                selectedDay = firstDate.day
            }
        }
    }
}


#Preview {
    CalendarPicker(calendarViewModel: CalendarViewModel(), selectedDate: .constant("15 Jul 2024"), selectedDay: .constant("Monday"))
}
