//
//  DatePicker.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 15/07/24.
//

import SwiftUI

struct DatePicker: View {
    
    @ObservedObject var calendarViewModel = CalendarViewModel()
    var customDate: CustomDate
    @Binding var selectedDate: String
    @Binding var selectedDay: String
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 4){
                Text(customDate.day == calendarViewModel.nextSevenDays.first?.day
                     ? "Today" : customDate.day.prefix(1))
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.label))

                ZStack {
                    Circle()
                        .foregroundColor(selectedDate == customDate.date ? Color(UIColor.tertiarySystemBackground) : Color.clear)
                        .scaledToFit()
                    Text(customDate.date.prefix(2))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(UIColor.label))
                }
            }
            .frame(width: 40)
            
        }
    }
}
