//
//  CalendarPicker.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 11/07/24.
//

import SwiftUI


struct CalendarPicker: View {
    
    var customDate: CustomDate
    @Binding var selectedDate: String
    @Binding var selectedDay: String
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 4){
                Text(customDate.day.prefix(1))
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(customDate.day == "Sunday" || customDate.day == "Saturday" ? Color.red : Color.black)
                ZStack {
                    Circle()
                        .foregroundColor(selectedDate == customDate.date ? Color.white : Color.clear)
                        .scaledToFit()
                    Text(customDate.date.prefix(2))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
            .frame(width: 40)
            
        }
    }
}

#Preview {
    CalendarPicker(customDate: CustomDate(date: "12", day: "MON", time: "a"), selectedDate: .constant("12"), selectedDay: .constant("MON"))
}
